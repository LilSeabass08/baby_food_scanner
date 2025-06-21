import 'package:openfoodfacts/openfoodfacts.dart';
import '../../core/models/food_product.dart';

abstract class FoodRepository {
  Future<FoodProduct?> getFoodProductByBarcode(String barcode);
}

class FoodRepositoryImpl implements FoodRepository {
  FoodRepositoryImpl() {
    // Set up the user agent - required for v3 API
    OpenFoodAPIConfiguration.userAgent = UserAgent(
      name: 'Baby Food Scanner',
      url: 'https://github.com/user/baby_food_scanner',
    );
  }

  @override
  Future<FoodProduct?> getFoodProductByBarcode(String barcode) async {
    try {
      final ProductQueryConfiguration configuration = ProductQueryConfiguration(
        barcode,
        language: OpenFoodFactsLanguage.ENGLISH,
        fields: [
          ProductField.BARCODE,
          ProductField.NAME,
          ProductField.BRANDS,
          ProductField.IMAGE_FRONT_URL,
          ProductField.NUTRIMENTS,
          ProductField.INGREDIENTS_TEXT,
          ProductField.ALLERGENS,
          ProductField.CATEGORIES,
          ProductField.NUTRISCORE,
        ],
        version: ProductQueryVersion.v3,
      );

      final ProductResultV3 result = await OpenFoodAPIClient.getProductV3(
        configuration,
      );

      if (result.status == ProductResultV3.statusSuccess &&
          result.product != null) {
        return _mapToFoodProduct(result.product!);
      }

      return null;
    } catch (e) {
      throw Exception('Failed to fetch product: $e');
    }
  }

  FoodProduct _mapToFoodProduct(Product product) {
    final nutriments = product.nutriments;

    return FoodProduct(
      barcode: product.barcode ?? '',
      name: product.productName ?? 'Unknown Product',
      brand: product.brands ?? '',
      imageUrl: product.imageFrontUrl,
      nutrition: nutriments != null
          ? _mapNutritionData(nutriments, product.nutriscore)
          : null,
      ingredients: _extractIngredients(product.ingredientsText),
      allergens: product.allergens?.names ?? [],
      category: product.categories ?? '',
      isBabyFood: _isBabyFood(product.categories ?? ''),
    );
  }

  NutritionData _mapNutritionData(Nutriments nutriments, String? nutriscore) {
    return NutritionData(
      energyKj: _getSafeNutrientValue(nutriments, Nutrient.energyKJ),
      energyKcal: _getNutrientByKey(nutriments, 'energy'),
      fat: _getSafeNutrientValue(nutriments, Nutrient.fat),
      saturatedFat: _getSafeNutrientValue(nutriments, Nutrient.saturatedFat),
      carbohydrates: _getSafeNutrientValue(nutriments, Nutrient.carbohydrates),
      sugars: _getSafeNutrientValue(nutriments, Nutrient.sugars),
      fiber: _getSafeNutrientValue(nutriments, Nutrient.fiber),
      proteins: _getSafeNutrientValue(nutriments, Nutrient.proteins),
      salt: _getSafeNutrientValue(nutriments, Nutrient.salt),
      sodium: _getSafeNutrientValue(nutriments, Nutrient.sodium),
      nutritionGrade: nutriscore?.toUpperCase() ?? 'UNKNOWN',
    );
  }

  double? _getSafeNutrientValue(Nutriments nutriments, Nutrient nutrient) {
    try {
      return nutriments.getValue(nutrient, PerSize.oneHundredGrams)?.toDouble();
    } catch (e) {
      // Fallback: try to get the value directly from the nutriment map
      try {
        final Map<String, dynamic> nutrimentMap = nutriments.toJson();
        final String key = nutrient.offTag;
        final dynamic value = nutrimentMap['${key}_100g'] ?? nutrimentMap[key];
        if (value != null) {
          return double.tryParse(value.toString());
        }
      } catch (e2) {
        // If all else fails, return null
      }
      return null;
    }
  }

  double? _getNutrientByKey(Nutriments nutriments, String nutrientKey) {
    try {
      final Map<String, dynamic> nutrimentMap = nutriments.toJson();
      final dynamic value =
          nutrimentMap['${nutrientKey}_100g'] ??
          nutrimentMap[nutrientKey] ??
          nutrimentMap['energy-kcal_100g'] ??
          nutrimentMap['energy-kcal'];
      if (value != null) {
        return double.tryParse(value.toString());
      }
    } catch (e) {
      // Return null if any error occurs
    }
    return null;
  }

  List<String> _extractIngredients(String? ingredientsText) {
    if (ingredientsText == null || ingredientsText.isEmpty) return [];

    return ingredientsText
        .split(',')
        .map((ingredient) => ingredient.trim())
        .where((ingredient) => ingredient.isNotEmpty)
        .toList();
  }

  bool _isBabyFood(String categories) {
    final babyFoodKeywords = [
      'baby',
      'infant',
      'toddler',
      'baby food',
      'baby formula',
      'baby cereal',
      'baby puree',
      'baby snacks',
    ];

    final categoriesLower = categories.toLowerCase();
    return babyFoodKeywords.any((keyword) => categoriesLower.contains(keyword));
  }
}
