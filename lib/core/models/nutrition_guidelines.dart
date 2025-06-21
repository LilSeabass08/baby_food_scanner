import 'package:freezed_annotation/freezed_annotation.dart';
import 'food_product.dart';

part 'nutrition_guidelines.freezed.dart';

@freezed
class NutritionGuidelines with _$NutritionGuidelines {
  const factory NutritionGuidelines({
    required AgeGroup ageGroup,
    required double maxDailyCalories,
    required double dailyProteinNeed,
    required double dailyIronNeed,
    required double dailyZincNeed,
    required double dailyPotassiumNeed,
    required double maxSaltPer100g,
    required double maxSugarsPer100g,
    required double maxSaturatedFatPer100g,
    required List<String> recommendedSources,
    required List<String> avoidIngredients,
  }) = _NutritionGuidelines;
}

class BabyNutritionDatabase {
  static const Map<AgeGroup, NutritionGuidelines> _guidelines = {
    AgeGroup.fourToSixMonths: NutritionGuidelines(
      ageGroup: AgeGroup.fourToSixMonths,
      maxDailyCalories: 600, // Mainly breast milk/formula
      dailyProteinNeed: 11.0,
      dailyIronNeed: 11.0,
      dailyZincNeed: 3.0,
      dailyPotassiumNeed: 860.0,
      maxSaltPer100g: 0.1, // Very low salt for babies
      maxSugarsPer100g: 5.0, // Natural sugars only
      maxSaturatedFatPer100g: 3.0,
      recommendedSources: [
        'breast milk',
        'formula',
        'pureed fruits',
        'pureed vegetables',
        'iron-fortified cereals'
      ],
      avoidIngredients: [
        'honey',
        'added sugars',
        'salt',
        'nuts',
        'whole grapes',
        'raw eggs',
        'unpasteurized dairy'
      ],
    ),
    
    AgeGroup.sixToEightMonths: NutritionGuidelines(
      ageGroup: AgeGroup.sixToEightMonths,
      maxDailyCalories: 700,
      dailyProteinNeed: 11.0,
      dailyIronNeed: 11.0,
      dailyZincNeed: 3.0,
      dailyPotassiumNeed: 860.0,
      maxSaltPer100g: 0.15,
      maxSugarsPer100g: 8.0,
      maxSaturatedFatPer100g: 4.0,
      recommendedSources: [
        'breast milk',
        'formula',
        'pureed meats (chicken, beef)',
        'beans (pureed)',
        'fortified cereals',
        'eggs (well cooked)',
        'pureed fruits and vegetables'
      ],
      avoidIngredients: [
        'honey',
        'added sugars',
        'excessive salt',
        'nuts',
        'shellfish',
        'raw eggs',
        'unpasteurized dairy'
      ],
    ),
    
    AgeGroup.eightToTwelveMonths: NutritionGuidelines(
      ageGroup: AgeGroup.eightToTwelveMonths,
      maxDailyCalories: 750,
      dailyProteinNeed: 11.0,
      dailyIronNeed: 11.0,
      dailyZincNeed: 3.0,
      dailyPotassiumNeed: 860.0,
      maxSaltPer100g: 0.2,
      maxSugarsPer100g: 10.0,
      maxSaturatedFatPer100g: 4.5,
      recommendedSources: [
        'breast milk',
        'formula',
        'soft meats (beef, lamb, pork, seafood, fatty fish)',
        'fortified cereals',
        'eggs',
        'dairy (yogurt, cheese)',
        'legumes',
        'soft fruits and vegetables'
      ],
      avoidIngredients: [
        'honey',
        'added sugars',
        'excessive salt',
        'whole nuts',
        'raw shellfish',
        'raw eggs',
        'unpasteurized dairy'
      ],
    ),
    
    AgeGroup.twelveMonthsPlus: NutritionGuidelines(
      ageGroup: AgeGroup.twelveMonthsPlus,
      maxDailyCalories: 800,
      dailyProteinNeed: 13.0,
      dailyIronNeed: 7.0,
      dailyZincNeed: 3.0,
      dailyPotassiumNeed: 2000.0,
      maxSaltPer100g: 0.3,
      maxSugarsPer100g: 12.0, // Still limited
      maxSaturatedFatPer100g: 5.0,
      recommendedSources: [
        'whole milk',
        'meats (beef, pork, chicken)',
        'fish and seafood',
        'eggs',
        'dairy (yogurt, cheese)',
        'fortified cereals',
        '100% fruit juices (limited)',
        'fruits and vegetables',
        'legumes'
      ],
      avoidIngredients: [
        'added sugars', // Still avoid
        'excessive salt',
        'honey (under 24 months)',
        'raw shellfish',
        'unpasteurized dairy',
        'artificial sweeteners'
      ],
    ),
  };

  static NutritionGuidelines getGuidelinesForAge(AgeGroup ageGroup) {
    return _guidelines[ageGroup]!;
  }

  static List<AgeGroup> getAllAgeGroups() {
    return _guidelines.keys.toList();
  }

  static bool isIngredientSafe(String ingredient, AgeGroup ageGroup) {
    final guidelines = getGuidelinesForAge(ageGroup);
    final ingredientLower = ingredient.toLowerCase();
    
    return !guidelines.avoidIngredients.any((avoid) => 
        ingredientLower.contains(avoid.toLowerCase()));
  }

  static bool hasAddedSugars(List<String> ingredients) {
    final addedSugarKeywords = [
      'sugar',
      'glucose',
      'fructose',
      'sucrose',
      'corn syrup',
      'high fructose corn syrup',
      'maltose',
      'dextrose',
      'cane sugar',
      'brown sugar',
      'raw sugar',
      'coconut sugar',
      'palm sugar',
      'syrup',
      'honey',
      'agave',
      'molasses',
      'artificial sweetener',
      'aspartame',
      'sucralose',
      'stevia'
    ];

    return ingredients.any((ingredient) {
      final ingredientLower = ingredient.toLowerCase();
      return addedSugarKeywords.any((sugar) => 
          ingredientLower.contains(sugar));
    });
  }
} 