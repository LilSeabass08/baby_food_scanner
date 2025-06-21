// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'food_product.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

FoodProduct _$FoodProductFromJson(Map<String, dynamic> json) {
  return _FoodProduct.fromJson(json);
}

/// @nodoc
mixin _$FoodProduct {
  String get barcode => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get brand => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;
  NutritionData? get nutrition => throw _privateConstructorUsedError;
  List<String> get ingredients => throw _privateConstructorUsedError;
  List<String> get allergens => throw _privateConstructorUsedError;
  String? get category => throw _privateConstructorUsedError;
  bool get isBabyFood => throw _privateConstructorUsedError;

  /// Serializes this FoodProduct to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FoodProduct
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FoodProductCopyWith<FoodProduct> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FoodProductCopyWith<$Res> {
  factory $FoodProductCopyWith(
    FoodProduct value,
    $Res Function(FoodProduct) then,
  ) = _$FoodProductCopyWithImpl<$Res, FoodProduct>;
  @useResult
  $Res call({
    String barcode,
    String name,
    String? brand,
    String? imageUrl,
    NutritionData? nutrition,
    List<String> ingredients,
    List<String> allergens,
    String? category,
    bool isBabyFood,
  });

  $NutritionDataCopyWith<$Res>? get nutrition;
}

/// @nodoc
class _$FoodProductCopyWithImpl<$Res, $Val extends FoodProduct>
    implements $FoodProductCopyWith<$Res> {
  _$FoodProductCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FoodProduct
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? barcode = null,
    Object? name = null,
    Object? brand = freezed,
    Object? imageUrl = freezed,
    Object? nutrition = freezed,
    Object? ingredients = null,
    Object? allergens = null,
    Object? category = freezed,
    Object? isBabyFood = null,
  }) {
    return _then(
      _value.copyWith(
            barcode: null == barcode
                ? _value.barcode
                : barcode // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            brand: freezed == brand
                ? _value.brand
                : brand // ignore: cast_nullable_to_non_nullable
                      as String?,
            imageUrl: freezed == imageUrl
                ? _value.imageUrl
                : imageUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            nutrition: freezed == nutrition
                ? _value.nutrition
                : nutrition // ignore: cast_nullable_to_non_nullable
                      as NutritionData?,
            ingredients: null == ingredients
                ? _value.ingredients
                : ingredients // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            allergens: null == allergens
                ? _value.allergens
                : allergens // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            category: freezed == category
                ? _value.category
                : category // ignore: cast_nullable_to_non_nullable
                      as String?,
            isBabyFood: null == isBabyFood
                ? _value.isBabyFood
                : isBabyFood // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }

  /// Create a copy of FoodProduct
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NutritionDataCopyWith<$Res>? get nutrition {
    if (_value.nutrition == null) {
      return null;
    }

    return $NutritionDataCopyWith<$Res>(_value.nutrition!, (value) {
      return _then(_value.copyWith(nutrition: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FoodProductImplCopyWith<$Res>
    implements $FoodProductCopyWith<$Res> {
  factory _$$FoodProductImplCopyWith(
    _$FoodProductImpl value,
    $Res Function(_$FoodProductImpl) then,
  ) = __$$FoodProductImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String barcode,
    String name,
    String? brand,
    String? imageUrl,
    NutritionData? nutrition,
    List<String> ingredients,
    List<String> allergens,
    String? category,
    bool isBabyFood,
  });

  @override
  $NutritionDataCopyWith<$Res>? get nutrition;
}

/// @nodoc
class __$$FoodProductImplCopyWithImpl<$Res>
    extends _$FoodProductCopyWithImpl<$Res, _$FoodProductImpl>
    implements _$$FoodProductImplCopyWith<$Res> {
  __$$FoodProductImplCopyWithImpl(
    _$FoodProductImpl _value,
    $Res Function(_$FoodProductImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FoodProduct
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? barcode = null,
    Object? name = null,
    Object? brand = freezed,
    Object? imageUrl = freezed,
    Object? nutrition = freezed,
    Object? ingredients = null,
    Object? allergens = null,
    Object? category = freezed,
    Object? isBabyFood = null,
  }) {
    return _then(
      _$FoodProductImpl(
        barcode: null == barcode
            ? _value.barcode
            : barcode // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        brand: freezed == brand
            ? _value.brand
            : brand // ignore: cast_nullable_to_non_nullable
                  as String?,
        imageUrl: freezed == imageUrl
            ? _value.imageUrl
            : imageUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        nutrition: freezed == nutrition
            ? _value.nutrition
            : nutrition // ignore: cast_nullable_to_non_nullable
                  as NutritionData?,
        ingredients: null == ingredients
            ? _value._ingredients
            : ingredients // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        allergens: null == allergens
            ? _value._allergens
            : allergens // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        category: freezed == category
            ? _value.category
            : category // ignore: cast_nullable_to_non_nullable
                  as String?,
        isBabyFood: null == isBabyFood
            ? _value.isBabyFood
            : isBabyFood // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$FoodProductImpl implements _FoodProduct {
  const _$FoodProductImpl({
    required this.barcode,
    required this.name,
    required this.brand,
    required this.imageUrl,
    required this.nutrition,
    required final List<String> ingredients,
    required final List<String> allergens,
    required this.category,
    required this.isBabyFood,
  }) : _ingredients = ingredients,
       _allergens = allergens;

  factory _$FoodProductImpl.fromJson(Map<String, dynamic> json) =>
      _$$FoodProductImplFromJson(json);

  @override
  final String barcode;
  @override
  final String name;
  @override
  final String? brand;
  @override
  final String? imageUrl;
  @override
  final NutritionData? nutrition;
  final List<String> _ingredients;
  @override
  List<String> get ingredients {
    if (_ingredients is EqualUnmodifiableListView) return _ingredients;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_ingredients);
  }

  final List<String> _allergens;
  @override
  List<String> get allergens {
    if (_allergens is EqualUnmodifiableListView) return _allergens;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_allergens);
  }

  @override
  final String? category;
  @override
  final bool isBabyFood;

  @override
  String toString() {
    return 'FoodProduct(barcode: $barcode, name: $name, brand: $brand, imageUrl: $imageUrl, nutrition: $nutrition, ingredients: $ingredients, allergens: $allergens, category: $category, isBabyFood: $isBabyFood)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FoodProductImpl &&
            (identical(other.barcode, barcode) || other.barcode == barcode) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.brand, brand) || other.brand == brand) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.nutrition, nutrition) ||
                other.nutrition == nutrition) &&
            const DeepCollectionEquality().equals(
              other._ingredients,
              _ingredients,
            ) &&
            const DeepCollectionEquality().equals(
              other._allergens,
              _allergens,
            ) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.isBabyFood, isBabyFood) ||
                other.isBabyFood == isBabyFood));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    barcode,
    name,
    brand,
    imageUrl,
    nutrition,
    const DeepCollectionEquality().hash(_ingredients),
    const DeepCollectionEquality().hash(_allergens),
    category,
    isBabyFood,
  );

  /// Create a copy of FoodProduct
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FoodProductImplCopyWith<_$FoodProductImpl> get copyWith =>
      __$$FoodProductImplCopyWithImpl<_$FoodProductImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FoodProductImplToJson(this);
  }
}

