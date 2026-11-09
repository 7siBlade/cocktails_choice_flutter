part of 'favorites_bloc.dart';

@immutable
sealed class FavoritesState {}

final class FavoritesInitial extends FavoritesState {}

final class FavoritesLoading extends FavoritesState {}

final class FavoritesLoaded extends FavoritesState {
  final Set<int> favoriteIds;

  FavoritesLoaded(this.favoriteIds);
}

final class FavoritesLoadingFailuer extends FavoritesState {
  new(this.exeption);

  final Object? exeption;
}
