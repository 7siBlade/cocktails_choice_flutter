class CocktailModel {
  final int idDrink;
  final String strDrink;
  final String strInstructions;
  final String strDrinkThumb;

   const CocktailModel({
    required this.idDrink,
    required this.strDrink,
    required this.strInstructions,
    required this.strDrinkThumb,
  });

  factory CocktailModel.fromJson(Map<String, dynamic> json) {
    return CocktailModel(
      idDrink: int.parse(json['idDrink'].toString()) ,
      strDrink: json['strDrink'],
      strInstructions: json['strInstructions'],
      strDrinkThumb: json['strDrinkThumb'],
    );
  }
}