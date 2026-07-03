# 📝 Yapılacaklar Listesi (To-Do)

- [ ] **Faz 1:** Saha testleri yapılıp Gaziantep esnafından geri bildirim toplanacak.
- [ ] **Faz 2:** Firebase veya PostgreSQL entegrasyonu ile canlı veritabanına geçilecek.
- [ ] **Faz 3:** Kampanya sihirbazına gerçek puan tanımlama fonksiyonu ve Cloud Storage görsel yükleme modülü eklenecek.
- [ ] **Faz 4:** Cari alt yapı ve muhasebe (fatura/mahsuplaşma) raporlama ekranları tasarlanacak.
- [ ] **Faz 5:** Google Play ve App Store için kurumsal mağaza kimliği hazırlanacak.

🗺️ Kumbara Projesi Ticari Yol Haritası
📍 Faz 1: Saha Testleri & Geri Bildirim Toplama (Şu Anki Aşama)
Kendi Testlerin: Uygulamayı hem müşteri hem esnaf tarafında kurcala. "Buradaki butonun yeri rahat mı?", "Metinler Gaziantep esnafının diline uygun mu?" gibi detayları not et.

İlk Esnaf Testi: Gaziantep'te güvendiğin, tanıdık bir kafe veya restorana gidip bu simülasyonu telefonunda göster. "Abi dükkanına böyle bir şey kursak, yeni menü kanununa da uyumlu, kullanır mısın?" diyerek nabız ölç. Onların vereceği tepkiler altın değerindedir.

🛡️ Faz 2: Altyapıyı Canlandırmak (Backend & Veritabanı Entegrasyonu)
Şu an uygulamanın hafızasında tuttuğumuz verileri buluta taşıyacağız.

Firebase veya PostgreSQL Bağlantısı: Kullanıcı kayıtları, esnaf bilgileri ve kampanyaların silinmeyecek şekilde bulut veritabanına kaydedilmesi.

Gerçek Puan Ekonomisi: Müşteri QR kodu restorana okuttuğunda, arka planda o dükkandaki puanının gerçekten artması, harcayınca düşmesi mantığının kodlanması.

Güvenlik Katmanı: Puan ekleme/silme işlemlerinin suistimal edilmemesi için şifrelenmiş (encrypted) güvenli token yapılarının kurulması.

📸 Faz 3: Medya & Görsel Yönetimi (Fotoğraf Yükleme)
Cloud Storage Entegrasyonu: Esnafın kampanya sihirbazından veya profilinden "Görsel Seç" butonuna bastığında gerçekten telefonun galerisinin açılması, seçilen fotoğrafın buluta yüklenip hem müşteri hem işletme ekranında canlı sergilenmesi.

⚖️ Faz 4: Yasal Mevzuat ve Muhasebe Entegrasyonu (Cari & Fatura)
KVKK Uyumluluğu: Müşteri kayıt olurken yasal onay metinlerinin eklenmesi.

Cari Alt Yapı: Esnafın hangi müşteriye ne kadar puan verdiğini, ay sonunda bu puanların nasıl mahsuplaşılacağını (Ahenk'in ERP tecrübesiyle) finansal bir rapora dökebilmesi.

🚀 Faz 5: Google Play & App Store Yayını (Lansman)
Uygulamanın mağaza görsellerinin (3D lüks kurumsal temalı) hazırlanması.

Gaziantep merkezli lokal bir dijital pazarlama kampanyası (Instagram Reels ve esnaf broşürleri) ile ilk 1000 üyeye ulaşma hedefi.
