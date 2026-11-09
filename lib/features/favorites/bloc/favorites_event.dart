part of 'favorites_bloc.dart';

@immutable
sealed class FavoritesEvent {}

class LoadFavorites extends FavoritesEvent {}

class ToggleFavorite extends FavoritesEvent {
  final int cocktailId;

  ToggleFavorite(this.cocktailId);
}
