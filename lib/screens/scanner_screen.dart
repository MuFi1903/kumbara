import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import '../constants/colors.dart';

class ScannerScreen extends StatefulWidget {
  const ScannerScreen({super.key});

  @override
  State<ScannerScreen> createState() => _ScannerScreenState();
}

class _ScannerScreenState extends State<ScannerScreen> {
  final MobileScannerController _cameraController = MobileScannerController();
  bool _isScanCompleted = false;

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: AppColors.darkNavy,
        elevation: 0,
        title: const Text(
          'Müşteri Kodu Tara',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.white,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Stack(
        children: [
          // 1. KATMAN: CANLI KAMERA GÖRÜNTÜSÜ
          MobileScanner(
            controller: _cameraController,
            onDetect: (capture) {
              final List<Barcode> barcodes = capture.barcodes;

              if (barcodes.isNotEmpty && !_isScanCompleted) {
                setState(() {
                  _isScanCompleted = true;
                });

                final String codeValue =
                    barcodes.first.rawValue ?? "Bilinmeyen Kod";

                _cameraController.stop();
                _showSuccessDialog(codeValue);
              }
            },
          ),

          // 2. KATMAN: HEDEFLEME ÇERÇEVESİ
          Center(
            child: Container(
              width: 240,
              height: 240,
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.goldYellow, width: 3.5),
                borderRadius: BorderRadius.circular(24),
              ),
            ),
          ),

          // 3. KATMAN: ÜST BİLGİLENDİRME YAZISI
          Positioned(
            top: 40,
            left: 20,
            right: 20,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 18),
              decoration: BoxDecoration(
                color: Colors.black.withValues(alpha: 0.6),
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Text(
                'Müşterinin QR kodunu veya Dijital Kartını\nbu çerçevenin içine ortalayın',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  height: 1.5,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // QR Kod Başarıyla Taranınca Açılacak Şık Onay Kutusu
  void _showSuccessDialog(String scannedData) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          title: Row(
            children: [
              Icon(
                Icons.check_circle_rounded,
                color: Colors.green.shade600,
                size: 28,
              ),
              const SizedBox(width: 10),
              const Text(
                'İŞLEM BAŞARILI',
                style: TextStyle(
                  color: AppColors.darkNavy,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Müşteri Verisi Doğrulandı:',
                style: TextStyle(
                  color: Colors.grey.shade600,
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.all(12),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.sweetPurple.withValues(alpha: 0.08),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: AppColors.sweetPurple.withValues(alpha: 0.2),
                    width: 1,
                  ),
                ),
                child: Text(
                  scannedData,
                  style: const TextStyle(
                    color: AppColors.darkNavy,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Kumbara puanı veya kampanya ilerlemesi hesaba anında işlendi.',
                style: TextStyle(
                  color: Colors.grey.shade700,
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
              child: const Text(
                'Kapat',
                style: TextStyle(
                  color: AppColors.warmOrange,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
