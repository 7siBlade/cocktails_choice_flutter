abstract class FavoritesRepository {
  Future<Set<int>> getFavorites();
  Future<void> saveFavorites(Set<int> ids);
}