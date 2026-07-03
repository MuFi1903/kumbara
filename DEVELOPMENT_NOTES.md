# 🛠️ Geliştirme Notları (Development Notes)

### Mimari Kararlar

- **Modüler Dosya Yapısı:** Tüm ekranlar (`screens/`) ve veri modelleri (`constants/`) birbirinden ayrı tutularak hata ayıklama kolaylaştırıldı. Tek dosya yaklaşımı reddedildi.
- **State Yönetimi (Simülasyon):** Küresel listeler (`globalCampaigns`, `globalRestaurants`) aracılığıyla lifting state up tekniği simüle edilerek bulut veritabanı öncesi çift taraflı veri akışı doğrulandı.
- **Ekran Koruma Kalkanı:** Uzun metinlerin ekranı patlatmasını engellemek için `Expanded` ve `TextOverflow.ellipsis` zırhları kart tasarımlarına entegre edildi.
