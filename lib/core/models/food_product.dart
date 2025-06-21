import 'package:freezed_annotation/freezed_annotation.dart';

part 'food_product.freezed.dart';
part 'food_product.g.dart';

@freezed
class FoodProduct with _$FoodProduct {
  const factory FoodProduct({
    required String barcode,
    required String name,
    required String? brand,
    required String? imageUrl,
    required NutritionData? nutrition,
    required List<String> ingredients,
    required List<String> allergens,
    required String? category,
    required bool isBabyFood,
  }) = _FoodProduct;

  factory FoodProduct.fromJson(Map<String, dynamic> json) =>
      _$FoodProductFromJson(json);
}

@freezed
class NutritionData with _$NutritionData {
  const factory NutritionData({
    required double? energyKj,
    required double? energyKcal,
    required double? fat,
    required double? saturatedFat,
    required double? carbohydrates,
    required double? sugars,
    required double? fiber,
    required double? proteins,
    required double? salt,
    required double? sodium,
    required String nutritionGrade,
  }) = _NutritionData;

  factory NutritionData.fromJson(Map<String, dynamic> json) =>
      _$NutritionDataFromJson(json);
}

@freezed
class BabyFoodRecommendation with _$BabyFoodRecommendation {
  const factory BabyFoodRecommendation({
    required bool isRecommended,
    required String recommendation,
    required List<String> concerns,
    required List<String> benefits,
    required AgeGroup? suitableAgeGroup,
  }) = _BabyFoodRecommendation;

  factory BabyFoodRecommendation.fromJson(Map<String, dynamic> json) =>
      _$BabyFoodRecommendationFromJson(json);
}

enum AgeGroup {
  @JsonValue('4-6_months')
  fourToSixMonths,
  @JsonValue('6-8_months')
  sixToEightMonths,
  @JsonValue('8-12_months')
  eightToTwelveMonths,
  @JsonValue('12+_months')
  twelveMonthsPlus,
} 