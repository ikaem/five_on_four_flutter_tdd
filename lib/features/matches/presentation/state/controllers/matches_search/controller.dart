// TODO just a note that this interface is same as the one for searching playaers
// TODO maaaaybe this can be united
abstract class MatchesSearchController {
  void onChangeSearchTerm(String searchTerm);
  Future<void> dispose();
}
