import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../core/models/scanner_state.dart';
import '../core/models/food_product.dart';
import '../data/repositories/food_repository.dart';
import '../services/baby_food_analyzer.dart';

final foodRepositoryProvider = Provider<FoodRepository>((ref) {
  return FoodRepositoryImpl();
});

final scannerControllerProvider = StateNotifierProvider<ScannerController, ScannerState>((ref) {
  return ScannerController(ref.watch(foodRepositoryProvider));
});

class ScannerController extends StateNotifier<ScannerState> {
  final FoodRepository _foodRepository;

  ScannerController(this._foodRepository) : super(const ScannerState.initial());

  Future<void> scanBarcode(String barcode) async {
    state = const ScannerState.loading();
    
    try {
      final FoodProduct? product = await _foodRepository.getFoodProductByBarcode(barcode);
      
      if (product != null) {
        final BabyFoodRecommendation recommendation = BabyFoodAnalyzer.analyzeProduct(product);
        
        state = ScannerState.success(
          product: product,
          recommendation: recommendation,
        );
      } else {
        state = const ScannerState.error(
          message: 'Product not found in database. Please try scanning again or check if the barcode is visible.',
        );
      }
    } catch (e) {
      state = ScannerState.error(
        message: 'Failed to fetch product information: ${e.toString()}',
      );
    }
  }

  void resetToScanning() {
    state = const ScannerState.scanning();
  }

  void resetToInitial() {
    state = const ScannerState.initial();
  }
} 