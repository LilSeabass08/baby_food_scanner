import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../controllers/scanner_controller.dart';
import '../widgets/barcode_scanner_widget.dart';
import '../widgets/product_details_widget.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final scannerState = ref.watch(scannerControllerProvider);
    final scannerController = ref.read(scannerControllerProvider.notifier);

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text(
          'Baby Food Scanner',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue[600],
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: scannerState.when(
        initial: () => _buildInitialView(context),
        scanning: () => _buildScanningView(),
        loading: () => _buildLoadingView(),
        success: (product, recommendation) => Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              color: Colors.white,
              child: Row(
                children: [
                  IconButton(
                    onPressed: () => scannerController.resetToInitial(),
                    icon: const Icon(Icons.arrow_back),
                  ),
                  const Text(
                    'Product Details',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  TextButton.icon(
                    onPressed: () => scannerController.resetToScanning(),
                    icon: const Icon(Icons.qr_code_scanner),
                    label: const Text('Scan Again'),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ProductDetailsWidget(
                product: product,
                recommendation: recommendation,
              ),
            ),
          ],
        ),
        error: (message) =>
            _buildErrorView(context, message, scannerController),
      ),
    );
  }

  Widget _buildInitialView(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: Colors.blue[100],
                borderRadius: BorderRadius.circular(60),
              ),
              child: Icon(
                Icons.baby_changing_station,
                size: 60,
                color: Colors.blue[600],
              ),
            ),
            const SizedBox(height: 32),
            const Text(
              'Baby Food Scanner',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Scan baby food products to get nutritional analysis and safety recommendations for your little one.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.grey, height: 1.5),
            ),
            const SizedBox(height: 48),
            Container(
              width: double.infinity,
              height: 56,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                gradient: LinearGradient(
                  colors: [Colors.blue[600]!, Colors.blue[400]!],
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.blue.withValues(alpha: 0.3),
                    spreadRadius: 1,
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: ElevatedButton(
                onPressed: () => _startScanning(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.qr_code_scanner, color: Colors.white, size: 24),
                    SizedBox(width: 12),
                    Text(
                      'Start Scanning',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.orange[50],
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.orange[200]!),
              ),
              child: Row(
                children: [
                  Icon(Icons.info_outline, color: Colors.orange[600], size: 20),
                  const SizedBox(width: 12),
                  const Expanded(
                    child: Text(
                      'Point your camera at the barcode on baby food packaging',
                      style: TextStyle(fontSize: 14, color: Colors.black87),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildScanningView() {
    return const Center(
      child: Text('Camera view should be here', style: TextStyle(fontSize: 18)),
    );
  }

  Widget _buildLoadingView() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(),
          SizedBox(height: 16),
          Text('Analyzing product...', style: TextStyle(fontSize: 16)),
        ],
      ),
    );
  }

  Widget _buildErrorView(
    BuildContext context,
    String message,
    ScannerController controller,
  ) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.error_outline, size: 64, color: Colors.red[400]),
            const SizedBox(height: 16),
            const Text(
              'Oops! Something went wrong',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              message,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () => controller.resetToInitial(),
                  child: const Text('Go Back'),
                ),
                ElevatedButton(
                  onPressed: () => _startScanning(context),
                  child: const Text('Try Again'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _startScanning(BuildContext context) async {
    // First check the current permission status
    PermissionStatus currentStatus = await Permission.camera.status;
    
    if (currentStatus == PermissionStatus.denied) {
      // Show a dialog explaining why we need camera access
      if (!context.mounted) return;
      
      final bool shouldRequest = await showDialog<bool>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Camera Permission Required'),
          content: const Text(
            'This app needs camera access to scan baby food barcodes and provide nutritional information. '
            'Please allow camera access to continue.',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: const Text('Allow Camera'),
            ),
          ],
        ),
      ) ?? false;
      
      if (!shouldRequest) return;
    }
    
    // Request permission
    final PermissionStatus cameraPermission = await Permission.camera.request();

    if (!context.mounted) return;

    if (cameraPermission == PermissionStatus.granted) {
      final scannerController = ref.read(scannerControllerProvider.notifier);
      scannerController.resetToScanning();

      await Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => BarcodeScannerWidget(
            onBarcodeDetected: (String barcode) {
              if (context.mounted) {
                Navigator.of(context).pop();
                scannerController.scanBarcode(barcode);
              }
            },
          ),
        ),
      );
    } else if (cameraPermission == PermissionStatus.permanentlyDenied) {
      // Show dialog to open app settings
      if (!context.mounted) return;
      
      final bool openSettings = await showDialog<bool>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Camera Permission Required'),
          content: const Text(
            'Camera access has been permanently denied. Please enable camera access in your device settings to use the barcode scanner.',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: const Text('Open Settings'),
            ),
          ],
        ),
      ) ?? false;
      
      if (openSettings) {
        await openAppSettings();
      }
    } else {
      if (!context.mounted) return;
      
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Camera permission is required to scan barcodes'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}
