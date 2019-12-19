import 'dart:convert';DrinkName drinkNameFromJson(String str) => DrinkName.fromJson(json.decode(str));String drinkNameToJson(DrinkName data) => json.encode(data.toJson());class DrinkName {  List<Drink> drinks;  DrinkName({    this.drinks,  });  factory DrinkName.fromJson(Map<String, dynamic> json) => DrinkName(    drinks: List<Drink>.from(json["drinks"].map((x) => Drink.fromJson(x))),  );  Map<String, dynamic> toJson() => {    "drinks": List<dynamic>.from(drinks.map((x) => x.toJson())),  };}class Drink {  String strDrink;  String strDrinkThumb;  String idDrink;  Drink({    this.strDrink,    this.strDrinkThumb,    this.idDrink,  });  factory Drink.fromJson(Map<String, dynamic> json) => Drink(    strDrink: json["strDrink"],    strDrinkThumb: json["strDrinkThumb"],    idDrink: json["idDrink"],  );  Map<String, dynamic> toJson() => {    "strDrink": strDrink,    "strDrinkThumb": strDrinkThumb,    "idDrink": idDrink,  };}