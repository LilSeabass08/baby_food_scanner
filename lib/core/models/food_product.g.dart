// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FoodProductImpl _$$FoodProductImplFromJson(Map<String, dynamic> json) =>
    _$FoodProductImpl(
      barcode: json['barcode'] as String,
      name: json['name'] as String,
      brand: json['brand'] as String?,
      imageUrl: json['imageUrl'] as String?,
      nutrition: json['nutrition'] == null
          ? null
          : NutritionData.fromJson(json['nutrition'] as Map<String, dynamic>),
      ingredients: (json['ingredients'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      allergens: (json['allergens'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      category: json['category'] as String?,
      isBabyFood: json['isBabyFood'] as bool,
    );

Map<String, dynamic> _$$FoodProductImplToJson(_$FoodProductImpl instance) =>
    <String, dynamic>{
      'barcode': instance.barcode,
      'name': instance.name,
      'brand': instance.brand,
      'imageUrl': instance.imageUrl,
      'nutrition': instance.nutrition,
      'ingredients': instance.ingredients,
      'allergens': instance.allergens,
      'category': instance.category,
      'isBabyFood': instance.isBabyFood,
    };

_$NutritionDataImpl _$$NutritionDataImplFromJson(Map<String, dynamic> json) =>
    _$NutritionDataImpl(
      energyKj: (json['energyKj'] as num?)?.toDouble(),
      energyKcal: (json['energyKcal'] as num?)?.toDouble(),
      fat: (json['fat'] as num?)?.toDouble(),
      saturatedFat: (json['saturatedFat'] as num?)?.toDouble(),
      carbohydrates: (json['carbohydrates'] as num?)?.toDouble(),
      sugars: (json['sugars'] as num?)?.toDouble(),
      fiber: (json['fiber'] as num?)?.toDouble(),
      proteins: (json['proteins'] as num?)?.toDouble(),
      salt: (json['salt'] as num?)?.toDouble(),
      sodium: (json['sodium'] as num?)?.toDouble(),
      nutritionGrade: json['nutritionGrade'] as String,
    );

Map<String, dynamic> _$$NutritionDataImplToJson(_$NutritionDataImpl instance) =>
    <String, dynamic>{
      'energyKj': instance.energyKj,
      'energyKcal': instance.energyKcal,
      'fat': instance.fat,
      'saturatedFat': instance.saturatedFat,
      'carbohydrates': instance.carbohydrates,
      'sugars': instance.sugars,
      'fiber': instance.fiber,
      'proteins': instance.proteins,
      'salt': instance.salt,
      'sodium': instance.sodium,
      'nutritionGrade': instance.nutritionGrade,
    };

_$BabyFoodRecommendationImpl _$$BabyFoodRecommendationImplFromJson(
  Map<String, dynamic> json,
) => _$BabyFoodRecommendationImpl(
  isRecommended: json['isRecommended'] as bool,
  recommendation: json['recommendation'] as String,
  concerns: (json['concerns'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  benefits: (json['benefits'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  suitableAgeGroup: $enumDecodeNullable(
    _$AgeGroupEnumMap,
    json['suitableAgeGroup'],
  ),
);

Map<String, dynamic> _$$BabyFoodRecommendationImplToJson(
  _$BabyFoodRecommendationImpl instance,
) => <String, dynamic>{
  'isRecommended': instance.isRecommended,
  'recommendation': instance.recommendation,
  'concerns': instance.concerns,
  'benefits': instance.benefits,
  'suitableAgeGroup': _$AgeGroupEnumMap[instance.suitableAgeGroup],
};

const _$AgeGroupEnumMap = {
  AgeGroup.fourToSixMonths: '4-6_months',
  AgeGroup.sixToEightMonths: '6-8_months',
  AgeGroup.eightToTwelveMonths: '8-12_months',
  AgeGroup.twelveMonthsPlus: '12+_months',
};
