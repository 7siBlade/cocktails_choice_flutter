import 'package:cocktails_choice/data/datasources/cocktail_remote_data_source.dart';
import 'package:cocktails_choice/data/repositories/cocktail_repository_impl.dart';
import 'package:cocktails_choice/features/favorites/bloc/favorites_bloc.dart';
import 'package:cocktails_choice/features/favorites/repositories/favorites_repository_impl.dart';
import 'package:cocktails_choice/features/home/view/home_screen.dart';
import 'package:cocktails_choice/features/list_cocktails_screen/bloc/coctails_bloc.dart';
import 'package:cocktails_choice/features/random_cocktail/bloc/random_cocktail_bloc.dart';
import 'package:cocktails_choice/network/http_client.dart';
import 'package:cocktails_choice/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final cocktailRepository = CocktailRepositoryImpl(
      CocktailRemoteDataSource(HttpClient()),
    );
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              FavoritesBloc(repository: FavoritesRepositoryImpl()),
        ),
        BlocProvider(
          create: (context) =>
              CoctailsBloc(cocktailRepositoryImpl: cocktailRepository),
        ),
        BlocProvider(
          create: (context) =>
              RandomCocktailBloc(cocktailRepositoryImpl: cocktailRepository),
        ),
      ],
      child: MaterialApp(
        title: 'Cocktails choice',
        theme: AppTheme.lightTheme,
        home: HomeScreen(),
      ),
    );
  }
}
