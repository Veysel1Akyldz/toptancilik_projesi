import 'package:flutter/material.dart';
import 'hakkimizda_page.dart';
import 'info_page.dart';
import 'sepet_page.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  String uyelikDurumu = "Altın Üye";

  Color UyeRengi() {
    if (uyelikDurumu == "Altın Üye") return Colors.amber.shade700;
    if (uyelikDurumu == "Bronz Üye") return Colors.orange.shade800;
    return Colors.blueGrey;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // SEPET BÖLÜMÜ
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const SepetPage()),
          );
        },
        backgroundColor: Colors.blueAccent,
        icon: const Icon(Icons.shopping_basket, color: Colors.white),
        label: const Text("Sepet", style: TextStyle(color: Colors.white)),
      ),

      appBar: AppBar(
        title: const Text(
          "Akyıldız Toptancılık",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            color: Colors.white,
            onPressed: () => Navigator.pushReplacementNamed(context, '/'),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 15),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Üyelik durumunuz : ',
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  uyelikDurumu,
                  style: TextStyle(
                    color: UyeRengi(),
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const InfoPage()),
                    );
                  },
                  child: const Text(
                    "Üyelik Ayrıcalıkları INFO",
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HakkimizdaPage(),
                      ),
                    );
                  },
                  child: const Text(
                    "Hakkımızda",
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),

            const Divider(thickness: 2),

            const Text(
              "🔥 GÜNÜN İNDİRİMLERİ",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.orange,
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 100,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _indirimKutusu("Yağlarda %20 \n İndirim", Colors.redAccent),
                    _indirimKutusu("Şekerde Fırsat", Colors.blue),
                    _indirimKutusu("Bakliyat Haftası", Colors.green),
                  ],
                ),
              ),
            ),

            const Divider(thickness: 2),

            const Text(
              "📦 ÜRÜN KATALOĞU",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            // Ürünler
            const UrunKarti(
              logo: "assets/images/mercimek.webp",
              ad: "Süzme Mercimek 5KG",
              fiyat: 240,
              kampanyaTipi: 1,
            ),
            const UrunKarti(
              logo: "assets/images/yag.jpg",
              ad: "Ayçiçek Yağı 5L",
              fiyat: 190,
              kampanyaTipi: 0,
            ),
            const UrunKarti(
              logo: "assets/images/seker1.webp",
              ad: "Toz Şeker 10KG",
              fiyat: 310,
              kampanyaTipi: 1,
            ),
            const UrunKarti(
              logo: "assets/images/pirinc.jpg",
              ad: "Baldo Pirinç 5KG",
              fiyat: 275,
              kampanyaTipi: 0,
            ),
            const UrunKarti(
              logo: "assets/images/tuz.jpg",
              ad: "Tuz  5 KG",
              fiyat: 120,
              kampanyaTipi: 3,
            ),
            const UrunKarti(
              logo: "assets/images/yumos.webp",
              ad: "Yumoş Yumuşatıcı 5 LT",
              fiyat: 410,
              kampanyaTipi: 2,
            ),

            const SizedBox(height: 80),
          ],
        ),
      ),
    );
  }

  Widget _indirimKutusu(String metin, Color renk) {
    return Container(
      width: 140,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: renk,
        borderRadius: BorderRadius.circular(22),
      ),
      child: Center(
        child: Text(
          metin,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class UrunKarti extends StatefulWidget {
  final String ad;
  final int fiyat;
  final int kampanyaTipi;
  final String logo;

  const UrunKarti({
    super.key,
    required this.ad,
    required this.fiyat,
    this.kampanyaTipi = 0,
    required this.logo,
  });

  @override
  State<UrunKarti> createState() => _UrunKartiState();
}

class _UrunKartiState extends State<UrunKarti> {
  int adet = 0;

  @override
  Widget build(BuildContext context) {
    int bedavaAdet = 0;
    String kampanyaMetni = "";

    if (widget.kampanyaTipi == 1) {
      bedavaAdet = adet ~/ 4;
      kampanyaMetni = "🔥 3 ALANA 4. BEDAVA!";
    } else if (widget.kampanyaTipi == 2) {
      bedavaAdet = adet ~/ 3;
      kampanyaMetni = "🔥 3 AL 2 ÖDE!";
    } else if (widget.kampanyaTipi == 3) {
      kampanyaMetni = "🔥 %20 İNDİRİM!";
    }

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            ListTile(
              contentPadding: EdgeInsets.zero,
              // --- DÜZELTİLEN RESİM KISMI BURASI ---
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  widget.logo, // Yukarıdan gelen resmi direkt buraya yazıyoruz
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                  // Eğer yazdığın resim klasörde bulunamazsa hata vermek yerine sepet ikonu göstersin
                  errorBuilder: (context, error, stackTrace) => const Icon(
                    Icons.shopping_bag,
                    color: Colors.blueAccent,
                    size: 40,
                  ),
                ),
              ),
              title: Text(
                widget.ad,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Birim Fiyat: ${widget.fiyat} TL"),
                  if (widget.kampanyaTipi != 0)
                    Text(
                      kampanyaMetni,
                      style: const TextStyle(
                        color: Colors.red,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                ],
              ),
              trailing: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.remove, color: Colors.red),
                      onPressed: () {
                        if (adet > 0) setState(() => adet--);
                      },
                    ),
                    Text(
                      "$adet",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.add, color: Colors.green),
                      onPressed: () => setState(() => adet++),
                    ),
                  ],
                ),
              ),
            ),

            if (bedavaAdet > 0 || (widget.kampanyaTipi == 3 && adet > 0))
              Container(
                margin: const EdgeInsets.only(top: 8),
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.green.shade50,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.celebration,
                      color: Colors.green,
                      size: 20,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      widget.kampanyaTipi == 3
                          ? "Kampanya: Kasada %20 indirim uygulanacak!"
                          : "Kampanya: $bedavaAdet adet bedava ürün kazandınız!",
                      style: const TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),

            if (adet > 0)
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () {
                      bool sepetteVarMi = false;
                      for (var urun in SepetHafizasi.urunler) {
                        if (urun['ad'] == widget.ad) {
                          urun['adet'] += adet;
                          sepetteVarMi = true;
                          break;
                        }
                      }

                      if (!sepetteVarMi) {
                        SepetHafizasi.urunler.add({
                          'ad': widget.ad,
                          'fiyat': widget.fiyat,
                          'adet': adet,
                          'kampanyaTipi': widget.kampanyaTipi,
                        });
                      }

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("${widget.ad} sepete eklendi!"),
                          backgroundColor: Colors.green,
                          duration: const Duration(seconds: 1),
                        ),
                      );
                      setState(() => adet = 0);
                    },
                    icon: const Icon(Icons.add_shopping_cart),
                    label: const Text(
                      "Sepete Ekle",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
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
