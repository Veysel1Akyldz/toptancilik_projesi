import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'auth_service.dart';
import 'sepet_page.dart'; 

class OdemePage extends StatelessWidget {
  final double toplamTutar;

  const OdemePage({super.key, required this.toplamTutar});

  @override
  Widget build(BuildContext context) {
    final AuthService _authService = AuthService();
    final SupabaseClient _supabase = Supabase.instance.client;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Güvenli Ödeme",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.blueAccent.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.blueAccent.withOpacity(0.3)),
              ),
              child: Column(
                children: [
                  const Text(
                    "Ödenecek Toplam Tutar",
                    style: TextStyle(fontSize: 16, color: Colors.black54),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "${toplamTutar.toStringAsFixed(2)} TL",
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),
            const Text(
              "Kart Bilgileri",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),

            // Kart Numarası
            TextField(
              decoration: InputDecoration(
                labelText: "Kart Numarası",
                hintText: "0000 0000 0000 0000",
                prefixIcon: const Icon(Icons.credit_card),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 15),

            // Son Kullanma ve CVV
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: "Son Kullanma",
                      hintText: "AA/YY",
                      prefixIcon: const Icon(Icons.date_range),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: "CVV",
                      hintText: "123",
                      prefixIcon: const Icon(Icons.security),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    obscureText: true,
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),

            // Kart Üzerindeki İsim
            TextField(
              decoration: InputDecoration(
                labelText: "Kart Üzerindeki İsim",
                prefixIcon: const Icon(Icons.person_outline),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),

            const SizedBox(height: 40),

            // Ödemeyi Tamamla Butonu
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () async {
                  // --- SIPARISI VERITABANINA KAYDET ---
                  final userId = _authService.currentUserId;

                  if (userId == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("⚠️ Siparişi kaydetmek için lütfen giriş yapın!"),
                        backgroundColor: Colors.orange,
                      ),
                    );
                  } else {
                    try {
                      // Supabase 'orders' tablosuna ekle
                      await _supabase.from('orders').insert({
                        'user_id': userId,
                        'toplam_tutar': toplamTutar,
                      });
                      print("Sipariş başarıyla kaydedildi.");
                    } catch (e) {
                      print("Sipariş kaydetme hatası: $e");
                    }
                  }

                  // --- Ekrana başarılı mesajı ver ---
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("✅ Ödeme Başarılı! Siparişiniz alındı."),
                      backgroundColor: Colors.green,
                      duration: Duration(seconds: 2),
                    ),
                  );

                  // Sepeti temizle ve ana sayfaya git
                  SepetHafizasi.urunler.clear();
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    '/home',
                    (route) => false,
                  );
                },
                child: const Text(
                  "Ödemeyi Tamamla",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
