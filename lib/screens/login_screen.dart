import 'package:flutter/material.dart';
import '../constants/colors.dart';
import 'home_screen.dart';
import 'restaurant_screen.dart'; // Yeni restoran ekranını ekledik

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Yazılan metni okumamızı sağlayan kontrolcü
  final TextEditingController _usernameController = TextEditingController();

  @override
  void dispose() {
    _usernameController
        .dispose(); // Hafıza sızıntısını önlemek için kapatıyoruz
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 40),
              Image.asset('assets/images/KumbaraLogo.png', height: 120),
              const SizedBox(height: 40),
              const Text(
                'Kumbara Giriş Paneli',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Test için "restoran" veya "musteri" yazabilirsiniz.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.neonBlue,
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 40),

              // KULLANICI ADI GİRİŞ ALANI
              TextField(
                controller: _usernameController, // Kontrolcüyü bağladık
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: AppColors.inputBackground,
                  hintText: 'Kullanıcı Adınız (restoran / musteri)',
                  hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
                  prefixIcon: const Icon(
                    Icons.person_outline_rounded,
                    color: AppColors.neonBlue,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // FORMALİTE ŞİFRE ALANI (Boş kalabilir)
              TextField(
                obscureText: true,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: AppColors.inputBackground,
                  hintText: 'Şifre (Şimdilik boş bırakın)',
                  hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
                  prefixIcon: const Icon(
                    Icons.lock_outline,
                    color: AppColors.neonBlue,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // GİRİŞ YAP BUTONU (Dinamik Köprü Mantığı)
              ElevatedButton(
                onPressed: () {
                  // Metin kutusundaki yazıyı alıp küçük harfe çeviriyoruz ve boşlukları siliyoruz
                  String input = _usernameController.text.trim().toLowerCase();

                  if (input == 'restoran') {
                    // "restoran" yazdıysa Restoran Paneline gider
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RestaurantScreen(),
                      ),
                    );
                  } else {
                    // "musteri" yazdıysa veya boş bıraktıysa varsayılan Müşteri Dashboard'una gider
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeScreen(),
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.gold,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Giriş Yap',
                  style: TextStyle(
                    color: AppColors.background,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
