import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../core/models/food_product.dart';

class ProductDetailsWidget extends StatelessWidget {
  final FoodProduct product;
  final BabyFoodRecommendation recommendation;

  const ProductDetailsWidget({
    super.key,
    required this.product,
    required this.recommendation,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildProductHeader(),
          const SizedBox(height: 20),
          _buildRecommendationCard(),
          const SizedBox(height: 20),
          _buildNutritionCard(),
          const SizedBox(height: 20),
          _buildIngredientsCard(),
          if (product.allergens.isNotEmpty) ...[
            const SizedBox(height: 20),
            _buildAllergensCard(),
          ],
        ],
      ),
    );
  }

  Widget _buildProductHeader() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.1),
            spreadRadius: 1,
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.grey[200],
            ),
            child: product.imageUrl != null
                ? CachedNetworkImage(
                    imageUrl: product.imageUrl!,
                    fit: BoxFit.cover,
                    placeholder: (context, url) =>
                        const Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) => const Icon(
                      Icons.fastfood,
                      color: Colors.grey,
                      size: 40,
                    ),
                  )
                : const Icon(Icons.fastfood, color: Colors.grey, size: 40),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (product.brand != null && product.brand!.isNotEmpty) ...[
                  const SizedBox(height: 4),
                  Text(
                    product.brand!,
                    style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                  ),
                ],
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: product.isBabyFood
                        ? Colors.green[100]
                        : Colors.orange[100],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    product.isBabyFood ? 'Baby Food' : 'General Food',
                    style: TextStyle(
                      fontSize: 12,
                      color: product.isBabyFood
                          ? Colors.green[800]
                          : Colors.orange[800],
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRecommendationCard() {
    final bool isRecommended = recommendation.isRecommended;
    final bool hasAddedSugarWarning = recommendation.concerns.any(
      (concern) => concern.contains('ADDED SUGARS') || concern.contains('🚨'),
    );

    final Color cardColor = hasAddedSugarWarning
        ? Colors.red[700]!
        : (isRecommended ? Colors.green : Colors.red);
    final IconData icon = hasAddedSugarWarning
        ? Icons.dangerous
        : (isRecommended ? Icons.check_circle : Icons.warning);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: cardColor.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: cardColor.withValues(alpha: 0.3),
          width: hasAddedSugarWarning ? 2 : 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: cardColor, size: 24),
              const SizedBox(width: 8),
              Text(
                isRecommended ? 'RECOMMENDED' : 'NOT RECOMMENDED',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: cardColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            recommendation.recommendation,
            style: const TextStyle(fontSize: 14),
          ),
          if (recommendation.suitableAgeGroup != null) ...[
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.blue[100],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                'Suitable for: ${_getAgeGroupText(recommendation.suitableAgeGroup!)}',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.blue[800],
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
          if (recommendation.benefits.isNotEmpty) ...[
            const SizedBox(height: 16),
            const Text(
              'Benefits:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            ...recommendation.benefits.map(
              (benefit) => Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.check, color: Colors.green, size: 16),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(benefit, style: const TextStyle(fontSize: 13)),
                  ),
                ],
              ),
            ),
          ],
          if (recommendation.concerns.isNotEmpty) ...[
            const SizedBox(height: 16),
            const Text(
              'Concerns:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            ...recommendation.concerns.map(
              (concern) => Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      concern.contains('ADDED SUGARS') || concern.contains('🚨')
                          ? Icons.dangerous
                          : Icons.warning,
                      color:
                          concern.contains('ADDED SUGARS') ||
                              concern.contains('🚨')
                          ? Colors.red[700]
                          : Colors.orange,
                      size: 16,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        concern,
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight:
                              concern.contains('ADDED SUGARS') ||
                                  concern.contains('🚨')
                              ? FontWeight.bold
                              : FontWeight.normal,
                          color:
                              concern.contains('ADDED SUGARS') ||
                                  concern.contains('🚨')
                              ? Colors.red[700]
                              : Colors.black87,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildNutritionCard() {
    if (product.nutrition == null) {
      return Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withValues(alpha: 0.1),
              spreadRadius: 1,
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: const Text('No nutrition information available'),
      );
    }

    final nutrition = product.nutrition!;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.1),
            spreadRadius: 1,
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Nutrition Facts (per 100g)',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          _buildNutritionRow(
            'Energy',
            '${nutrition.energyKcal?.toStringAsFixed(0) ?? 'N/A'} kcal',
          ),
          _buildNutritionRow(
            'Fat',
            '${nutrition.fat?.toStringAsFixed(1) ?? 'N/A'} g',
          ),
          _buildNutritionRow(
            'Saturated Fat',
            '${nutrition.saturatedFat?.toStringAsFixed(1) ?? 'N/A'} g',
          ),
          _buildNutritionRow(
            'Carbohydrates',
            '${nutrition.carbohydrates?.toStringAsFixed(1) ?? 'N/A'} g',
          ),
          _buildNutritionRow(
            'Sugars',
            '${nutrition.sugars?.toStringAsFixed(1) ?? 'N/A'} g',
          ),
          _buildNutritionRow(
            'Fiber',
            '${nutrition.fiber?.toStringAsFixed(1) ?? 'N/A'} g',
          ),
          _buildNutritionRow(
            'Protein',
            '${nutrition.proteins?.toStringAsFixed(1) ?? 'N/A'} g',
          ),
          _buildNutritionRow(
            'Salt',
            '${nutrition.salt?.toStringAsFixed(2) ?? 'N/A'} g',
          ),
          if (nutrition.nutritionGrade.isNotEmpty &&
              nutrition.nutritionGrade != 'UNKNOWN') ...[
            const SizedBox(height: 12),
            Row(
              children: [
                const Text(
                  'Nutri-Score: ',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: _getNutriScoreColor(nutrition.nutritionGrade),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    nutrition.nutritionGrade,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildNutritionRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label),
          Text(value, style: const TextStyle(fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }

  Widget _buildIngredientsCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.1),
            spreadRadius: 1,
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Ingredients',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          product.ingredients.isEmpty
              ? const Text('No ingredients information available')
              : Text(product.ingredients.join(', ')),
        ],
      ),
    );
  }

  Widget _buildAllergensCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.red[50],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.red[200]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(Icons.warning, color: Colors.red),
              SizedBox(width: 8),
              Text(
                'Allergens',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(product.allergens.join(', ')),
        ],
      ),
    );
  }

  String _getAgeGroupText(AgeGroup ageGroup) {
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

  Color _getNutriScoreColor(String grade) {
    switch (grade.toUpperCase()) {
      case 'A':
        return Colors.green;
      case 'B':
        return Colors.lightGreen;
      case 'C':
        return Colors.yellow[700]!;
      case 'D':
        return Colors.orange;
      case 'E':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }
}
