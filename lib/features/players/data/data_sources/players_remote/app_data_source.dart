import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:five_on_four_flutter_tdd/features/players/data/data_sources/players_remote/data_source.dart';
import 'package:five_on_four_flutter_tdd/features/players/data/dtos/player_remote/dto.dart';
import 'package:five_on_four_flutter_tdd/features/players/domain/values/players_search_filters/value.dart';
import 'package:five_on_four_flutter_tdd/features/players/presentation/state/controllers/players_search/providers/provider.dart';
import 'package:five_on_four_flutter_tdd/features/players/utils/constants/players_firebase_constants.dart';

class PlayersRemoteAppDataSource implements PlayersRemoteDataSource {
  @override
  Future<List<PlayerRemoteDTO>> getSearchedPlayers({
    required PlayersSearchFiltersValue filters,
    required PlayersSearchOptions options,
    required String currentPlayerId,
  }) async {
    Query<Map<String, dynamic>> searchQuery = FirebaseFirestore.instance
        .collection(PlayersFirebaseConstants.firestoreCollectionPlayers)
        .where(
          PlayersFirebaseConstants.firestorePlayerFieldNickname,
          // TODO in future, make this more flexible
          isEqualTo: filters.searchTerm,
        );

    if (!options.shouldSearchCurrentUser) {
      searchQuery = searchQuery.where(
        PlayersFirebaseConstants.firestorePlayerFieldDocumentId,
        isNotEqualTo: currentPlayerId,
      );
    }

    // execture the query
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
// TODO this needs implementation
    throw UnimplementedError();
  }
}
