import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:five_on_four_flutter_tdd/features/players/data/data_sources/players_remote/data_source.dart';
import 'package:five_on_four_flutter_tdd/features/players/data/dtos/player_remote/dto.dart';
import 'package:five_on_four_flutter_tdd/features/players/domain/values/players_search_filters/value.dart';
import 'package:five_on_four_flutter_tdd/features/players/presentation/state/controllers/players_search/providers/provider.dart';
import 'package:five_on_four_flutter_tdd/features/players/utils/constants/players_firebase_constants.dart';
import 'package:five_on_four_flutter_tdd/libraries/firebase/cloud_firestore/firebase_firestore_wrapper.dart';

class PlayersRemoteAppDataSource implements PlayersRemoteDataSource {
  const PlayersRemoteAppDataSource({
    required FirebaseFirestoreWrapper firebaseFirestoreWrapper,
  }) : _firebaseFirestoreWrapper = firebaseFirestoreWrapper;

  final FirebaseFirestoreWrapper _firebaseFirestoreWrapper;

  @override
  Future<List<PlayerRemoteDTO>> getSearchedPlayers({
    required PlayersSearchFiltersValue filters,
    required PlayersSearchOptions options,
    required String currentPlayerId,
  }) async {
    Query<Map<String, dynamic>> searchQuery = _firebaseFirestoreWrapper.db
        .collection(PlayersFirebaseConstants.collectionPlayers)
        .where(
          PlayersFirebaseConstants.fieldNickname,
          // FUTURE make this more flexible
          isEqualTo: filters.searchTerm,
        );

    if (!options.shouldSearchCurrentUser) {
      searchQuery = searchQuery.where(
        PlayersFirebaseConstants.fieldDocumentId,
        isNotEqualTo: currentPlayerId,
      );
    }

    final QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await searchQuery.get();

    final List<QueryDocumentSnapshot<Map<String, dynamic>>> searchResultsDocs =
        querySnapshot.docs;

    final List<PlayerRemoteDTO> searchResults =
        searchResultsDocs.map((playerDoc) {
      final PlayerRemoteDTO playerRemoteDTO =
          PlayerRemoteDTO.fromFirestoreDoc(playerDoc: playerDoc);

      return playerRemoteDTO;
    }).toList();

    return searchResults;
  }

  @override
  Future<PlayerRemoteDTO> getPlayer(String playerId) async {
// FUTURE this needs implementation
    throw UnimplementedError();
  }

  @override
  Future<void> savePlayer({
    required Map<String, dynamic> playerData,
    required String playerId,
  }) async {
    final DocumentReference<Map<String, dynamic>> playerReference =
        await _firebaseFirestoreWrapper.db
            .collection(PlayersFirebaseConstants.collectionPlayers)
            .doc(playerId);

    await playerReference.set(playerData);
  }

  @override
  Future<void> updatePlayerField({
    required String playerId,
    required String fieldName,
    required dynamic fieldValue,
  }) async {
    final DocumentReference<Map<String, dynamic>> playerReference =
        await _firebaseFirestoreWrapper.db
            .collection(PlayersFirebaseConstants.collectionPlayers)
            .doc(playerId);

    await playerReference.update({
      fieldName: fieldValue,
    });
  }
}
