import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../favorites/bloc/favorites_bloc.dart';

class FavoriteButton extends StatelessWidget {
  final int cocktailId;

  const FavoriteButton({super.key, required this.cocktailId});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesBloc, FavoritesState>(
      builder: (context, state) {
        bool isFavorite = false;
        bool isEnabled = false;

        if (state is FavoritesLoaded) {
          isFavorite = state.favoriteIds.contains(cocktailId);
          isEnabled = true;
        }

        return IconButton(
          onPressed: isEnabled
              ? () {
                  context.read<FavoritesBloc>().add(
                    ToggleFavorite(cocktailId),
                  );
                }
              : null,
          icon: Icon(
            isFavorite ? Icons.favorite : Icons.favorite_border,
            color: isFavorite ? Colors.red : null,
          ),
        );
      },
    );
  }
}
