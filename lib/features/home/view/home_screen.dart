import 'package:flutter/material.dart';
import 'package:cocktails_choice/features/favorites/view/favorites_screen.dart';
import 'package:cocktails_choice/features/list_cocktails_screen/view/list_cocktails_screen.dart';
import 'package:cocktails_choice/features/random_cocktail/view/random_cocktail_screen.dart';
import 'package:cocktails_choice/theme/app_colors.dart';

class HomeScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
        children: [
          ListCocktailsScreen(),
          FavoritesScreen(),
          RandomCocktailScreen(),
        ],
      ),
      appBar: AppBar(
        backgroundColor: AppColors.dullPink,
        centerTitle: true, 
        title: Text("Cocktails")
        ),

      bottomNavigationBar: NavigationBar(
        backgroundColor: AppColors.dullPink,
        selectedIndex: selectedIndex,

        onDestinationSelected: (index) {
          setState(() {
            selectedIndex = index;
            _pageController.animateToPage(
              index,
              duration: Duration(milliseconds: 200),
              curve: Curves.linear,
            );
          });
        },

        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.favorite_outline),
            selectedIcon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          NavigationDestination(
            icon: Icon(Icons.local_bar_outlined),
            selectedIcon: Icon(Icons.local_bar),
            label: 'Random cocktail',
          ),
        ],
      ),
    );
  }
}
