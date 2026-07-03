import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import '../constants/colors.dart';

class ScannerScreen extends StatefulWidget {
  const ScannerScreen({super.key});

  @override
  State<ScannerScreen> createState() => _ScannerScreenState();
}

class _ScannerScreenState extends State<ScannerScreen> {
  // Kamerayı kontrol etmek ve işimiz bitince kapatmak için kontrolcü
  final MobileScannerController _cameraController = MobileScannerController();
  bool _isScanCompleted =
      false; // Üst üste birden fazla taramayı engellemek için

  @override
  void dispose() {
    _cameraController
        .dispose(); // Ekrandan çıkınca kamerayı kapat, pili yemesin
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Kamera arkası karanlık olsun
      appBar: AppBar(
        backgroundColor: AppColors.inputBackground,
        title: const Text(
          'Müşteri Kodu Tara',
          style: TextStyle(color: Colors.white, fontSize: 16),
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
                  _isScanCompleted = true; // İlk kodu yakaladık, kilitle
                });

                // Taranan QR kodun içindeki yazıyı alıyoruz
                final String codeValue =
                    barcodes.first.rawValue ?? "Bilinmeyen Kod";

                // Kamerayı durdur ve başarı diyaloğunu göster
                _cameraController.stop();
                _showSuccessDialog(codeValue);
              }
            },
          ),

          // 2. KATMAN: HEDEFLEME ÇERÇEVESİ (UI Görsel Efekt)
          Center(
            child: Container(
              width: 240,
              height: 240,
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.gold, width: 3),
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
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.black.withAlpha(150),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Text(
                'Müşterinin QR kodunu veya Dijital Kartını\nbu çerçevenin içine ortalayın',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 13,
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
      barrierDismissible: false, // Dışarı tıklayınca kapanmasın
      builder: (context) {
        return AlertDialog(
          backgroundColor: AppColors.inputBackground,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: const Row(
            children: [
              Icon(Icons.check_circle_rounded, color: Colors.green, size: 28),
              SizedBox(width: 10),
              Text(
                'İŞLEM BAŞARILI',
                style: TextStyle(
                  color: Colors.white,
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
              const Text(
                'Müşteri Verisi Doğrulandı:',
                style: TextStyle(color: Colors.grey, fontSize: 13),
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.all(10),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.background,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  scannedData,
                  style: const TextStyle(
                    color: AppColors.neonBlue,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Kumbara puanı veya kampanya ilerlemesi hesaba anında işlendi.',
                style: TextStyle(color: Colors.white, fontSize: 13),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Diyaloğu kapat
                Navigator.pop(
                  context,
                ); // Kamera ekranından esnaf paneline geri dön
              },
              child: const Text(
                'Kapat',
                style: TextStyle(
                  color: AppColors.gold,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
