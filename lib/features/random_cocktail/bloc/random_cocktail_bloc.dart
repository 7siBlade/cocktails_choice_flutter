import 'package:bloc/bloc.dart';
import 'package:cocktails_choice/data/models/cocktail_model.dart';
import 'package:cocktails_choice/data/repositories/cocktail_repository_impl.dart';
import 'package:meta/meta.dart';

part 'random_cocktail_event.dart';
part 'random_cocktail_state.dart';

class RandomCocktailBloc
    extends Bloc<RandomCocktailEvent, RandomCocktailState> {
      final CocktailRepositoryImpl cocktailRepositoryImpl;
  RandomCocktailBloc({required this.cocktailRepositoryImpl})
    : super(RandomCocktailInitial()) {
    on<RandomCocktailEvent>((event, emit) async {
      try {
        emit(RandomCocktailLoading());
        final cocktail = await cocktailRepositoryImpl.getRandomCocktail();
        emit(RandomCocktailLoaded(cocktail: cocktail));
      } catch (e) {
        emit(RandomCoctailLoadingFailuer(e));
      }
    });
  }
}
