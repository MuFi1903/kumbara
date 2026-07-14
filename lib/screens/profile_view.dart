import 'package:flutter/material.dart';
import '../constants/colors.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  bool _isAvatarSelected = false; // Avatar değişti mi kontrolü[cite: 5]

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // 1. KULLANICI KARTVİZİTİ
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [AppColors.darkNavy, AppColors.sweetPurple],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: AppColors.darkNavy.withValues(alpha: 0.2),
                  blurRadius: 15,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _isAvatarSelected = true; //[cite: 5]
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'Galeri Açıldı: Profil fotoğrafınız başarıyla güncellendi!', //[cite: 5]
                        ),
                      ),
                    );
                  },
                  child: Stack(
                    children: [
                      CircleAvatar(
                        backgroundColor: AppColors.goldYellow,
                        radius: 32,
                        child: Icon(
                          _isAvatarSelected
                              ? Icons.face_rounded
                              : Icons.person_rounded, //[cite: 5]
                          color: Colors.white,
                          size: 36,
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: const BoxDecoration(
                            color: AppColors.mintTurquoise,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.camera_alt_rounded,
                            color: Colors.white,
                            size: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Mustafa Fildiş', //[cite: 5]
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
                            : 'Premium Kumbara Üyesi', //[cite: 5]
                        style: const TextStyle(
                          color: AppColors.mintTurquoise,
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
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
                'Toplam Kazanç', //[cite: 5]
                '450 TL', //[cite: 5]
                Icons.account_balance_wallet_rounded, //[cite: 5]
              ),
              const SizedBox(width: 16),
              _buildMetricCard(
                'Harcanan Puan', //[cite: 5]
                '264 TL', //[cite: 5]
                Icons.shopping_bag_rounded, //[cite: 5]
              ),
            ],
          ),
          const SizedBox(height: 30),

          // 3. MENÜ SEÇENEKLERİ LİSTESİ
          const Text(
            'HESAP AYARLARI', //[cite: 5]
            style: TextStyle(
              color: AppColors.darkNavy,
              fontSize: 13,
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
            ),
          ),
          const SizedBox(height: 10),
          _buildMenuTile(
            'Dijital Kumbara Kartım',
            Icons.credit_card_rounded,
          ), //[cite: 5]
          _buildMenuTile(
            'Geçmiş İşlemlerim',
            Icons.history_toggle_off_rounded,
          ), //[cite: 5]
          _buildMenuTile(
            'Kayıtlı Ödeme Yöntemleri',
            Icons.payment_rounded,
          ), //[cite: 5]
          _buildMenuTile('Güvenlik ve Şifre', Icons.shield_rounded), //[cite: 5]

          const SizedBox(height: 24),
          const Text(
            'DESTEK & SÖZLEŞMELER', //[cite: 5]
            style: TextStyle(
              color: AppColors.darkNavy,
              fontSize: 13,
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
            ),
          ),
          const SizedBox(height: 10),
          _buildMenuTile(
            'Yardım Merkezi / SSS',
            Icons.help_outline_rounded,
          ), //[cite: 5]
          _buildMenuTile(
            'Kullanım Koşulları',
            Icons.description_outlined,
          ), //[cite: 5]

          const SizedBox(height: 40),

          // 4. ÇIKIŞ YAP BUTONU
          OutlinedButton.icon(
            onPressed: () {
              Navigator.of(
                context,
              ).popUntil((route) => route.isFirst); //[cite: 5]
            },
            icon: const Icon(
              Icons.logout_rounded,
              color: Colors.redAccent,
              size: 18,
            ),
            label: const Text(
              'Hesaptan Çıkış Yap', //[cite: 5]
              style: TextStyle(
                color: Colors.redAccent,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 14),
              side: const BorderSide(color: Colors.redAccent, width: 1.5),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
          const SizedBox(height: 30),

          const Text(
            'Kumbara v1.0.0 Stable\nPowered by Ahenk Bilgisayar Yazılım', //[cite: 5]
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 12,
              height: 1.5,
              fontWeight: FontWeight.w500,
            ),
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
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.grey.shade200, width: 1.5),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade100,
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: AppColors.warmOrange, size: 24),
            const SizedBox(height: 12),
            Text(
              value,
              style: const TextStyle(
                color: AppColors.darkNavy,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              title,
              style: TextStyle(
                color: Colors.grey.shade600,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200, width: 1.5),
      ),
      child: ListTile(
        leading: Icon(icon, color: AppColors.warmOrange, size: 22),
        title: Text(
          title,
          style: const TextStyle(
            color: AppColors.darkNavy,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios_rounded,
          color: Colors.grey.shade400,
          size: 12,
        ),
        onTap: () {},
      ),
    );
  }
}
