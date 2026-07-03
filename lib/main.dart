import 'package:flutter/material.dart';
import 'constants/colors.dart';
import 'screens/login_screen.dart';

void main() {
  runApp(const KumbaraApp());
}

class KumbaraApp extends StatelessWidget {
  const KumbaraApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kumbara',
      theme: ThemeData(scaffoldBackgroundColor: AppColors.background),
      home: const SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // 3 saniye sonra otomatik olarak Giriş Ekranına yönlendirir
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const LoginScreen()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Burada 'const' kelimesini kaldırdık
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0), // Burası sabit kalabilir
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/KumbaraLogo.png', fit: BoxFit.contain),
              const SizedBox(height: 30),
              const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(AppColors.neonBlue),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
