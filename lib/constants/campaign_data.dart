import 'package:flutter/material.dart';

class Campaign {
  final String restaurantName;
  final String campaignType;
  final String campaignTitle;
  final String progressText;
  final double progressValue;
  final IconData icon;
  final String points; // YENİ: Kampanyanın puan/TL değeri

  Campaign({
    required this.restaurantName,
    required this.campaignType,
    required this.campaignTitle,
    required this.progressText,
    required this.progressValue,
    required this.icon,
    required this.points, // Yeni alan zorunlu hale geldi
  });
}

// ORTAK HAFIZA - BAŞLANGIÇ VERİLERİ (Puanlar eklendi)
List<Campaign> globalCampaigns = [
  Campaign(
    restaurantName: 'Ahenk Kahve Dünyası',
    campaignType: 'SADAKAT KARTLI',
    campaignTitle: '3 Kahve Alana 4. Kahve Yarı Fiyatına!',
    progressText: '2 / 3 Slot Dolu',
    progressValue: 0.66,
    icon: Icons.coffee_rounded,
    points: '+15 TL Puan',
  ),
  Campaign(
    restaurantName: 'Lezzet Sarayı Restoran',
    campaignType: 'KUMBARA ÖZEL',
    campaignTitle: 'Şefin Özel Menüsünde Anında 40 TL İndirim!',
    progressText: 'Sadece Uygulama İçi Ödemede',
    progressValue: 1.0,
    icon: Icons.restaurant_rounded,
    points: '40 TL İndirim',
  ),
];
