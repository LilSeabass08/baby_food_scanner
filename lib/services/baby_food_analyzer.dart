import '../core/models/food_product.dart';
import '../core/models/nutrition_guidelines.dart';

class BabyFoodAnalyzer {
  static BabyFoodRecommendation analyzeProduct(FoodProduct product) {
    final List<String> concerns = [];
    final List<String> benefits = [];
    bool isRecommended = true;
    AgeGroup? suitableAge;
    
    final nutrition = product.nutrition;
    
    if (nutrition == null) {
      return const BabyFoodRecommendation(
        isRecommended: false,
        recommendation: 'Unable to analyze - no nutrition information available',
        concerns: ['No nutrition data available'],
        benefits: [],
        suitableAgeGroup: null,
      );
    }

    // Check for added sugars first - critical warning
    final bool hasAddedSugars = BabyNutritionDatabase.hasAddedSugars(product.ingredients);
    if (hasAddedSugars) {
      concerns.add('🚨 CONTAINS ADDED SUGARS - AVOID! Added sugars should be completely avoided for babies.');
      isRecommended = false;
    }

    // Determine the most suitable age group based on nutritional content
    suitableAge = _determineBestAgeGroup(nutrition, product.ingredients, hasAddedSugars);
    
    if (suitableAge != null) {
      final guidelines = BabyNutritionDatabase.getGuidelinesForAge(suitableAge);
      _analyzeAgainstGuidelines(nutrition, product.ingredients, guidelines, concerns, benefits);
    } else {
      concerns.add('Not suitable for babies - nutritional content exceeds safe limits');
      isRecommended = false;
    }

    // Check if it's actually baby food
    if (!product.isBabyFood && suitableAge == null) {
      concerns.add('Not specifically designed for babies - proceed with caution');
    }

    // Nutriscore consideration
    if (nutrition.nutritionGrade.isNotEmpty && 
        !['A', 'B', 'UNKNOWN'].contains(nutrition.nutritionGrade)) {
      concerns.add('Nutri-Score: ${nutrition.nutritionGrade} - consider healthier alternatives');
    }

    // Check for beneficial ingredients
    _checkBeneficialIngredients(product.ingredients, benefits);

    // Final recommendation based on concerns
    if (hasAddedSugars || concerns.any((c) => c.contains('exceeds safe limits'))) {
      isRecommended = false;
    }

    final String recommendation = _generateDetailedRecommendation(
      isRecommended, 
      product.isBabyFood, 
      suitableAge, 
      concerns, 
      benefits,
      hasAddedSugars
    );

    return BabyFoodRecommendation(
      isRecommended: isRecommended,
      recommendation: recommendation,
      concerns: concerns,
      benefits: benefits,
      suitableAgeGroup: suitableAge,
    );
  }

  static void _analyzeAgainstGuidelines(
    NutritionData nutrition,
    List<String> ingredients,
    NutritionGuidelines guidelines,
    List<String> concerns,
    List<String> benefits
  ) {
    // Check salt content against age-specific guidelines
    if (nutrition.salt != null) {
      if (nutrition.salt! > guidelines.maxSaltPer100g) {
        final difference = (nutrition.salt! - guidelines.maxSaltPer100g).toStringAsFixed(2);
        concerns.add('High salt content: ${nutrition.salt!.toStringAsFixed(2)}g per 100g (${difference}g over recommended limit for this age)');
      } else if (nutrition.salt! <= guidelines.maxSaltPer100g * 0.5) {
        benefits.add('Low salt content - excellent for babies');
      }
    }

    // Check sugar content against age-specific guidelines
    if (nutrition.sugars != null) {
      if (nutrition.sugars! > guidelines.maxSugarsPer100g) {
        final difference = (nutrition.sugars! - guidelines.maxSugarsPer100g).toStringAsFixed(1);
        concerns.add('High sugar content: ${nutrition.sugars!.toStringAsFixed(1)}g per 100g (${difference}g over recommended limit)');
      } else if (nutrition.sugars! <= guidelines.maxSugarsPer100g * 0.7) {
        benefits.add('Moderate sugar content within safe limits');
      }
    }

    // Check saturated fat against guidelines
    if (nutrition.saturatedFat != null && nutrition.saturatedFat! > guidelines.maxSaturatedFatPer100g) {
      concerns.add('High saturated fat content: ${nutrition.saturatedFat!.toStringAsFixed(1)}g per 100g');
    }

    // Check protein content - beneficial if adequate
    if (nutrition.proteins != null && nutrition.proteins! >= 2) {
      benefits.add('Good protein content: ${nutrition.proteins!.toStringAsFixed(1)}g per 100g - supports growth');
    }

    // Check iron content - very important for babies
    if (nutrition.energyKcal != null && nutrition.energyKcal! > 0) {
      // Iron is usually not listed separately in nutrition data, but we can infer from fortified cereals
      final isLikelyFortified = ingredients.any((ingredient) => 
          ingredient.toLowerCase().contains('fortified') || 
          ingredient.toLowerCase().contains('iron'));
      
      if (isLikelyFortified) {
        benefits.add('Contains iron fortification - essential for preventing anemia');
      }
    }

    // Check for unsafe ingredients for this age group
    for (final ingredient in ingredients) {
      if (!BabyNutritionDatabase.isIngredientSafe(ingredient, guidelines.ageGroup)) {
        concerns.add('Contains unsafe ingredient for ${_getAgeGroupText(guidelines.ageGroup)}: $ingredient');
      }
    }
  }

