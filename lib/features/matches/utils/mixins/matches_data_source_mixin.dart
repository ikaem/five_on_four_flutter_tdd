// TODO moce to mixins
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:five_on_four_flutter_tdd/features/matches/data/data_sources/matches_remote/data_source.dart';
import 'package:five_on_four_flutter_tdd/features/matches/data/dtos/match_participant_remote/dto.dart';
import 'package:five_on_four_flutter_tdd/features/matches/data/dtos/match_remote/dto.dart';
import 'package:five_on_four_flutter_tdd/features/matches/domain/enums/match_participant_status.dart';
import 'package:five_on_four_flutter_tdd/features/matches/presentation/state/controllers/matches_in_region/providers/provider.dart';
import 'package:five_on_four_flutter_tdd/features/matches/utils/constants/matches_firebase_constants.dart';
import 'package:five_on_four_flutter_tdd/libraries/firebase/cloud_firestore/firebase_firestore_wrapper.dart';

mixin MatchesRemoteAppDataSourceMixin on MatchesRemoteDataSource {
  List<MatchRemoteDTO> _normalizeRegionMatchesFromCoordinatesBoundedMatches({
    required List<MatchRemoteDTO> coordinateBoundedMatches,
    required RegionCoordinatesBoundariesValue coordinatesBoundaries,
  }) {
    final Map<String, MatchRemoteDTO> filteredMatchesMap = {
      for (final match in coordinateBoundedMatches) match.id: match
    };

    final List<MatchRemoteDTO> filteredMatches =
        filteredMatchesMap.values.toList();

    final List<MatchRemoteDTO> matchingMatchesInRegion = filteredMatches.where(
      (match) {
        final double? matchLatitude = match.location.cityLatitude;
        final double? matchLongitude = match.location.cityLongitude;

        final bool hasLocation =
            matchLatitude != null && matchLongitude != null;
        if (!hasLocation) return false;

        final bool isMatchInLatitudeBoundaries =
            matchLatitude >= coordinatesBoundaries.latitudeLower &&
                matchLatitude <= coordinatesBoundaries.latitudeUpper;
        final bool isMatchInLongitudeBoundaries =
            matchLongitude >= coordinatesBoundaries.longitudeLower &&
                matchLongitude <= coordinatesBoundaries.longitudeUpper;

        final bool isMatchInRegion =
            isMatchInLatitudeBoundaries && isMatchInLongitudeBoundaries;

        if (!isMatchInRegion) return false;

        return true;
      },
    ).toList();

    return matchingMatchesInRegion;
  }

// FUTURE need pagination
  Query<Map<String, dynamic>> _generateCoordinateBoundedEdgesMatchesQuery({
    required FirebaseFirestoreWrapper firebaseFirestoreWrapper,
    // TODO make enum out of this
    required String coordinateType,
    required double upperBoundary,
    required double lowerBoundary,
  }) {
    Query<Map<String, dynamic>> searchQueryCoordinate =
        firebaseFirestoreWrapper.db
            .collection(MatchesFirebaseConstants.firestoreCollectionMatches)
            .where(
              // TODO make this a constant via enum
              "location.city$coordinateType",
              isGreaterThanOrEqualTo: lowerBoundary,
            )
            .where(
              "location.city$coordinateType",
              isLessThanOrEqualTo: upperBoundary,
            );

    return searchQueryCoordinate;
  }

  // TODO this could be reused for the other search to search new matches
  Future<List<MatchRemoteDTO>> retrieveMatchesInRegion({
    required RegionCoordinatesBoundariesValue coordinatesBoundaries,
    required FirebaseFirestoreWrapper firebaseFirestoreWrapper,
  }) async {
    final Query<Map<String, dynamic>> searchQueryLat =
        _generateCoordinateBoundedEdgesMatchesQuery(
      firebaseFirestoreWrapper: firebaseFirestoreWrapper,
      // TODO has to be uppercase
      // TOOD or replace in db to be only latitude
      coordinateType: "Latitude",
      upperBoundary: coordinatesBoundaries.latitudeUpper,
      lowerBoundary: coordinatesBoundaries.latitudeLower,
    );

    final Query<Map<String, dynamic>> searchQueryLong =
        _generateCoordinateBoundedEdgesMatchesQuery(
      firebaseFirestoreWrapper: firebaseFirestoreWrapper,
      // TODO has to be uppercase
      // TOOD or replace in db to be only longitude
      coordinateType: "Longitude",
      upperBoundary: coordinatesBoundaries.longitudeUpper,
      lowerBoundary: coordinatesBoundaries.longitudeLower,
    );

    final QuerySnapshot<Map<String, dynamic>> resultsLatitude =
        await searchQueryLat.get();
    final QuerySnapshot<Map<String, dynamic>> resultsLongitude =
        await searchQueryLong.get();

    final List<QueryDocumentSnapshot<Map<String, dynamic>>>
        resultsLatitudeDocs = resultsLatitude.docs;
    final List<QueryDocumentSnapshot<Map<String, dynamic>>>
        resultsLongitudeDocs = resultsLongitude.docs;

    final List<Future<MatchRemoteDTO>> resultsMatchesLatRemoteDtosFutures =
        getMatchesWithParticipantsFutures(
      participationsMatchesDocs: resultsLatitudeDocs,
      firebaseFirestoreWrapper: firebaseFirestoreWrapper,
    );

    final List<Future<MatchRemoteDTO>> resultsMatchesLongRemoteDtosFutures =
        getMatchesWithParticipantsFutures(
      participationsMatchesDocs: resultsLongitudeDocs,
      firebaseFirestoreWrapper: firebaseFirestoreWrapper,
    );

    final List<MatchRemoteDTO> combinedMatches = await Future.wait([
      ...resultsMatchesLatRemoteDtosFutures,
      ...resultsMatchesLongRemoteDtosFutures,
    ]);

    final List<MatchRemoteDTO> matchingMatchesInRegion =
        _normalizeRegionMatchesFromCoordinatesBoundedMatches(
      coordinateBoundedMatches: combinedMatches,
      coordinatesBoundaries: coordinatesBoundaries,
    );

    return matchingMatchesInRegion;
  }

  List<MatchRemoteDTO> filterMatchesBySearchTerm({
    required String searchTerm,
    required List<MatchRemoteDTO> matches,
  }) {
    final List<MatchRemoteDTO> filteredMatches = matches.where((match) {
      final bool doesMatchNameContainSearchTerm =
          match.name.toLowerCase().contains(searchTerm.toLowerCase());

      if (!doesMatchNameContainSearchTerm) return false;
      return true;
    }).toList();

    return filteredMatches;
  }

  List<Future<MatchRemoteDTO>> getMatchesWithParticipantsFutures({
    required List<DocumentSnapshot<Map<String, dynamic>>>
        participationsMatchesDocs,
    required FirebaseFirestoreWrapper firebaseFirestoreWrapper,
  }) {
    final List<Future<MatchRemoteDTO>> matchesFutures =
        participationsMatchesDocs.map(
      (
        matchDoc,
      ) async {
// TODO THERE IS A LOT NESTed loops here. would this be a problem?
        final String matchId = matchDoc.id;

        final QuerySnapshot<Map<String, dynamic>> participantsQuerySnapshot =
            await firebaseFirestoreWrapper.db
                .collection(MatchesFirebaseConstants.firestoreCollectionMatches)
                .doc(matchId)
                .collection(MatchesFirebaseConstants
                    .firestoreMatchSubcollectionParticipants)
                .get();

        final List<QueryDocumentSnapshot<Map<String, dynamic>>>
            participantsQueryDocs = participantsQuerySnapshot.docs;

        final MatchRemoteDTO matchRemoteDTO = MatchRemoteDTO.fromFirestoreDocs(
          matchDoc: matchDoc,
          participantsQueryDocs: participantsQueryDocs,
        );

        return matchRemoteDTO;
      },
    ).toList();

    return matchesFutures;
  }

  // matches
  // TODO might be deprecated - might be good to rwork this - maybe use the top one instead, and just await results?
  Future<List<MatchRemoteDTO>> getMatchesWithParticipants({
    required List<DocumentSnapshot<Map<String, dynamic>>>
        participationsMatchesDocs,
    required FirebaseFirestoreWrapper firebaseFirestoreWrapper,
  }) async {
    final List<Future<MatchRemoteDTO>> matchesFutures =
        participationsMatchesDocs.map(
      (
        matchDoc,
      ) async {
// TODO THERE IS A LOT NESTed loops here. would this be a problem?
        final String matchId = matchDoc.id;

        final QuerySnapshot<Map<String, dynamic>> participantsQuerySnapshot =
            await firebaseFirestoreWrapper.db
                .collection(MatchesFirebaseConstants.firestoreCollectionMatches)
                .doc(matchId)
                .collection(MatchesFirebaseConstants
                    .firestoreMatchSubcollectionParticipants)
                .get();

        final List<QueryDocumentSnapshot<Map<String, dynamic>>>
            participantsQueryDocs = participantsQuerySnapshot.docs;

        final MatchRemoteDTO matchRemoteDTO = MatchRemoteDTO.fromFirestoreDocs(
          matchDoc: matchDoc,
          participantsQueryDocs: participantsQueryDocs,
        );

        return matchRemoteDTO;
      },
    ).toList();

    final List<MatchRemoteDTO> matches = await Future.wait(matchesFutures);

    return matches;
  }

  Future<List<DocumentSnapshot<Map<String, dynamic>>>>
      getParticipationsMatchesDocs({
    required List<QueryDocumentSnapshot<Map<String, dynamic>>>
        matchesParticipationsDocs,
  }) async {
    final Iterable<Future<DocumentSnapshot<Map<String, dynamic>>?>>
        matchFutures = matchesParticipationsDocs.map(
      (
        participationDoc,
      ) async {
        final DocumentReference<Map<String, dynamic>>? matchReference =
            participationDoc.reference.parent.parent;
        if (matchReference == null) return null;

        final DocumentSnapshot<Map<String, dynamic>> matchDocSnapshot =
            await matchReference.get();

        return matchDocSnapshot;
      },
    );

    final List<DocumentSnapshot<Map<String, dynamic>>?> matchDocs =
        await Future.wait(matchFutures);
    List<DocumentSnapshot<Map<String, dynamic>>> normalizedMatchDocs =
        matchDocs.whereNotNull().toList();

    return normalizedMatchDocs;
  }

  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>>
      getMatchesParticipationsForPlayer({
    required String playerId,
    required MatchParticipantStatus matchParticipantStatus,
    required FirebaseFirestoreWrapper firebaseFirestoreWrapper,
  }) async {
    final QuerySnapshot<Map<String, dynamic>> participationsSnapshot =
        await firebaseFirestoreWrapper.db
            .collectionGroup(MatchesFirebaseConstants
                .firestoreMatchSubcollectionParticipants)
            .where(
              MatchesFirebaseConstants.firestoreMatchParticipantFieldPlayerId,
              isEqualTo: playerId,
            )
            .where(
              MatchesFirebaseConstants.firestoreMatchParticipantFieldStatus,
              isEqualTo: matchParticipantStatus.name,
            )
            .get();

    final List<QueryDocumentSnapshot<Map<String, dynamic>>> participationsDocs =
        participationsSnapshot.docs;

    return participationsDocs;
  }

  Future<MatchParticipantRemoteDTO?> getMatchPlayerParticipation({
    required FirebaseFirestoreWrapper firebaseFirestoreWrapper,
    required String matchId,
    required String playerId,
  }) async {
    final QuerySnapshot<Map<String, dynamic>> participantsQuerySnapshot =
        await firebaseFirestoreWrapper.db
            .collection(MatchesFirebaseConstants.firestoreCollectionMatches)
            .doc(matchId)
            .collection(MatchesFirebaseConstants
                .firestoreMatchSubcollectionParticipants)
            .where(
              MatchesFirebaseConstants.firestoreMatchParticipantFieldPlayerId,
              isEqualTo: playerId,
            )
            .get();

    final List<QueryDocumentSnapshot<Map<String, dynamic>>> participantsDocs =
        participantsQuerySnapshot.docs;
    if (participantsDocs.isEmpty) return null;

    final QueryDocumentSnapshot<Map<String, dynamic>> participationDoc =
        participantsDocs.first;

    final MatchParticipantRemoteDTO matchParticipantRemoteDTO =
        MatchParticipantRemoteDTO.fromFirestoreDoc(doc: participationDoc);

    return matchParticipantRemoteDTO;
  }
}
