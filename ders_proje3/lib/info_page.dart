import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Üye Ayrıcalıkları",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Üyelik Seviyeleri",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 20),

            // Altın Üye Kartı
            const Card(
              elevation: 3, // Hafif gölge
              child: ListTile(
                leading: Icon(
                  Icons.workspace_premium,
                  color: Colors.amber,
                  size: 35,
                ),
                title: Text(
                  "Altın Üye",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text("En yüksek indirimler ve özel fırsatlar"),
              ),
            ),

            const SizedBox(height: 10),

            // Gümüş Üye Kartı (Eskiden gri renkti, silver'a uyarladım)
            Card(
              elevation: 3,
              child: ListTile(
                leading: Icon(
                  Icons.star,
                  color: Colors.grey.shade400,
                  size: 35,
                ),
                title: const Text(
                  "Gümüş Üye",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: const Text("Zaman zaman indirim fırsatları"),
              ),
            ),

            const SizedBox(height: 10),

            // Standart Üye Kartı
            const Card(
              elevation: 3,
              child: ListTile(
                leading: Icon(Icons.person, color: Colors.blueGrey, size: 35),
                title: Text(
                  "Standart Üye",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text("Standart fiyatlar geçerlidir"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