  static void _checkBeneficialIngredients(List<String> ingredients, List<String> benefits) {
    final beneficialIngredients = {
      'iron': 'Iron - prevents anemia and supports brain development',
      'calcium': 'Calcium - essential for bone and teeth development', 
      'vitamin d': 'Vitamin D - supports bone health and immune system',
      'vitamin c': 'Vitamin C - boosts immune system and iron absorption',
      'vitamin a': 'Vitamin A - important for vision and immune function',
      'omega-3': 'Omega-3 fatty acids - support brain and eye development',
      'dha': 'DHA - crucial for brain and eye development',
      'organic': 'Organic ingredients - reduced exposure to pesticides',
      'whole grain': 'Whole grains - provide fiber and nutrients',
      'probiotics': 'Probiotics - support digestive health',
    };

    for (final ingredient in ingredients) {
      final ingredientLower = ingredient.toLowerCase();
      for (final entry in beneficialIngredients.entries) {
        if (ingredientLower.contains(entry.key)) {
          benefits.add('Contains ${entry.value}');
        }
      }
    }
  }

  static AgeGroup? _determineBestAgeGroup(
    NutritionData nutrition,
    List<String> ingredients,
    bool hasAddedSugars
  ) {
    // If has added sugars, not suitable for any age group
    if (hasAddedSugars) {
      return null;
    }

    final ageGroups = BabyNutritionDatabase.getAllAgeGroups();
    
    // Start with the most restrictive (youngest) age group and work up
    for (final ageGroup in ageGroups) {
      final guidelines = BabyNutritionDatabase.getGuidelinesForAge(ageGroup);
      
      bool isSuitable = true;
      
      // Check if salt content is within limits
      if (nutrition.salt != null && nutrition.salt! > guidelines.maxSaltPer100g) {
        isSuitable = false;
      }
      
      // Check if sugar content is within limits
      if (nutrition.sugars != null && nutrition.sugars! > guidelines.maxSugarsPer100g) {
        isSuitable = false;
      }
      
      // Check if saturated fat is within limits
      if (nutrition.saturatedFat != null && nutrition.saturatedFat! > guidelines.maxSaturatedFatPer100g) {
        isSuitable = false;
      }
      
      // Check for unsafe ingredients
      for (final ingredient in ingredients) {
        if (!BabyNutritionDatabase.isIngredientSafe(ingredient, ageGroup)) {
          isSuitable = false;
          break;
        }
      }
      
      if (isSuitable) {
        return ageGroup;
      }
    }
    
    return null; // Not suitable for any age group
  }

  static String _generateDetailedRecommendation(
    bool isRecommended,
    bool isBabyFood,
    AgeGroup? suitableAge,
    List<String> concerns,
    List<String> benefits,
    bool hasAddedSugars
  ) {
    if (hasAddedSugars) {
      return '🚨 NOT RECOMMENDED - CONTAINS ADDED SUGARS! This product contains added sugars which should be completely avoided for babies. Added sugars provide no nutritional value and can lead to tooth decay and unhealthy eating habits. Choose products with no added sugars.';
    }

    if (!isRecommended) {
      return 'NOT RECOMMENDED for babies due to nutritional concerns that exceed safe limits for infant consumption. Consider alternatives specifically formulated for babies.';
    }

    if (isBabyFood && suitableAge != null) {
      final ageText = _getAgeGroupText(suitableAge);
      final guidelines = BabyNutritionDatabase.getGuidelinesForAge(suitableAge);
      return 'RECOMMENDED for babies $ageText. This product meets the nutritional guidelines for this age group (max salt: ${guidelines.maxSaltPer100g}g/100g, max sugars: ${guidelines.maxSugarsPer100g}g/100g). Always consult your pediatrician before introducing new foods.';
    }

    if (concerns.isEmpty && benefits.isNotEmpty) {
      return 'SUITABLE for babies with careful portion control. This product appears nutritionally appropriate, but monitor your baby\'s reaction when introducing new foods and consult your pediatrician.';
    }

    return 'PROCEED WITH CAUTION. While not specifically harmful, this product may not be optimal for babies. Review the concerns listed below and consult your pediatrician before offering to your baby.';
  }

  static String _getAgeGroupText(AgeGroup ageGroup) {
    switch (ageGroup) {
      case AgeGroup.fourToSixMonths:
        return '4-6 months';
      case AgeGroup.sixToEightMonths:
        return '6-8 months';
      case AgeGroup.eightToTwelveMonths:
        return '8-12 months';
      case AgeGroup.twelveMonthsPlus:
        return '12+ months';
    }
  }
} 