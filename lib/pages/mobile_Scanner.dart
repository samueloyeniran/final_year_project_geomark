import 'package:flutter/material.dart';
import 'package:geomark/components/AppColor.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class MobileScannerPage extends StatefulWidget {
  const MobileScannerPage({super.key});

  @override
  State<MobileScannerPage> createState() => _MobileScannerPageState();
}

class _MobileScannerPageState extends State<MobileScannerPage> {
  final MobileScannerController controller = MobileScannerController();
  String scannedResult = "Scan a QR Code";
  bool isScanning = true;

  void _handleBarcode(String code) {
    if (!isScanning) return;

    setState(() {
      isScanning = false;
      scannedResult = code;
    });

    // ✅ Show snack bar message
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Scanned: $code"),
        backgroundColor: Colors.green,
        duration: const Duration(seconds: 2),
      ),
    );

    // Resume scanning after delay
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) setState(() => isScanning = true);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appbarcolor,
        centerTitle: true,
        title: const Text("GEOMARK", style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(
            icon: const Icon(Icons.flash_on),
            onPressed: () => controller.toggleTorch(),
          ),
        ],
      ),
      body: Stack(
        children: [
          MobileScanner(
            controller: controller,
            onDetect: (capture) {
              final List<Barcode> barcodes = capture.barcodes;
              for (final barcode in barcodes) {
                final String? value = barcode.rawValue;
                if (value != null) _handleBarcode(value);
              }
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.all(16),
              color: Colors.black.withOpacity(0.6),
              child: Text(
                scannedResult,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
