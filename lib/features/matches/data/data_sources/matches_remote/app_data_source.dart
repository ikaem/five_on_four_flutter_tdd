import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:five_on_four_flutter_tdd/features/matches/data/data_sources/matches_remote/data_source.dart';
import 'package:five_on_four_flutter_tdd/features/matches/data/dtos/match_participant_remote/dto.dart';
import 'package:five_on_four_flutter_tdd/features/matches/data/dtos/match_remote/dto.dart';
import 'package:five_on_four_flutter_tdd/features/matches/domain/enums/match_participant_status.dart';
import 'package:five_on_four_flutter_tdd/features/matches/domain/exceptions/match_participantion_exceptions.dart';
import 'package:five_on_four_flutter_tdd/features/matches/domain/values/match_participantion/value.dart';
import 'package:five_on_four_flutter_tdd/features/matches/domain/values/matches_search_filters/value.dart';
import 'package:five_on_four_flutter_tdd/features/matches/domain/values/new_match/value.dart';
import 'package:five_on_four_flutter_tdd/features/matches/presentation/state/controllers/matches_in_region/providers/provider.dart';
import 'package:five_on_four_flutter_tdd/features/matches/utils/constants/matches_firebase_constants.dart';
import 'package:five_on_four_flutter_tdd/features/players/domain/models/player/model.dart';
import 'package:five_on_four_flutter_tdd/libraries/firebase/cloud_firestore/firebase_firestore_wrapper.dart';

