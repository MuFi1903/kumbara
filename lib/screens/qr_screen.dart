import 'package:flutter/material.dart';
import '../constants/colors.dart';

class QrScreen extends StatefulWidget {
  const QrScreen({super.key});

  @override
  State<QrScreen> createState() => _QrScreenState();
}

class _QrScreenState extends State<QrScreen> {
  bool _isDigitalCardMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        // Center yerine Column'ı doğrudan en üste dayıyoruz (MainAxisAlignment.start)
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start, // Üst eksene kilitlendi
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 10), // En üstten güvenli bir boşluk
              // ÜST SEKME BUTONLARI (Artık yeri milimetrik olarak sabit)
              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: AppColors.inputBackground,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () => setState(() => _isDigitalCardMode = false),
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          decoration: BoxDecoration(
                            color: !_isDigitalCardMode
                                ? AppColors.gold
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            'Karekod (QR)',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: !_isDigitalCardMode
                                  ? AppColors.background
                                  : Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () => setState(() => _isDigitalCardMode = true),
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          decoration: BoxDecoration(
                            color: _isDigitalCardMode
                                ? AppColors.gold
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            'Dijital Kart',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: _isDigitalCardMode
                                  ? AppColors.background
                                  : Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(
                height: 40,
              ), // Butonlar ile Kart arasındaki mesafe ASLA değişmeyecek
              // DİNAMİK KART ALANI (İki kartın boyutu ve dış kalıbı %100 eşitlendi)
              SizedBox(
                height: 340, // Sabit dikey kalıp yüksekliği
                child: !_isDigitalCardMode
                    ? _buildQrView()
                    : _buildDigitalCardView(),
              ),

              const SizedBox(
                height: 40,
              ), // Kart ile alt metin arasındaki mesafe ASLA değişmeyecek
              // BİLGİLENDİRME METNİ
              Text(
                !_isDigitalCardMode
                    ? 'Kasadaki görevliye bu karekodu okutarak\nKumbara puanlarınızı anında işleyebilirsiniz.'
                    : 'Karekod okunmadıysa bu kartı göstererek\nveya numarayı söyleyerek işlem yapabilirsiniz.',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 13,
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // 1. KART: QR KOD GÖRÜNÜMÜ
  Widget _buildQrView() {
    return Container(
      width: double.infinity,
      height: 340,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.inputBackground,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppColors.gold.withAlpha(50), width: 1),
        boxShadow: [
          BoxShadow(color: AppColors.gold.withAlpha(15), blurRadius: 20),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'KUMBARA KODUNUZ',
            style: TextStyle(
              color: AppColors.gold,
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
            ),
          ),
          const SizedBox(height: 20),
          Container(
            width: 170,
            height: 170,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Icon(
              Icons.qr_code_2_rounded,
              size: 146,
              color: AppColors.background,
            ),
          ),
          const SizedBox(height: 20),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.refresh_rounded, color: AppColors.neonBlue, size: 16),
              SizedBox(width: 6),
              Text(
                '60 saniye içinde yenilenecek',
                style: TextStyle(
                  color: AppColors.neonBlue,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // 2. KART: DİJİTAL KART GÖRÜNÜMÜ
  Widget _buildDigitalCardView() {
    return Container(
      width: double.infinity,
      height: 340,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xff112240), Color(0xff1a365d)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppColors.neonBlue.withAlpha(50), width: 1),
        boxShadow: [
          BoxShadow(color: AppColors.neonBlue.withAlpha(15), blurRadius: 20),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset('assets/images/KumbaraLogo.png', height: 30),
              const Icon(
                Icons.nfc_rounded,
                color: AppColors.neonBlue,
                size: 24,
              ),
            ],
          ),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'MÜŞTERİ NO',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 10,
                  letterSpacing: 1.5,
                ),
              ),
              SizedBox(height: 6),
              Text(
                'KMB - 7482 - 9105',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'KULLANICI',
                    style: TextStyle(color: Colors.grey, fontSize: 10),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Mustafa Fildiş',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text(
                    'DURUM',
                    style: TextStyle(color: Colors.grey, fontSize: 10),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'PREMIUM',
                    style: const TextStyle(
                      color: AppColors.gold,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
