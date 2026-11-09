import 'package:flutter/material.dart';
import 'package:cocktails_choice/features/favorites/bloc/favorites_bloc.dart';
import 'package:cocktails_choice/features/list_cocktails_screen/bloc/coctails_bloc.dart';
import 'package:cocktails_choice/features/widgets/cocktail_card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritesScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  void initState() {
    BlocProvider.of<FavoritesBloc>(context).add(LoadFavorites());
    BlocProvider.of<CoctailsBloc>(context).add(LoadCoctailsList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var favoriteIds;
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<FavoritesBloc, FavoritesState>(
          builder: (context, state) {
            if (state is FavoritesLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is FavoritesLoaded) {
              favoriteIds = state.favoriteIds;

              if (favoriteIds.isEmpty) {
                return const Center(
                  child: Text("You don't have any favorite cocktails yet"),
                );
              }
            }
            if (state is FavoritesLoadingFailuer) {
              return Center(child: Text('Ошибка ${state.exeption}'));
            }
            return BlocBuilder<CoctailsBloc, CoctailsState>(
              builder: (context, state) {
                if (state is CoctailsLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (state is CoctailsListLoadingFailuer) {
                  return Center(child: Text('Ошибка ${state.exeption}'));
                }
                if (state is CoctailsLoaded) {
                  final favoriteCocktails = state.cocktaiLsList
                      .where(
                        (cocktail) => favoriteIds.contains(cocktail.idDrink),
                      )
                      .toList();
                  return ListView.builder(itemCount: favoriteCocktails.length, 
                  itemBuilder: (context, index) {
                    final cocktail = favoriteCocktails[index];
                    return CocktailCard(cocktail: cocktail);
                  },);
                }
                return Container();
              },
            );
          },
        ),
      ),
    );
  }
}
