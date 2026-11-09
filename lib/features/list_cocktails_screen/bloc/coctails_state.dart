part of 'coctails_bloc.dart';

@immutable
sealed class CoctailsState {}

final class CoctailsInitial extends CoctailsState {}

final class CoctailsLoading extends CoctailsState {}

final class CoctailsLoaded extends CoctailsState {
  new({required this.cocktaiLsList});

  final List<CocktailModel> cocktaiLsList;
}

final class CoctailsListLoadingFailuer extends CoctailsState {
  new(this.exeption);

  final Object? exeption;
}
