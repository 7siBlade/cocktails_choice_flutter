import 'package:cocktails_choice/data/models/cocktail_model.dart';

abstract class CocktailRepository {

  Future<List<CocktailModel>> getCocktails();
  Future<CocktailModel> getRandomCocktail();
}
