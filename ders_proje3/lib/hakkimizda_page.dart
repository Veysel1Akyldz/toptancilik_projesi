import 'package:flutter/material.dart';
import 'home_page.dart';

class HakkimizdaPage extends StatelessWidget {
  const HakkimizdaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Hakkımızda",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
        foregroundColor: Colors.white, // Geri tuşunu ve yazıyı beyaz yapar
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/akyildizToptan.png'),
                ),
              ),
              height: 300,
            ),
            const SizedBox(height: 20),

            // acıklama
            const Text(
              "Akyıldız Toptancılık",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "Yılların tecrübesiyle, en kaliteli ürünleri en uygun fiyatlarla esnafımızla ve müşterilerimizle buluşturuyoruz. Gıda, temizlik ve ambalaj sektöründeki geniş ürün yelpazemizle işletmenizin tüm ihtiyaçlarını tek bir çatı altından karşılıyoruz.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
                height: 1.5,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 30),
            const Divider(thickness: 1.5),
            const SizedBox(height: 10),

            // neden biz
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Neden Bizi Seçmelisiniz?",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 15),
            _ozellikSatiri(
              Icons.verified,
              "Yüksek Kalite",
              "Sadece güvenilir markalarla çalışıyoruz.",
            ),
            _ozellikSatiri(
              Icons.local_shipping,
              "Hızlı Teslimat",
              "Siparişlerinizi aynı gün kapınıza getiriyoruz.",
            ),
            _ozellikSatiri(
              Icons.price_check,
              "Uygun Fiyat",
              "Toptan alımlarda en rekabetçi fiyatları sunuyoruz.",
            ),

            const SizedBox(height: 20),
            const Divider(thickness: 1.5),
            const SizedBox(height: 10),

            // iletisim
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "İletişim",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 15),
            const Card(
              elevation: 2,
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.location_on, color: Colors.red),
                    title: Text("Merkez Depo"),
                    subtitle: Text("Toptancılar Sitesi, G Blok No:21"),
                  ),
                  ListTile(
                    leading: Icon(Icons.phone, color: Colors.green),
                    title: Text("Müşteri Hizmetleri"),
                    subtitle: Text("+90 553 300 30 21"),
                  ),
                  ListTile(
                    leading: Icon(Icons.email, color: Colors.blue),
                    title: Text("E-Posta"),
                    subtitle: Text("akyldzveysel@gmail.com"),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _ozellikSatiri(IconData ikon, String baslik, String aciklama) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.blueAccent.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(ikon, color: Colors.blueAccent, size: 28),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  baslik,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  aciklama,
                  style: const TextStyle(fontSize: 14, color: Colors.black54),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
