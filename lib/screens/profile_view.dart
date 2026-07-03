import 'package:flutter/material.dart';
import '../constants/colors.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  bool _isAvatarSelected = false; // Avatar değişti mi kontrolü

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // 1. KULLANICI KARTVİZİTİ (TAŞMA HATASI GİDERİLDİ)
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [AppColors.inputBackground, Color(0xff172a45)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: AppColors.gold.withAlpha(50)),
            ),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _isAvatarSelected = true;
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'Galeri Açıldı: Profil fotoğrafınız başarıyla güncellendi!',
                        ),
                      ),
                    );
                  },
                  child: Stack(
                    children: [
                      CircleAvatar(
                        backgroundColor: AppColors.gold,
                        radius: 32,
                        child: Icon(
                          _isAvatarSelected
                              ? Icons.face_rounded
                              : Icons.person_rounded,
                          color: AppColors.background,
                          size: 36,
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: const BoxDecoration(
                            color: AppColors.neonBlue,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.camera_alt_rounded,
                            color: AppColors.background,
                            size: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                // Expanded ekleyerek uzun yazıların ekrandan taşmasını engelledik
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Mustafa Fildiş',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        _isAvatarSelected
                            ? 'Profil Resmi: mustafa_avatar.png'
                            : 'Premium Kumbara Üyesi',
                        style: const TextStyle(
                          color: AppColors.neonBlue,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // 2. FİNANSAL ÖZET KARTLARI (YAN YANA)
          Row(
            children: [
              _buildMetricCard(
                'Toplam Kazanç',
                '450 TL',
                Icons.account_balance_wallet_rounded,
              ),
              const SizedBox(width: 16),
              _buildMetricCard(
                'Harcanan Puan',
                '264 TL',
                Icons.shopping_bag_rounded,
              ),
            ],
          ),
          const SizedBox(height: 30),

          // 3. MENÜ SEÇENEKLERİ LİSTESİ
          const Text(
            'HESAP AYARLARI',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 12,
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
            ),
          ),
          const SizedBox(height: 10),
          _buildMenuTile('Dijital Kumbara Kartım', Icons.credit_card_rounded),
          _buildMenuTile('Geçmiş İşlemlerim', Icons.history_toggle_off_rounded),
          _buildMenuTile('Kayıtlı Ödeme Yöntemleri', Icons.payment_rounded),
          _buildMenuTile('Güvenlik ve Şifre', Icons.shield_rounded),

          const SizedBox(height: 24),
          const Text(
            'DESTEK & SÖZLEŞMELER',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 12,
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
            ),
          ),
          const SizedBox(height: 10),
          _buildMenuTile('Yardım Merkezi / SSS', Icons.help_outline_rounded),
          _buildMenuTile('Kullanım Koşulları', Icons.description_outlined),

          const SizedBox(height: 40),

          // 4. ÇIKIŞ YAP BUTONU
          OutlinedButton.icon(
            onPressed: () {
              Navigator.of(context).popUntil((route) => route.isFirst);
            },
            icon: const Icon(
              Icons.logout_rounded,
              color: Colors.redAccent,
              size: 18,
            ),
            label: const Text(
              'Hesaptan Çıkış Yap',
              style: TextStyle(
                color: Colors.redAccent,
                fontWeight: FontWeight.bold,
              ),
            ),
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 14),
              side: const BorderSide(color: Colors.redAccent, width: 1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          const SizedBox(height: 30),

          const Text(
            'Kumbara v1.0.0 Stable\nPowered by Ahenk Bilgisayar Yazılım',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white24, fontSize: 11, height: 1.5),
          ),
        ],
      ),
    );
  }

  Widget _buildMetricCard(String title, String value, IconData icon) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.inputBackground,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: AppColors.gold, size: 20),
            const SizedBox(height: 12),
            Text(
              value,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              title,
              style: const TextStyle(color: Colors.grey, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuTile(String title, IconData icon) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: AppColors.inputBackground,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: Icon(icon, color: AppColors.neonBlue, size: 20),
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios_rounded,
          color: Colors.white24,
          size: 12,
        ),
        onTap: () {},
      ),
    );
  }
}
