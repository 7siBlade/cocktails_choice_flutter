part of 'random_cocktail_bloc.dart';

@immutable
sealed class RandomCocktailState {}

final class RandomCocktailInitial extends RandomCocktailState {}

final class RandomCocktailLoading extends RandomCocktailState {}

final class RandomCocktailLoaded extends RandomCocktailState {
  final CocktailModel cocktail;

  new({required this.cocktail});
}

final class RandomCoctailLoadingFailuer extends RandomCocktailState {
  new(this.exeption);

  final Object? exeption;
}
