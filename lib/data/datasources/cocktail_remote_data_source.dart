import 'dart:convert';
import 'package:cocktails_choice/network/http_client.dart';
import '../models/cocktail_model.dart';

class CocktailRemoteDataSource {
  final HttpClient httpClient;

  CocktailRemoteDataSource(this.httpClient);

  Future<List<CocktailModel>> getCocktails() async {
    final response = await httpClient.get(
      'https://www.thecocktaildb.com/api/json/v1/1/search.php?f=a',
    );

    if (response.statusCode != 200) {
      throw Exception('Ошибка ${response.statusCode}');     
    }

    final data = jsonDecode(response.body);
    final drinks = data['drinks'] as List?;

    if (drinks == null || drinks.isEmpty) {
      throw Exception('Cocktails not found');
    }

    return drinks.map((json) => CocktailModel.fromJson(json)).toList();
  }

  Future<CocktailModel> getRandomCocktail() async {
    final response = await httpClient.get(
      'https://www.thecocktaildb.com/api/json/v1/1/random.php',
    );

    if (response.statusCode != 200) {
      throw Exception('Ошибка ${response.statusCode}');
    }

    final data = jsonDecode(response.body);
    final drinks = data['drinks'] as List?;

    if (drinks == null || drinks.isEmpty) {
      throw Exception('Cocktail not found');
    }

    return CocktailModel.fromJson(drinks.first);
  }
}
