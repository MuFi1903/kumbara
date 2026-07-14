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
  final TextEditingController _pointsController = TextEditingController();

  String _selectedCategory = 'Kahve';
  bool _isImageSelected = false;

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
        backgroundColor: AppColors.darkNavy,
        elevation: 0,
        title: const Text(
          'Gelişmiş Kampanya Sihirbazı',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
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
              style: TextStyle(
                color: AppColors.darkNavy,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
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
                            ? AppColors.warmOrange
                            : Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: isSelected
                              ? AppColors.warmOrange
                              : Colors.grey.shade300,
                          width: 1,
                        ),
                      ),
                      child: Column(
                        children: [
                          Icon(
                            cat['icon'],
                            color: isSelected
                                ? Colors.white
                                : AppColors.darkNavy,
                            size: 24,
                          ),
                          const SizedBox(height: 6),
                          Text(
                            cat['name'],
                            style: TextStyle(
                              color: isSelected
                                  ? Colors.white
                                  : AppColors.darkNavy,
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

            // ÜRÜN / MENÜ GÖRSELİ EKLEME ALANI
            const Text(
              'Ürün / Menü Fotoğrafı',
              style: TextStyle(
                color: AppColors.darkNavy,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            GestureDetector(
              onTap: () {
                setState(() {
                  _isImageSelected = true;
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
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: _isImageSelected
                        ? AppColors.warmOrange
                        : Colors.grey.shade300,
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
                          ? AppColors.warmOrange
                          : AppColors.mintTurquoise,
                      size: 36,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      _isImageSelected
                          ? 'Görsel Başarıyla Eklendi (urun_menu.jpg)'
                          : 'Kampanyalı Ürün Görseli Seç',
                      style: TextStyle(
                        color: _isImageSelected
                            ? AppColors.darkNavy
                            : Colors.grey.shade600,
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
              style: TextStyle(
                color: AppColors.darkNavy,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _titleController,
              style: const TextStyle(
                color: AppColors.darkNavy,
                fontWeight: FontWeight.bold,
              ),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'Örn: Filtre Kahve Yanına Mozaik Pasta!',
                hintStyle: TextStyle(color: Colors.grey.shade500, fontSize: 14),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(
                    color: AppColors.warmOrange,
                    width: 2,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(
                    color: Colors.grey.shade300,
                    width: 1.5,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),

            // KAZANDIRILACAK PUAN / TL DEĞERİ INPUTU
            const Text(
              'Müşteriye Tanımlanacak Puan Değeri (TL)',
              style: TextStyle(
                color: AppColors.darkNavy,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _pointsController,
              keyboardType: TextInputType.number,
              style: const TextStyle(
                color: AppColors.goldYellow,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'Örn: 20',
                hintStyle: TextStyle(
                  color: Colors.grey.shade500,
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ),
                prefixIcon: const Icon(
                  Icons.stars_rounded,
                  color: AppColors.goldYellow,
                ),
                suffixText: 'TL Puan',
                suffixStyle: TextStyle(
                  color: Colors.grey.shade600,
                  fontWeight: FontWeight.bold,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(
                    color: AppColors.warmOrange,
                    width: 2,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(
                    color: Colors.grey.shade300,
                    width: 1.5,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),

            // KAMPANYA KOŞULLARI
            const Text(
              'Kampanya Koşulları / Açıklaması',
              style: TextStyle(
                color: AppColors.darkNavy,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _descController,
              maxLines: 2,
              style: const TextStyle(
                color: AppColors.darkNavy,
                fontWeight: FontWeight.bold,
              ),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText:
                    'Örn: Bu kampanya sadece Ahenk Kahve Şahinbey şubesinde geçerlidir.',
                hintStyle: TextStyle(color: Colors.grey.shade500, fontSize: 14),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(
                    color: AppColors.warmOrange,
                    width: 2,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(
                    color: Colors.grey.shade300,
                    width: 1.5,
                  ),
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
                    points: '+${_pointsController.text} TL Puan',
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
                backgroundColor: AppColors.hotPink,
                foregroundColor: Colors.white,
                elevation: 3,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: const Center(
                child: Text(
                  'Kampanyayı Oluştur ve Yayına Al',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
