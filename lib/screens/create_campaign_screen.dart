import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../constants/campaign_data.dart';

class CreateCampaignScreen extends StatefulWidget {
  const CreateCampaignScreen({super.key});

  @override
  State<CreateCampaignScreen> createState() => _CreateCampaignScreenState();
}

class _CreateCampaignScreenState extends State<CreateCampaignScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descController = TextEditingController();
  final TextEditingController _pointsController =
      TextEditingController(); // Puan kontrolcüsü

  String _selectedCategory = 'Kahve';
  bool _isImageSelected = false; // Görsel seçildi mi kontrolü

  final List<Map<String, dynamic>> _categories = [
    {'name': 'Kahve', 'icon': Icons.coffee_rounded},
    {'name': 'Yemek', 'icon': Icons.restaurant_rounded},
    {'name': 'Tatlı', 'icon': Icons.cake_rounded},
    {'name': 'İçecek', 'icon': Icons.local_bar_rounded},
  ];

  @override
  void dispose() {
    _titleController.dispose();
    _descController.dispose();
    _pointsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.inputBackground,
        title: const Text(
          'Gelişmiş Kampanya Sihirbazı',
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
        leading: IconButton(
          icon: const Icon(Icons.close_rounded, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Kampanya Kategorisi',
              style: TextStyle(color: Colors.grey, fontSize: 14),
            ),
            const SizedBox(height: 12),

            // KATEGORİ SEÇİMİ
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: _categories.map((cat) {
                bool isSelected = _selectedCategory == cat['name'];
                return Expanded(
                  child: GestureDetector(
                    onTap: () =>
                        setState(() => _selectedCategory = cat['name']),
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? AppColors.gold
                            : AppColors.inputBackground,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        children: [
                          Icon(
                            cat['icon'],
                            color: isSelected
                                ? AppColors.background
                                : AppColors.neonBlue,
                            size: 22,
                          ),
                          const SizedBox(height: 6),
                          Text(
                            cat['name'],
                            style: TextStyle(
                              color: isSelected
                                  ? AppColors.background
                                  : Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 24),

            // YENİ: ÜRÜN / MENÜ GÖRSELİ EKLEME ALANI (PREMIUM METALLIC LOOK)
            const Text(
              'Ürün / Menü Fotoğrafı',
              style: TextStyle(color: Colors.grey, fontSize: 14),
            ),
            const SizedBox(height: 8),
            GestureDetector(
              onTap: () {
                setState(() {
                  _isImageSelected = true; // Simüle olarak görsel seçildi
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      'Galeri Açıldı: Ürün/Menü fotoğrafı başarıyla yüklendi!',
                    ),
                  ),
                );
              },
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 24),
                decoration: BoxDecoration(
                  color: AppColors.inputBackground,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: _isImageSelected
                        ? AppColors.gold
                        : Colors.white.withAlpha(15),
                    width: 1.5,
                  ),
                ),
                child: Column(
                  children: [
                    Icon(
                      _isImageSelected
                          ? Icons.check_circle_rounded
                          : Icons.add_photo_alternate_rounded,
                      color: _isImageSelected
                          ? AppColors.gold
                          : AppColors.neonBlue,
                      size: 36,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      _isImageSelected
                          ? 'Görsel Başarıyla Eklendi (urun_menu.jpg)'
                          : 'Kampanyalı Ürün Görseli Seç',
                      style: TextStyle(
                        color: _isImageSelected ? Colors.white : Colors.grey,
                        fontSize: 13,
                        fontWeight: _isImageSelected
                            ? FontWeight.bold
                            : FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),

            // KAMPANYA BAŞLIĞI
            const Text(
              'Kampanya Başlığı',
              style: TextStyle(color: Colors.grey, fontSize: 14),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _titleController,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                filled: true,
                fillColor: AppColors.inputBackground,
                hintText: 'Örn: Filtre Kahve Yanına Mozaik Pasta!',
                hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 24),

            // YENİ: KAZANDIRILACAK PUAN / TL DEĞERİ INPUTU
            const Text(
              'Müşteriye Tanımlanacak Puan Değeri (TL)',
              style: TextStyle(color: Colors.grey, fontSize: 14),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _pointsController,
              keyboardType:
                  TextInputType.number, // Sadece rakam klavyesi açılsın
              style: const TextStyle(
                color: AppColors.gold,
                fontWeight: FontWeight.bold,
              ),
              decoration: InputDecoration(
                filled: true,
                fillColor: AppColors.inputBackground,
                hintText: 'Örn: 20',
                hintStyle: const TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ),
                prefixIcon: const Icon(
                  Icons.stars_rounded,
                  color: AppColors.gold,
                ),
                suffixText: 'TL Puan',
                suffixStyle: const TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 24),

            // KAMPANYA KOŞULLARI
            const Text(
              'Kampanya Koşulları / Açıklaması',
              style: TextStyle(color: Colors.grey, fontSize: 14),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _descController,
              maxLines: 2,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                filled: true,
                fillColor: AppColors.inputBackground,
                hintText:
                    'Örn: Bu kampanya sadece Ahenk Kahve Şahinbey şubesinde geçerlidir.',
                hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 32),

            // KAYDET BUTONU
            ElevatedButton(
              onPressed: () {
                if (_titleController.text.isEmpty ||
                    _pointsController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        'Lütfen Başlık ve Puan alanlarını doldurun!',
                      ),
                    ),
                  );
                  return;
                }

                // Havuza yeni genişletilmiş veriyi ekliyoruz
                globalCampaigns.add(
                  Campaign(
                    restaurantName: 'Ahenk Kahve Dünyası',
                    campaignType: 'YENİ KAMPANYA',
                    campaignTitle: _titleController.text,
                    progressText: _descController.text.isEmpty
                        ? 'Tüm üyelere özel'
                        : _descController.text,
                    progressValue: 0.0,
                    icon: _selectedCategory == 'Kahve'
                        ? Icons.coffee_rounded
                        : _selectedCategory == 'Yemek'
                        ? Icons.restaurant_rounded
                        : _selectedCategory == 'Tatlı'
                        ? Icons.cake_rounded
                        : Icons.local_bar_rounded,
                    points:
                        '+${_pointsController.text} TL Puan', // Puan metnini birleştirdik
                  ),
                );

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      '"${_titleController.text}" puanıyla birlikte yayına alındı!',
                    ),
                  ),
                );
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.neonBlue,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Center(
                child: Text(
                  'Kampanyayı Oluştur ve Yayına Al',
                  style: TextStyle(
                    color: AppColors.background,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
