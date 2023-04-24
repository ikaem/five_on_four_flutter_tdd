abstract class PlayersSearchController {
  // TODO this probably disposes automatically - but i need to tap into it
  void onChangeSearchTerm(String searchTerm);
  Future<void> dispose();
}
