import 'package:flutter/material.dart';
import '../constants/colors.dart';

class QrScreen extends StatefulWidget {
  const QrScreen({super.key});

  @override
  State<QrScreen> createState() => _QrScreenState();
}

class _QrScreenState extends State<QrScreen> {
  bool _isDigitalCardMode = false; //[cite: 6]

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background, //[cite: 6]
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: 24.0,
            vertical: 20.0,
          ), //[cite: 6]
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start, //[cite: 6]
            crossAxisAlignment: CrossAxisAlignment.stretch, //[cite: 6]
            children: [
              const SizedBox(height: 10), //[cite: 6]
              // ÜST SEKME BUTONLARI
              Container(
                padding: const EdgeInsets.all(4), //[cite: 6]
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.grey.shade300, width: 1),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () => setState(
                          () => _isDigitalCardMode = false,
                        ), //[cite: 6]
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 12,
                          ), //[cite: 6]
                          decoration: BoxDecoration(
                            color: !_isDigitalCardMode
                                ? AppColors.warmOrange
                                : Colors.transparent, //[cite: 6]
                            borderRadius: BorderRadius.circular(12), //[cite: 6]
                          ),
                          child: Text(
                            'Karekod (QR)', //[cite: 6]
                            textAlign: TextAlign.center, //[cite: 6]
                            style: TextStyle(
                              color: !_isDigitalCardMode
                                  ? Colors.white
                                  : AppColors.darkNavy,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () => setState(
                          () => _isDigitalCardMode = true,
                        ), //[cite: 6]
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 12,
                          ), //[cite: 6]
                          decoration: BoxDecoration(
                            color: _isDigitalCardMode
                                ? AppColors.warmOrange
                                : Colors.transparent, //[cite: 6]
                            borderRadius: BorderRadius.circular(12), //[cite: 6]
                          ),
                          child: Text(
                            'Dijital Kart', //[cite: 6]
                            textAlign: TextAlign.center, //[cite: 6]
                            style: TextStyle(
                              color: _isDigitalCardMode
                                  ? Colors.white
                                  : AppColors.darkNavy,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 40), //[cite: 6]
              // DİNAMİK KART ALANI
              SizedBox(
                height: 340, //[cite: 6]
                child: !_isDigitalCardMode
                    ? _buildQrView()
                    : _buildDigitalCardView(), //[cite: 6]
              ),

              const SizedBox(height: 40), //[cite: 6]
              // BİLGİLENDİRME METNİ
              Text(
                !_isDigitalCardMode
                    ? 'Kasadaki görevliye bu karekodu okutarak\nKumbara puanlarınızı anında işleyebilirsiniz.'
                    : 'Karekod okunmadıysa bu kartı göstererek\nveya numarayı söyleyerek işlem yapabilirsiniz.', //[cite: 6]
                textAlign: TextAlign.center, //[cite: 6]
                style: TextStyle(
                  color: Colors.grey.shade600,
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  height: 1.5, //[cite: 6]
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
      width: double.infinity, //[cite: 6]
      height: 340, //[cite: 6]
      padding: const EdgeInsets.all(24), //[cite: 6]
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24), //[cite: 6]
        border: Border.all(
          color: AppColors.warmOrange.withValues(alpha: 0.3),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade100,
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center, //[cite: 6]
        children: [
          const Text(
            'KUMBARA KODUNUZ', //[cite: 6]
            style: TextStyle(
              color: AppColors.warmOrange,
              fontWeight: FontWeight.bold,
              letterSpacing: 2, //[cite: 6]
            ),
          ),
          const SizedBox(height: 20), //[cite: 6]
          Container(
            width: 170, //[cite: 6]
            height: 170, //[cite: 6]
            padding: const EdgeInsets.all(12), //[cite: 6]
            decoration: BoxDecoration(
              color: Colors.white, //[cite: 6]
              borderRadius: BorderRadius.circular(16), //[cite: 6]
              border: Border.all(color: Colors.grey.shade200, width: 1),
            ),
            child: const Icon(
              Icons.qr_code_2_rounded, //[cite: 6]
              size: 146, //[cite: 6]
              color: AppColors.darkNavy,
            ),
          ),
          const SizedBox(height: 20), //[cite: 6]
          const Row(
            mainAxisAlignment: MainAxisAlignment.center, //[cite: 6]
            children: [
              Icon(
                Icons.refresh_rounded,
                color: AppColors.darkNavy,
                size: 16,
              ), //[cite: 6]
              SizedBox(width: 6), //[cite: 6]
              Text(
                '60 saniye içinde yenilenecek', //[cite: 6]
                style: TextStyle(
                  color: AppColors.darkNavy,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
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
      width: double.infinity, //[cite: 6]
      height: 340, //[cite: 6]
      padding: const EdgeInsets.all(24), //[cite: 6]
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [AppColors.darkNavy, AppColors.sweetPurple],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(24), //[cite: 6]
        boxShadow: [
          BoxShadow(
            color: AppColors.darkNavy.withValues(alpha: 0.3),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, //[cite: 6]
        mainAxisAlignment: MainAxisAlignment.spaceBetween, //[cite: 6]
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween, //[cite: 6]
            children: [
              Image.asset(
                'assets/images/KumbaraLogo.png',
                height: 35,
              ), //[cite: 6]
              const Icon(
                Icons.nfc_rounded, //[cite: 6]
                color: AppColors.mintTurquoise,
                size: 26,
              ),
            ],
          ),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start, //[cite: 6]
            children: [
              Text(
                'MÜŞTERI NO', //[cite: 6]
                style: TextStyle(
                  color: Colors.white60,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5, //[cite: 6]
                ),
              ),
              SizedBox(height: 6), //[cite: 6]
              Text(
                'KMB - 7482 - 9105', //[cite: 6]
                style: TextStyle(
                  color: Colors.white, //[cite: 6]
                  fontSize: 22, //[cite: 6]
                  fontWeight: FontWeight.bold, //[cite: 6]
                  letterSpacing: 2, //[cite: 6]
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween, //[cite: 6]
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start, //[cite: 6]
                children: [
                  Text(
                    'KULLANICI', //[cite: 6]
                    style: TextStyle(
                      color: Colors.white60,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ), //[cite: 6]
                  ),
                  SizedBox(height: 4), //[cite: 6]
                  Text(
                    'Mustafa Fildiş', //[cite: 6]
                    style: TextStyle(
                      color: Colors.white, //[cite: 6]
                      fontWeight: FontWeight.bold, //[cite: 6]
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end, //[cite: 6]
                children: [
                  const Text(
                    'DURUM', //[cite: 6]
                    style: TextStyle(
                      color: Colors.white60,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ), //[cite: 6]
                  ),
                  const SizedBox(height: 4), //[cite: 6]
                  Text(
                    'PREMIUM', //[cite: 6]
                    style: const TextStyle(
                      color: AppColors.goldYellow,
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
