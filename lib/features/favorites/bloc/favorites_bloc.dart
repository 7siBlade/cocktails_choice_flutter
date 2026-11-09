import 'package:bloc/bloc.dart';
import 'package:cocktails_choice/features/favorites/repositories/favorites_repository_impl.dart';
import 'package:meta/meta.dart';

part 'favorites_event.dart';
part 'favorites_state.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  final FavoritesRepositoryImpl repository;

  FavoritesBloc({required this.repository}) : super(FavoritesInitial()) {
    on<LoadFavorites>(_onLoadFavorites);
    on<ToggleFavorite>(_onToggleFavorite);
  }

  Future<void> _onLoadFavorites(
    LoadFavorites event,
    Emitter<FavoritesState> emit,
  ) async {
    try {
      emit(FavoritesLoading());
      final ids = await repository.getFavorites();
      emit(FavoritesLoaded(ids));
    } catch (e) {
      emit(FavoritesLoadingFailuer(e.toString()));
    }
  }

  Future<void> _onToggleFavorite(
    ToggleFavorite event,
    Emitter<FavoritesState> emit,
  ) async {
    if (state is! FavoritesLoaded) return;

    final currentState = state as FavoritesLoaded;

    final ids = Set<int>.from(currentState.favoriteIds);

    if (ids.contains(event.cocktailId)) {
      ids.remove(event.cocktailId);
    } else {
      ids.add(event.cocktailId);
    }

    try {
      await repository.saveFavorites(ids);

      emit(FavoritesLoaded(ids));
    } catch (e) {
      emit(FavoritesLoadingFailuer(e.toString()));
    }
  }
}
