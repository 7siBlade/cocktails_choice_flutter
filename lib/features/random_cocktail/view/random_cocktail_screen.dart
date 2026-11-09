import 'package:flutter/material.dart';
import 'package:cocktails_choice/features/random_cocktail/bloc/random_cocktail_bloc.dart';
import 'package:cocktails_choice/features/widgets/cocktail_card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RandomCocktailScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<RandomCocktailScreen> createState() => _RandomCocktailScreenState();
}

class _RandomCocktailScreenState extends State<RandomCocktailScreen> {

  @override
  void initState() {
    BlocProvider.of<RandomCocktailBloc>(context).add(LoadRandomCocktail());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<RandomCocktailBloc, RandomCocktailState>(
          builder: (context, state) {
            if (state is RandomCocktailLoaded) {
              return CocktailCard(cocktail: state.cocktail, height: 190,);
            }
            if (state is RandomCoctailLoadingFailuer) {
              return Center(child: Text('Ошибка ${state.exeption}'));
            }
            if (state is RandomCocktailLoading) {
              return Center(child: CircularProgressIndicator());
            }
            return Center(child: Text('Something went wrong'));
          },
        ),
      ),
    );
  }
}
