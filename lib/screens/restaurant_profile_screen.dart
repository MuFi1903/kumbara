import 'package:flutter/material.dart';
import '../constants/colors.dart';

class RestaurantProfileScreen extends StatefulWidget {
  const RestaurantProfileScreen({super.key});

  @override
  State<RestaurantProfileScreen> createState() =>
      _RestaurantProfileScreenState();
}

class _RestaurantProfileScreenState extends State<RestaurantProfileScreen> {
  bool _isLogoSelected = false; // Logo değiştirme simülasyonu için

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.inputBackground,
        title: const Text(
          'İşletme Kimliği & Profil',
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // 1. KURUMSAL LOGO / AVATAR GÜNCELLEME ALANI
            Center(
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 54,
                    backgroundColor: AppColors.gold.withAlpha(50),
                    child: CircleAvatar(
                      radius: 50,
                      backgroundColor: AppColors.inputBackground,
                      child: Icon(
                        _isLogoSelected
                            ? Icons.business_center_rounded
                            : Icons.storefront_rounded,
                        size: 44,
                        color: _isLogoSelected
                            ? AppColors.gold
                            : AppColors.neonBlue,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _isLogoSelected = true;
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              'Galeri Açıldı: Kurumsal dükkan logosu başarıyla güncellendi!',
                            ),
                          ),
                        );
                      },
                      child: const CircleAvatar(
                        radius: 18,
                        backgroundColor: AppColors.gold,
                        child: Icon(
                          Icons.camera_alt_rounded,
                          color: AppColors.background,
                          size: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Text(
              _isLogoSelected
                  ? 'AhenkLogo_v2.png aktif'
                  : 'Kurumsal Logo Değiştir',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: _isLogoSelected ? Colors.green : Colors.grey,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 32),

            // 2. TEMEL İŞLETME BİLGİLERİ
            const Text(
              'İŞLETME DETAYLARI',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 12,
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
              ),
            ),
            const SizedBox(height: 10),
            _buildInfoCard(
              'Firma Adı',
              'Ahenk Kahve Dünyası',
              Icons.business_rounded,
            ),
            _buildInfoCard(
              'Resmi Yetkili',
              'Mustafa Fildiş',
              Icons.badge_rounded,
            ),
            _buildInfoCard(
              'Sektör / Kategori',
              'Üçüncü Nesil Nitelikli Kahve Kavurma & Cafe',
              Icons.category_rounded,
            ),

            const SizedBox(height: 24),

            // 3. İLETİŞİM & WHATSAPP HATLARI
            const Text(
              'DIREKT İLETİŞİM KANALLARI',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 12,
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
              ),
            ),
            const SizedBox(height: 10),
            _buildCommunicationTile(
              title: 'WhatsApp Direkt Destek Hattı',
              subtitle: '+90 5XX XXX XX XX',
              icon: Icons.chat_rounded,
              color: Colors.green,
              actionLabel: 'Test Et',
            ),
            _buildCommunicationTile(
              title: 'Sabit Kurumsal Telefon',
              subtitle: '0342 XXX XX XX',
              icon: Icons.phone_in_talk_rounded,
              color: AppColors.neonBlue,
              actionLabel: 'Ara',
            ),

            const SizedBox(height: 24),

            // 4. SOSYAL MEDYA AĞLARI
            const Text(
              'SOSYAL MEDYA VİTRİNİ',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 12,
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
              ),
            ),
            const SizedBox(height: 10),
            _buildCommunicationTile(
              title: 'Instagram Resmi Sayfası',
              subtitle: '@ahenk_kahvedunyasii',
              icon: Icons.camera_rounded,
              color: Colors.pinkAccent,
              actionLabel: 'Bağlan',
            ),

            const SizedBox(height: 24),

            // 5. ADRES VE KONUM BİLGİLERİ
            const Text(
              'LOKASYON BİLGİLERİ',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 12,
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
              ),
            ),
            const SizedBox(height: 10),
            _buildInfoCard(
              'Açık Adres',
              'Şahinbey İlçesi, Mernis Kayıtlı Resmi Adres Bilgisi, Gaziantep',
              Icons.location_on_rounded,
            ),

            const SizedBox(height: 40),
            const Text(
              'İşletme Bilgi Sistemi v1.0\nPowered by Ahenk Bilgisayar Yazılım ve Güvenlik',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white24,
                fontSize: 11,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // Bilgi Gösterim Kartı
  Widget _buildInfoCard(String label, String value, IconData icon) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.inputBackground,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          Icon(icon, color: AppColors.gold, size: 20),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(color: Colors.grey, fontSize: 11),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // İletişim ve Sosyal Medya Satırı
  Widget _buildCommunicationTile({
    required String title,
    required String subtitle,
    required IconData icon,
    required Color color,
    required String actionLabel,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: AppColors.inputBackground,
        borderRadius: BorderRadius.circular(14),
      ),
      child: ListTile(
        leading: Icon(icon, color: color, size: 22),
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: const TextStyle(color: Colors.grey, fontSize: 12),
        ),
        trailing: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          decoration: BoxDecoration(
            color: color.withAlpha(30),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            actionLabel,
            style: TextStyle(
              color: color,
              fontSize: 11,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Simülasyon: $title yönlendirmesi başarıyla tetiklendi!',
              ),
            ),
          );
        },
      ),
    );
  }
}
