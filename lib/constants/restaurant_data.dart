import 'package:flutter/material.dart';

class MenuItem {
  final String name;
  final String price;
  final String calories;
  final String ingredients; // İçerik Bilgisi (Yasal Zorunluluk)
  final String allergens; // Alerjen Bilgisi (Yasal Zorunluluk)

  MenuItem({
    required this.name,
    required this.price,
    required this.calories,
    required this.ingredients,
    required this.allergens,
  });
}

class Restaurant {
  final String name;
  final String district;
  final String distance;
  final double rating;
  final IconData icon;
  final List<MenuItem> menu;

  Restaurant({
    required this.name,
    required this.district,
    required this.distance,
    required this.rating,
    required this.icon,
    required this.menu,
  });
}

// GAZİANTEP ÜYE MEKANLAR LİSTESİ
List<Restaurant> globalRestaurants = [
  Restaurant(
    name: 'Ahenk Kahve Dünyası',
    district: 'Şahinbey',
    distance: '850m',
    rating: 4.8,
    icon: Icons.coffee_rounded,
    menu: [
      MenuItem(
        name: 'Caffe Latte',
        price: '85 TL',
        calories: '140 kcal',
        ingredients: 'Espresso shot, pastorize tam yağlı süt, süt köpüğü.',
        allergens: 'Laktoz içerir.',
      ),
      MenuItem(
        name: 'Çikolatalı Brownie',
        price: '110 TL',
        calories: '380 kcal',
        ingredients:
            '%70 kakao belçika çikolatası, un, tereyağı, yumurta, şeker.',
        allergens: 'Gluten, yumurta ve eser miktarda kuruyemiş içerir.',
      ),
    ],
  ),
  Restaurant(
    name: 'Lezzet Sarayı Restoran',
    district: 'Şehitkamil',
    distance: '1.4 km',
    rating: 4.9,
    icon: Icons.restaurant_rounded,
    menu: [
      MenuItem(
        name: 'Ali Nazik Kebabı',
        price: '320 TL',
        calories: '520 kcal',
        ingredients:
            'Zırh kıyması, süzme yoğurt, közlenmiş patlıcan, sarımsak, tereyağı.',
        allergens: 'Süt ürünü (yoğurt) içerir.',
      ),
    ],
  ),
];