class MatchesRemoteAppDataSource
    with MatchesRemoteAppDataSourceMixin
    implements MatchesRemoteDataSource {
  const MatchesRemoteAppDataSource({
    required FirebaseFirestoreWrapper firebaseFirestoreWrapper,
  }) : _firebaseFirestoreWrapper = firebaseFirestoreWrapper;

  final FirebaseFirestoreWrapper _firebaseFirestoreWrapper;

  @override
  Future<List<MatchRemoteDTO>> getInvitedMatchesForPlayer(
    String playerId,
  ) async {
    final List<QueryDocumentSnapshot<Map<String, dynamic>>>
        matchesParticipationsDocs = await getMatchesParticipationsForPlayer(
      playerId: playerId,
      matchParticipantStatus: MatchParticipantStatus.invited,
      firebaseFirestoreWrapper: _firebaseFirestoreWrapper,
    );

    final List<DocumentSnapshot<Map<String, dynamic>>>
        participationsMatchesDocs = await getParticipationsMatchesDocs(
      matchesParticipationsDocs: matchesParticipationsDocs,
    );

    final List<MatchRemoteDTO> matches = await getMatchesWithParticipants(
      participationsMatchesDocs: participationsMatchesDocs,
      firebaseFirestoreWrapper: _firebaseFirestoreWrapper,
    );

    return matches;
  }

  @override
  Future<List<MatchRemoteDTO>> getJoinedMatchesForPlayer(
      String playerId) async {
    final List<QueryDocumentSnapshot<Map<String, dynamic>>>
        matchesParticipationsDocs = await getMatchesParticipationsForPlayer(
      playerId: playerId,
      matchParticipantStatus: MatchParticipantStatus.joined,
      firebaseFirestoreWrapper: _firebaseFirestoreWrapper,
    );

    final List<DocumentSnapshot<Map<String, dynamic>>>
        participationsMatchesDocs = await getParticipationsMatchesDocs(
      matchesParticipationsDocs: matchesParticipationsDocs,
    );

    final List<MatchRemoteDTO> matches = await getMatchesWithParticipants(
      participationsMatchesDocs: participationsMatchesDocs,
      firebaseFirestoreWrapper: _firebaseFirestoreWrapper,
    );

    return matches;
  }

  @override
  Future<MatchRemoteDTO> getMatch(String matchId) async {
    final DocumentSnapshot<Map<String, dynamic>> matchDoc =
        await _firebaseFirestoreWrapper.db
            .collection(MatchesFirebaseConstants.firestoreCollectionMatches)
            .doc(matchId)
            .get();

    final QuerySnapshot<Map<String, dynamic>> matchParticipationsDocs =
        await _firebaseFirestoreWrapper.db
            .collection(MatchesFirebaseConstants.firestoreCollectionMatches)
            .doc(matchId)
            .collection(MatchesFirebaseConstants
                .firestoreMatchSubcollectionParticipants)
            .get();

    final MatchRemoteDTO match = MatchRemoteDTO.fromFirestoreDocs(
        matchDoc: matchDoc,
        participantsQueryDocs: matchParticipationsDocs.docs);

    return match;
  }

  @override
  Future<String> createMatch({
    required NewMatchValue matchData,
    required PlayerModel currentPlayer,
  }) async {
    final FirestoreMatchDataValue matchFirestoreData =
        matchData.toFirestoreMatchData();
    final Map<String, dynamic> matchMap = matchFirestoreData.matchDataMap;
    final List<Map<String, dynamic>> participationsMaps =
        matchFirestoreData.participationsDataMaps;

    // TODO create batch wrapper in firebase wrapper
    final WriteBatch batch = _firebaseFirestoreWrapper.db.batch();

    // getting refetence for this match
    final DocumentReference matchDocRef = await _firebaseFirestoreWrapper.db
        .collection(MatchesFirebaseConstants.firestoreCollectionMatches)
        .doc();

    // setting match data
    batch.set(matchDocRef, matchMap);

    // getting this match's participations collection
    final CollectionReference matchParticipationsCollectionRef =
        matchDocRef.collection(
      MatchesFirebaseConstants.firestoreMatchSubcollectionParticipants,
    );

    // adding participations to this match
    for (final participationMap in participationsMaps) {
      // getting reference for this participation
      final DocumentReference matchParticipationDocRef =
          matchParticipationsCollectionRef.doc();

      // setting participation data
      batch.set(matchParticipationDocRef, participationMap);
    }

    // executing batch
    await batch.commit();

    return matchDocRef.id;
  }

  @override
  Future<void> joinMatch({
    required String matchId,
    required MatchParticipationValue matchParticipation,
  }) async {
    // TODO what if there is no match - take care of it later
//  FIND participation

    final Map<String, dynamic> participationData =
        matchParticipation.toFirestoreMap();

    final MatchParticipantRemoteDTO? participant =
        await getMatchPlayerParticipation(
      firebaseFirestoreWrapper: _firebaseFirestoreWrapper,
      matchId: matchId,
      playerId: matchParticipation.playerId,
    );

// if we dont find participation, create new participation, and set status to joined

    if (participant == null) {
      final DocumentReference<Map<String, dynamic>> participationDocRef =
          await _firebaseFirestoreWrapper.db
              .collection(MatchesFirebaseConstants.firestoreCollectionMatches)
              .doc(matchId)
              .collection(MatchesFirebaseConstants
                  .firestoreMatchSubcollectionParticipants)
              .add(participationData);

      return;
    }

    // now we have participation
    // if we find participation, check if it is invited or joined
    final bool isParticipantJoined =
        participant.status == MatchParticipantStatus.joined.name;

    // if it is joined, throw exception that player is already joined
    if (isParticipantJoined) {
      throw MatchParticipationExceptionAlreadyJoined(
          message:
              'Player ${matchParticipation.playerId} is already joined to match $matchId');
    }

    // else, update status to joined
    await _firebaseFirestoreWrapper.db
        .collection(MatchesFirebaseConstants.firestoreCollectionMatches)
        .doc(matchId)
        .collection(
            MatchesFirebaseConstants.firestoreMatchSubcollectionParticipants)
        .doc(participant.id)
        .update(participationData);
  }

  Future<void> unjoinMatch({
    required String matchId,
    // TODO this probably can all be united - or dont set such a complex object for such a simple thing
    required MatchParticipationValue matchParticipation,
  }) async {
    final MatchParticipantRemoteDTO? participant =
        await getMatchPlayerParticipation(
      firebaseFirestoreWrapper: _firebaseFirestoreWrapper,
      matchId: matchId,
      playerId: matchParticipation.playerId,
    );

    if (participant == null) {
      throw MatchParticipationExceptionNotFoundRemote(
          message:
              'Match participation not found for participant ${matchParticipation.playerId} in match $matchId');
    }

    await _firebaseFirestoreWrapper.db
        .collection(MatchesFirebaseConstants.firestoreCollectionMatches)
        .doc(matchId)
        .collection(
            MatchesFirebaseConstants.firestoreMatchSubcollectionParticipants)
        .doc(participant.id)
        .delete();
  }

  @override
  Future<List<MatchRemoteDTO>> getSearchedMatches(
    MatchesSearchFiltersValue filters,
  ) async {
    Query<Map<String, dynamic>> searchQuery = _firebaseFirestoreWrapper.db
        .collection(MatchesFirebaseConstants.firestoreCollectionMatches)
        .where(
          MatchesFirebaseConstants.firestoreMatchFieldName,
          // TODO in future, make this more flexible
          isEqualTo: filters.searchTerm,
        );

    final QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await searchQuery.get();

    final List<QueryDocumentSnapshot<Map<String, dynamic>>> searchResultsDocs =
        querySnapshot.docs;

// TODO make a function out of this to get searched matches participatns - and reuse with getMatchesInRegion
    final List<Future<MatchRemoteDTO>> futureSearchResults =
        searchResultsDocs.map((matchDoc) async {
      final QuerySnapshot<Map<String, dynamic>> matchParticipationsQuery =
          await _firebaseFirestoreWrapper.db
              .collection(MatchesFirebaseConstants.firestoreCollectionMatches)
              .doc(
                matchDoc.id,
              )
              .collection(MatchesFirebaseConstants
                  .firestoreMatchSubcollectionParticipants)
              .get();

      return MatchRemoteDTO.fromFirestoreDocs(
        matchDoc: matchDoc,
        participantsQueryDocs: matchParticipationsQuery.docs,
      );
    }).toList();

    final List<MatchRemoteDTO> searchResults = await Future.wait(
      futureSearchResults,
    );

    return searchResults;
  }

  @override
  Future<List<MatchRemoteDTO>> getMatchesInRegion(
    RegionCoordinatesBoundariesValue coordinatesBoundaries,
  ) async {
    // here we search everything that has latitudes withing boundaries and longitudes within boundaries
    final Query<Map<String, dynamic>> searchQuery = _firebaseFirestoreWrapper.db
        .collection(MatchesFirebaseConstants.firestoreCollectionMatches)
        .where(
          // TODO make this a constant
          "location.cityLatitude",
          isGreaterThan: coordinatesBoundaries.latitudeLower,
        )
        .where(
          // TODO make this a constant
          "location.cityLatitude",
          isLessThan: coordinatesBoundaries.latitudeUpper,
        )
        .where(
          // TODO make this a constant
          "location.cityLongitude",
          isGreaterThan: coordinatesBoundaries.longitudeLower,
        )
        .where(
          // TODO make this a constant
          "location.cityLongitude",
          isLessThan: coordinatesBoundaries.longitudeUpper,
        );

    final QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await searchQuery.get();

    final List<QueryDocumentSnapshot<Map<String, dynamic>>> searchResultsDocs =
        querySnapshot.docs;

    final List<Future<MatchRemoteDTO>> futureSearchResults =
        searchResultsDocs.map((matchDoc) async {
      final QuerySnapshot<Map<String, dynamic>> matchParticipationsQuery =
          await _firebaseFirestoreWrapper.db
              .collection(MatchesFirebaseConstants.firestoreCollectionMatches)
              .doc(
                matchDoc.id,
              )
              .collection(MatchesFirebaseConstants
                  .firestoreMatchSubcollectionParticipants)
              .get();

      return MatchRemoteDTO.fromFirestoreDocs(
        matchDoc: matchDoc,
        participantsQueryDocs: matchParticipationsQuery.docs,
      );
    }).toList();

    final List<MatchRemoteDTO> searchResults = await Future.wait(
      futureSearchResults,
    );

    return searchResults;
  }
}

// TODO moce to mixins
mixin MatchesRemoteAppDataSourceMixin {
  // matches
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
