import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:five_on_four_flutter_tdd/features/matches/data/data_sources/matches_remote/data_source.dart';
import 'package:five_on_four_flutter_tdd/features/matches/data/dtos/match_participant_remote/dto.dart';
import 'package:five_on_four_flutter_tdd/features/matches/data/dtos/match_remote/dto.dart';
import 'package:five_on_four_flutter_tdd/features/matches/domain/enums/match_participant_status.dart';
import 'package:five_on_four_flutter_tdd/features/matches/domain/exceptions/match_participantion_exceptions.dart';
import 'package:five_on_four_flutter_tdd/features/matches/domain/values/match_participantion/value.dart';
import 'package:five_on_four_flutter_tdd/features/matches/domain/values/matches_search_filters/value.dart';
import 'package:five_on_four_flutter_tdd/features/matches/domain/values/new_match/value.dart';
import 'package:five_on_four_flutter_tdd/features/matches/presentation/state/controllers/matches_all/providers/provider.dart';

import 'package:five_on_four_flutter_tdd/features/matches/utils/constants/matches_firebase_constants.dart';
import 'package:five_on_four_flutter_tdd/features/matches/utils/mixins/matches_data_source_mixin.dart';
import 'package:five_on_four_flutter_tdd/libraries/firebase/cloud_firestore/firebase_firestore_wrapper.dart';

class MatchesRemoteAppDataSource extends MatchesRemoteDataSource
    with MatchesRemoteAppDataSourceMixin {
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
    // required PlayerModel currentPlayer,
    // TODO these are not even needed it seems
    required String playerId,
    required String playerNickname,
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

// TODO test new
  @override
  Future<List<MatchRemoteDTO>> getSearchedMatches(
    MatchesSearchFiltersValue filters,
    RegionCoordinatesBoundariesValue coordinatesBoundaries,
  ) async {
    final String searchTerm = filters.searchTerm.toLowerCase();
    if (searchTerm.isEmpty) return [];

    final List<MatchRemoteDTO> matchesInRegion = await retrieveMatchesInRegion(
      coordinatesBoundaries: coordinatesBoundaries,
      firebaseFirestoreWrapper: _firebaseFirestoreWrapper,
    );

// TODO have to search here
    final List<MatchRemoteDTO> filteredMatches = filterMatchesBySearchTerm(
      matches: matchesInRegion,
      searchTerm: searchTerm,
    );

    return filteredMatches;
  }

  @override
  Future<List<MatchRemoteDTO>> getAllMatches(
      RegionCoordinatesBoundariesValue coordinatesBoundaries) async {
    final List<MatchRemoteDTO> matchesInRegion = await retrieveMatchesInRegion(
      coordinatesBoundaries: coordinatesBoundaries,
      firebaseFirestoreWrapper: _firebaseFirestoreWrapper,
    );

    return matchesInRegion;
  }

// TOOD get this in mixins
  @override
  Future<void> deletePlayerMatchParticipations(String playerId) async {
    // find all participations for this player
    final QuerySnapshot<Map<String, dynamic>> participationsQuerySnapshot =
        await _firebaseFirestoreWrapper.db
            .collectionGroup(
              MatchesFirebaseConstants.firestoreMatchSubcollectionParticipants,
            )
            .where(
              MatchesFirebaseConstants.firestoreMatchParticipantFieldPlayerId,
              isEqualTo: playerId,
            )
            .get();

    final List<QueryDocumentSnapshot<Map<String, dynamic>>> docs =
        participationsQuerySnapshot.docs;

    final WriteBatch batch = _firebaseFirestoreWrapper.db.batch();

    for (final doc in docs) {
      batch.delete(doc.reference);
    }

    await batch.commit();
  }

  @override
  Future<void> removePlayerAsMatchesOrganizer(String playerId) async {
    // find all matches where this player is organizer
    final QuerySnapshot<Map<String, dynamic>> matchesQuerySnapshot =
        await _firebaseFirestoreWrapper.db
            .collection(
              MatchesFirebaseConstants.firestoreCollectionMatches,
            )
            .where(
              MatchesFirebaseConstants.firestoreMatchFieldOrganizerId,
              isEqualTo: playerId,
            )
            .get();

    // on each match, update organizer to null
    final List<QueryDocumentSnapshot<Map<String, dynamic>>> docs =
        matchesQuerySnapshot.docs;

    final WriteBatch batch = _firebaseFirestoreWrapper.db.batch();

    for (final doc in docs) {
      batch.update(
        doc.reference,
        {
          MatchesFirebaseConstants.firestoreMatchFieldOrganizerId: null,
        },
      );
    }

    await batch.commit();
  }

  // TODO this should be part of a mixin
}
