import 'package:cocktails_choice/features/favorites/repositories/favorites_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoritesRepositoryImpl implements FavoritesRepository {
  static const String _key = 'favorite_cocktails';

  @override
  Future<Set<int>> getFavorites() async {
    final prefs = await SharedPreferences.getInstance();

    final ids = prefs.getStringList(_key) ?? [];

    return ids.map(int.parse).toSet();
  }

  @override
  Future<void> saveFavorites(Set<int> ids) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setStringList(_key, ids.map((id) => id.toString()).toList());
  }
}
