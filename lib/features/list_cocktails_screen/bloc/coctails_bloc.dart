import 'package:bloc/bloc.dart';
import 'package:cocktails_choice/data/models/cocktail_model.dart';
import 'package:cocktails_choice/data/repositories/cocktail_repository_impl.dart';
import 'package:meta/meta.dart';

part 'coctails_event.dart';
part 'coctails_state.dart';

class CoctailsBloc extends Bloc<CoctailsEvent, CoctailsState> {
   final CocktailRepositoryImpl cocktailRepositoryImpl;
  CoctailsBloc({required this.cocktailRepositoryImpl}) : super(CoctailsInitial()) {
    on<LoadCoctailsList>((event, emit) async {
      try {
        emit(CoctailsLoading());
        final cocktaiLsList = await cocktailRepositoryImpl.getCocktails();
        emit(CoctailsLoaded(cocktaiLsList: cocktaiLsList));
      } catch (e) {
        emit(CoctailsListLoadingFailuer(e));
      }
    });
  }
}
