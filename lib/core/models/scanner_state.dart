import 'package:freezed_annotation/freezed_annotation.dart';
import 'food_product.dart';

part 'scanner_state.freezed.dart';

@freezed
class ScannerState with _$ScannerState {
  const factory ScannerState.initial() = _Initial;
  const factory ScannerState.scanning() = _Scanning;
  const factory ScannerState.loading() = _Loading;
  const factory ScannerState.success({
    required FoodProduct product,
    required BabyFoodRecommendation recommendation,
  }) = _Success;
  const factory ScannerState.error({
    required String message,
  }) = _Error;
} 