abstract class _FoodProduct implements FoodProduct {
  const factory _FoodProduct({
    required final String barcode,
    required final String name,
    required final String? brand,
    required final String? imageUrl,
    required final NutritionData? nutrition,
    required final List<String> ingredients,
    required final List<String> allergens,
    required final String? category,
    required final bool isBabyFood,
  }) = _$FoodProductImpl;

  factory _FoodProduct.fromJson(Map<String, dynamic> json) =
      _$FoodProductImpl.fromJson;

  @override
  String get barcode;
  @override
  String get name;
  @override
  String? get brand;
  @override
  String? get imageUrl;
  @override
  NutritionData? get nutrition;
  @override
  List<String> get ingredients;
  @override
  List<String> get allergens;
  @override
  String? get category;
  @override
  bool get isBabyFood;

  /// Create a copy of FoodProduct
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FoodProductImplCopyWith<_$FoodProductImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

NutritionData _$NutritionDataFromJson(Map<String, dynamic> json) {
  return _NutritionData.fromJson(json);
}

/// @nodoc
mixin _$NutritionData {
  double? get energyKj => throw _privateConstructorUsedError;
  double? get energyKcal => throw _privateConstructorUsedError;
  double? get fat => throw _privateConstructorUsedError;
  double? get saturatedFat => throw _privateConstructorUsedError;
  double? get carbohydrates => throw _privateConstructorUsedError;
  double? get sugars => throw _privateConstructorUsedError;
  double? get fiber => throw _privateConstructorUsedError;
  double? get proteins => throw _privateConstructorUsedError;
  double? get salt => throw _privateConstructorUsedError;
  double? get sodium => throw _privateConstructorUsedError;
  String get nutritionGrade => throw _privateConstructorUsedError;

  /// Serializes this NutritionData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NutritionData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NutritionDataCopyWith<NutritionData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NutritionDataCopyWith<$Res> {
  factory $NutritionDataCopyWith(
    NutritionData value,
    $Res Function(NutritionData) then,
  ) = _$NutritionDataCopyWithImpl<$Res, NutritionData>;
  @useResult
  $Res call({
    double? energyKj,
    double? energyKcal,
    double? fat,
    double? saturatedFat,
    double? carbohydrates,
    double? sugars,
    double? fiber,
    double? proteins,
    double? salt,
    double? sodium,
    String nutritionGrade,
  });
}

/// @nodoc
class _$NutritionDataCopyWithImpl<$Res, $Val extends NutritionData>
    implements $NutritionDataCopyWith<$Res> {
  _$NutritionDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NutritionData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? energyKj = freezed,
    Object? energyKcal = freezed,
    Object? fat = freezed,
    Object? saturatedFat = freezed,
    Object? carbohydrates = freezed,
    Object? sugars = freezed,
    Object? fiber = freezed,
    Object? proteins = freezed,
    Object? salt = freezed,
    Object? sodium = freezed,
    Object? nutritionGrade = null,
  }) {
    return _then(
      _value.copyWith(
            energyKj: freezed == energyKj
                ? _value.energyKj
                : energyKj // ignore: cast_nullable_to_non_nullable
                      as double?,
            energyKcal: freezed == energyKcal
                ? _value.energyKcal
                : energyKcal // ignore: cast_nullable_to_non_nullable
                      as double?,
            fat: freezed == fat
                ? _value.fat
                : fat // ignore: cast_nullable_to_non_nullable
                      as double?,
            saturatedFat: freezed == saturatedFat
                ? _value.saturatedFat
                : saturatedFat // ignore: cast_nullable_to_non_nullable
                      as double?,
            carbohydrates: freezed == carbohydrates
                ? _value.carbohydrates
                : carbohydrates // ignore: cast_nullable_to_non_nullable
                      as double?,
            sugars: freezed == sugars
                ? _value.sugars
                : sugars // ignore: cast_nullable_to_non_nullable
                      as double?,
            fiber: freezed == fiber
                ? _value.fiber
                : fiber // ignore: cast_nullable_to_non_nullable
                      as double?,
            proteins: freezed == proteins
                ? _value.proteins
                : proteins // ignore: cast_nullable_to_non_nullable
                      as double?,
            salt: freezed == salt
                ? _value.salt
                : salt // ignore: cast_nullable_to_non_nullable
                      as double?,
            sodium: freezed == sodium
                ? _value.sodium
                : sodium // ignore: cast_nullable_to_non_nullable
                      as double?,
            nutritionGrade: null == nutritionGrade
                ? _value.nutritionGrade
                : nutritionGrade // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$NutritionDataImplCopyWith<$Res>
    implements $NutritionDataCopyWith<$Res> {
  factory _$$NutritionDataImplCopyWith(
    _$NutritionDataImpl value,
    $Res Function(_$NutritionDataImpl) then,
  ) = __$$NutritionDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    double? energyKj,
    double? energyKcal,
    double? fat,
    double? saturatedFat,
    double? carbohydrates,
    double? sugars,
    double? fiber,
    double? proteins,
    double? salt,
    double? sodium,
    String nutritionGrade,
  });
}

/// @nodoc
class __$$NutritionDataImplCopyWithImpl<$Res>
    extends _$NutritionDataCopyWithImpl<$Res, _$NutritionDataImpl>
    implements _$$NutritionDataImplCopyWith<$Res> {
  __$$NutritionDataImplCopyWithImpl(
    _$NutritionDataImpl _value,
    $Res Function(_$NutritionDataImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of NutritionData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? energyKj = freezed,
    Object? energyKcal = freezed,
    Object? fat = freezed,
    Object? saturatedFat = freezed,
    Object? carbohydrates = freezed,
    Object? sugars = freezed,
    Object? fiber = freezed,
    Object? proteins = freezed,
    Object? salt = freezed,
    Object? sodium = freezed,
    Object? nutritionGrade = null,
  }) {
    return _then(
      _$NutritionDataImpl(
        energyKj: freezed == energyKj
            ? _value.energyKj
            : energyKj // ignore: cast_nullable_to_non_nullable
                  as double?,
        energyKcal: freezed == energyKcal
            ? _value.energyKcal
            : energyKcal // ignore: cast_nullable_to_non_nullable
                  as double?,
        fat: freezed == fat
            ? _value.fat
            : fat // ignore: cast_nullable_to_non_nullable
                  as double?,
        saturatedFat: freezed == saturatedFat
            ? _value.saturatedFat
            : saturatedFat // ignore: cast_nullable_to_non_nullable
                  as double?,
        carbohydrates: freezed == carbohydrates
            ? _value.carbohydrates
            : carbohydrates // ignore: cast_nullable_to_non_nullable
                  as double?,
        sugars: freezed == sugars
            ? _value.sugars
            : sugars // ignore: cast_nullable_to_non_nullable
                  as double?,
        fiber: freezed == fiber
            ? _value.fiber
            : fiber // ignore: cast_nullable_to_non_nullable
                  as double?,
        proteins: freezed == proteins
            ? _value.proteins
            : proteins // ignore: cast_nullable_to_non_nullable
                  as double?,
        salt: freezed == salt
            ? _value.salt
            : salt // ignore: cast_nullable_to_non_nullable
                  as double?,
        sodium: freezed == sodium
            ? _value.sodium
            : sodium // ignore: cast_nullable_to_non_nullable
                  as double?,
        nutritionGrade: null == nutritionGrade
            ? _value.nutritionGrade
            : nutritionGrade // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$NutritionDataImpl implements _NutritionData {
  const _$NutritionDataImpl({
    required this.energyKj,
    required this.energyKcal,
    required this.fat,
    required this.saturatedFat,
    required this.carbohydrates,
    required this.sugars,
    required this.fiber,
    required this.proteins,
    required this.salt,
    required this.sodium,
    required this.nutritionGrade,
  });

  factory _$NutritionDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$NutritionDataImplFromJson(json);

  @override
  final double? energyKj;
  @override
  final double? energyKcal;
  @override
  final double? fat;
  @override
  final double? saturatedFat;
  @override
  final double? carbohydrates;
  @override
  final double? sugars;
  @override
  final double? fiber;
  @override
  final double? proteins;
  @override
  final double? salt;
  @override
  final double? sodium;
  @override
  final String nutritionGrade;

  @override
  String toString() {
    return 'NutritionData(energyKj: $energyKj, energyKcal: $energyKcal, fat: $fat, saturatedFat: $saturatedFat, carbohydrates: $carbohydrates, sugars: $sugars, fiber: $fiber, proteins: $proteins, salt: $salt, sodium: $sodium, nutritionGrade: $nutritionGrade)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NutritionDataImpl &&
            (identical(other.energyKj, energyKj) ||
                other.energyKj == energyKj) &&
            (identical(other.energyKcal, energyKcal) ||
                other.energyKcal == energyKcal) &&
            (identical(other.fat, fat) || other.fat == fat) &&
            (identical(other.saturatedFat, saturatedFat) ||
                other.saturatedFat == saturatedFat) &&
            (identical(other.carbohydrates, carbohydrates) ||
                other.carbohydrates == carbohydrates) &&
            (identical(other.sugars, sugars) || other.sugars == sugars) &&
            (identical(other.fiber, fiber) || other.fiber == fiber) &&
            (identical(other.proteins, proteins) ||
                other.proteins == proteins) &&
            (identical(other.salt, salt) || other.salt == salt) &&
            (identical(other.sodium, sodium) || other.sodium == sodium) &&
            (identical(other.nutritionGrade, nutritionGrade) ||
                other.nutritionGrade == nutritionGrade));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    energyKj,
    energyKcal,
    fat,
    saturatedFat,
    carbohydrates,
    sugars,
    fiber,
    proteins,
    salt,
    sodium,
    nutritionGrade,
  );

  /// Create a copy of NutritionData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NutritionDataImplCopyWith<_$NutritionDataImpl> get copyWith =>
      __$$NutritionDataImplCopyWithImpl<_$NutritionDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NutritionDataImplToJson(this);
  }
}

abstract class _NutritionData implements NutritionData {
  const factory _NutritionData({
    required final double? energyKj,
    required final double? energyKcal,
    required final double? fat,
    required final double? saturatedFat,
    required final double? carbohydrates,
    required final double? sugars,
    required final double? fiber,
    required final double? proteins,
    required final double? salt,
    required final double? sodium,
    required final String nutritionGrade,
  }) = _$NutritionDataImpl;

  factory _NutritionData.fromJson(Map<String, dynamic> json) =
      _$NutritionDataImpl.fromJson;

  @override
  double? get energyKj;
  @override
  double? get energyKcal;
  @override
  double? get fat;
  @override
  double? get saturatedFat;
  @override
  double? get carbohydrates;
  @override
  double? get sugars;
  @override
  double? get fiber;
  @override
  double? get proteins;
  @override
  double? get salt;
  @override
  double? get sodium;
  @override
  String get nutritionGrade;

  /// Create a copy of NutritionData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NutritionDataImplCopyWith<_$NutritionDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

BabyFoodRecommendation _$BabyFoodRecommendationFromJson(
  Map<String, dynamic> json,
) {
  return _BabyFoodRecommendation.fromJson(json);
}

/// @nodoc
mixin _$BabyFoodRecommendation {
  bool get isRecommended => throw _privateConstructorUsedError;
  String get recommendation => throw _privateConstructorUsedError;
  List<String> get concerns => throw _privateConstructorUsedError;
  List<String> get benefits => throw _privateConstructorUsedError;
  AgeGroup? get suitableAgeGroup => throw _privateConstructorUsedError;

  /// Serializes this BabyFoodRecommendation to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BabyFoodRecommendation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BabyFoodRecommendationCopyWith<BabyFoodRecommendation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BabyFoodRecommendationCopyWith<$Res> {
  factory $BabyFoodRecommendationCopyWith(
    BabyFoodRecommendation value,
    $Res Function(BabyFoodRecommendation) then,
  ) = _$BabyFoodRecommendationCopyWithImpl<$Res, BabyFoodRecommendation>;
  @useResult
  $Res call({
    bool isRecommended,
    String recommendation,
    List<String> concerns,
    List<String> benefits,
    AgeGroup? suitableAgeGroup,
  });
}

/// @nodoc
class _$BabyFoodRecommendationCopyWithImpl<
  $Res,
  $Val extends BabyFoodRecommendation
>
    implements $BabyFoodRecommendationCopyWith<$Res> {
  _$BabyFoodRecommendationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BabyFoodRecommendation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isRecommended = null,
    Object? recommendation = null,
    Object? concerns = null,
    Object? benefits = null,
    Object? suitableAgeGroup = freezed,
  }) {
    return _then(
      _value.copyWith(
            isRecommended: null == isRecommended
                ? _value.isRecommended
                : isRecommended // ignore: cast_nullable_to_non_nullable
                      as bool,
            recommendation: null == recommendation
                ? _value.recommendation
                : recommendation // ignore: cast_nullable_to_non_nullable
                      as String,
            concerns: null == concerns
                ? _value.concerns
                : concerns // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            benefits: null == benefits
                ? _value.benefits
                : benefits // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            suitableAgeGroup: freezed == suitableAgeGroup
                ? _value.suitableAgeGroup
                : suitableAgeGroup // ignore: cast_nullable_to_non_nullable
                      as AgeGroup?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$BabyFoodRecommendationImplCopyWith<$Res>
    implements $BabyFoodRecommendationCopyWith<$Res> {
  factory _$$BabyFoodRecommendationImplCopyWith(
    _$BabyFoodRecommendationImpl value,
    $Res Function(_$BabyFoodRecommendationImpl) then,
  ) = __$$BabyFoodRecommendationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool isRecommended,
    String recommendation,
    List<String> concerns,
    List<String> benefits,
    AgeGroup? suitableAgeGroup,
  });
}

/// @nodoc
class __$$BabyFoodRecommendationImplCopyWithImpl<$Res>
    extends
        _$BabyFoodRecommendationCopyWithImpl<$Res, _$BabyFoodRecommendationImpl>
    implements _$$BabyFoodRecommendationImplCopyWith<$Res> {
  __$$BabyFoodRecommendationImplCopyWithImpl(
    _$BabyFoodRecommendationImpl _value,
    $Res Function(_$BabyFoodRecommendationImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BabyFoodRecommendation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isRecommended = null,
    Object? recommendation = null,
    Object? concerns = null,
    Object? benefits = null,
    Object? suitableAgeGroup = freezed,
  }) {
    return _then(
      _$BabyFoodRecommendationImpl(
        isRecommended: null == isRecommended
            ? _value.isRecommended
            : isRecommended // ignore: cast_nullable_to_non_nullable
                  as bool,
        recommendation: null == recommendation
            ? _value.recommendation
            : recommendation // ignore: cast_nullable_to_non_nullable
                  as String,
        concerns: null == concerns
            ? _value._concerns
            : concerns // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        benefits: null == benefits
            ? _value._benefits
            : benefits // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        suitableAgeGroup: freezed == suitableAgeGroup
            ? _value.suitableAgeGroup
            : suitableAgeGroup // ignore: cast_nullable_to_non_nullable
                  as AgeGroup?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$BabyFoodRecommendationImpl implements _BabyFoodRecommendation {
  const _$BabyFoodRecommendationImpl({
    required this.isRecommended,
    required this.recommendation,
    required final List<String> concerns,
    required final List<String> benefits,
    required this.suitableAgeGroup,
  }) : _concerns = concerns,
       _benefits = benefits;

  factory _$BabyFoodRecommendationImpl.fromJson(Map<String, dynamic> json) =>
      _$$BabyFoodRecommendationImplFromJson(json);

  @override
  final bool isRecommended;
  @override
  final String recommendation;
  final List<String> _concerns;
  @override
  List<String> get concerns {
    if (_concerns is EqualUnmodifiableListView) return _concerns;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_concerns);
  }

  final List<String> _benefits;
  @override
  List<String> get benefits {
    if (_benefits is EqualUnmodifiableListView) return _benefits;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_benefits);
  }

  @override
  final AgeGroup? suitableAgeGroup;

  @override
  String toString() {
    return 'BabyFoodRecommendation(isRecommended: $isRecommended, recommendation: $recommendation, concerns: $concerns, benefits: $benefits, suitableAgeGroup: $suitableAgeGroup)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BabyFoodRecommendationImpl &&
            (identical(other.isRecommended, isRecommended) ||
                other.isRecommended == isRecommended) &&
            (identical(other.recommendation, recommendation) ||
                other.recommendation == recommendation) &&
            const DeepCollectionEquality().equals(other._concerns, _concerns) &&
            const DeepCollectionEquality().equals(other._benefits, _benefits) &&
            (identical(other.suitableAgeGroup, suitableAgeGroup) ||
                other.suitableAgeGroup == suitableAgeGroup));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    isRecommended,
    recommendation,
    const DeepCollectionEquality().hash(_concerns),
    const DeepCollectionEquality().hash(_benefits),
    suitableAgeGroup,
  );

  /// Create a copy of BabyFoodRecommendation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BabyFoodRecommendationImplCopyWith<_$BabyFoodRecommendationImpl>
  get copyWith =>
      __$$BabyFoodRecommendationImplCopyWithImpl<_$BabyFoodRecommendationImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$BabyFoodRecommendationImplToJson(this);
  }
}

abstract class _BabyFoodRecommendation implements BabyFoodRecommendation {
  const factory _BabyFoodRecommendation({
    required final bool isRecommended,
    required final String recommendation,
    required final List<String> concerns,
    required final List<String> benefits,
    required final AgeGroup? suitableAgeGroup,
  }) = _$BabyFoodRecommendationImpl;

  factory _BabyFoodRecommendation.fromJson(Map<String, dynamic> json) =
      _$BabyFoodRecommendationImpl.fromJson;

  @override
  bool get isRecommended;
  @override
  String get recommendation;
  @override
  List<String> get concerns;
  @override
  List<String> get benefits;
  @override
  AgeGroup? get suitableAgeGroup;

  /// Create a copy of BabyFoodRecommendation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BabyFoodRecommendationImplCopyWith<_$BabyFoodRecommendationImpl>
  get copyWith => throw _privateConstructorUsedError;
}
