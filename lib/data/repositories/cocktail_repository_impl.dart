import '../repositories/cocktail_repository.dart';
import '../datasources/cocktail_remote_data_source.dart';
import '../models/cocktail_model.dart';

class CocktailRepositoryImpl implements CocktailRepository {
  final CocktailRemoteDataSource remoteDataSource;

  CocktailRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<CocktailModel>> getCocktails() {
    return remoteDataSource.getCocktails();
  }

  @override
  Future<CocktailModel> getRandomCocktail() {
    return remoteDataSource.getRandomCocktail();
  }
}

