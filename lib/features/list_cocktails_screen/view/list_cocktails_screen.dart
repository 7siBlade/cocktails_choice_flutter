import 'package:flutter/material.dart';
import 'package:cocktails_choice/features/favorites/bloc/favorites_bloc.dart';
import 'package:cocktails_choice/features/list_cocktails_screen/bloc/coctails_bloc.dart';
import 'package:cocktails_choice/features/widgets/cocktail_card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListCocktailsScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<ListCocktailsScreen> createState() => _ListCocktailsScreenState();
}

class _ListCocktailsScreenState extends State<ListCocktailsScreen> {
  @override
  void initState() {
    BlocProvider.of<FavoritesBloc>(context).add(LoadFavorites());
    BlocProvider.of<CoctailsBloc>(context).add(LoadCoctailsList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<CoctailsBloc, CoctailsState>(
          builder: (context, state) {
            if (state is CoctailsLoaded) {
              return ListView.builder(
                itemCount: state.cocktaiLsList.length,
                itemBuilder: (context, index) {
                  final coctail = state.cocktaiLsList[index];
                  return CocktailCard(cocktail: coctail);
                },
              );
            }
            if (state is CoctailsListLoadingFailuer) {
              return Center(child: Text('Ошибка ${state.exeption}'));
            }
            if (state is CoctailsLoading) {
              return Center(child: CircularProgressIndicator());
            }
            return Center(child: Text('Something went wrong'));
          },
        ),
      ),
    );
  }
}
