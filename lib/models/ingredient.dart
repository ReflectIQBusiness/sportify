class Ingredient {
  int id;
  String name;
  double calories;
  double protein;
  double fat;
  double carbs;
  // double fiber;
  // double sugar;
  // double sodium;
  // double potassium;
  // double cholesterol;
  // double saturatedFat;
  // double unsaturatedFat;
  double quantity;
  String unit;
  String image;
  int mealId;
  DateTime dateTime;
  Ingredient({
    required this.id,
    required this.name,
    required this.calories,
    required this.protein,
    required this.fat,
    required this.carbs,
// required this.fiber,
// required this.sugar,
// required this.sodium,
// required this.potassium,
// required this.cholesterol,
// required this.saturatedFat,
// required this.unsaturatedFat,
    required this.quantity,
    required this.unit,
    required this.image,
    required this.mealId,
    required this.dateTime,
  });
}
