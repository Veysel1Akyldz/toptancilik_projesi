import 'package:ders_proje3/odeme_page.dart'; // Kendi proje adına göre burası doğruysa dokunma
import 'package:flutter/material.dart';

class SepetHafizasi {
  static List<Map<String, dynamic>> urunler = [];
}

class SepetPage extends StatefulWidget {
  const SepetPage({super.key});

  @override
  State<SepetPage> createState() => _SepetPageState();
}

class _SepetPageState extends State<SepetPage> {
  // ZEKİ HESAPLAMA FONKSİYONU
  double get _toplamTutar {
    double toplam = 0;

    for (var urun in SepetHafizasi.urunler) {
      int miktar = urun['adet'];
      double fiyat = urun['fiyat'].toDouble();
      int kampanya = urun['kampanyaTipi'] ?? 0;

      double urunToplami = miktar * fiyat;

      if (kampanya == 1) {
        int bedavaSayisi = miktar ~/ 4;
        urunToplami -= (bedavaSayisi * fiyat);
      } else if (kampanya == 2) {
        int bedavaSayisi = miktar ~/ 3;
        urunToplami -= (bedavaSayisi * fiyat);
      } else if (kampanya == 3) {
        urunToplami = urunToplami * 0.80;
      }

      toplam += urunToplami;
    }

    return toplam;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Sepetim",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: SepetHafizasi.urunler.isEmpty
          ? const Center(
              child: Text(
                "Sepetiniz şu an boş 🛒",
                style: TextStyle(fontSize: 20, color: Colors.black54),
              ),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: SepetHafizasi.urunler.length,
                    itemBuilder: (context, index) {
                      var urun = SepetHafizasi.urunler[index];
                      return Card(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        child: ListTile(
                          leading: const Icon(
                            Icons.shopping_basket,
                            color: Colors.orange,
                            size: 35,
                          ),
                          title: Text(
                            urun['ad'],
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            "Birim Fiyat: ${urun['fiyat']} TL\nMiktar: ${urun['adet']} Adet",
                          ),
                          trailing: IconButton(
                            icon: const Icon(
                              Icons.delete_outline,
                              color: Colors.red,
                              size: 30,
                            ),
                            onPressed: () {
                              setState(() {
                                SepetHafizasi.urunler.removeAt(index);
                              });
                            },
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade300,
                        blurRadius: 10,
                        spreadRadius: -5,
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Toplam Tutar",
                            style: TextStyle(color: Colors.grey, fontSize: 14),
                          ),
                          Text(
                            "${_toplamTutar.toStringAsFixed(2)} TL",
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.blueAccent,
                            ),
                          ),
                        ],
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 25,
                            vertical: 12,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  OdemePage(toplamTutar: _toplamTutar),
                            ),
                          );
                        },
                        child: const Text(
                          "Sepeti Onayla",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
