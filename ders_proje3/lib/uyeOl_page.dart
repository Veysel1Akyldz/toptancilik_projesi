import 'package:flutter/material.dart';
import 'auth_service.dart';

class UyeolPage extends StatefulWidget {
  const UyeolPage({super.key});

  @override
  State<UyeolPage> createState() => _UyeolPageState();
}

class _UyeolPageState extends State<UyeolPage> {
  final AuthService _authService = AuthService();
  
  final TextEditingController _adController = TextEditingController();
  final TextEditingController _soyadController = TextEditingController();
  final TextEditingController _telefonController = TextEditingController();
  final TextEditingController _sirketController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _sifreController = TextEditingController();

  @override
  void dispose() {
    _adController.dispose();
    _soyadController.dispose();
    _telefonController.dispose();
    _sirketController.dispose();
    _emailController.dispose();
    _sifreController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Üye Ol", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                const SizedBox(height: 35),
                Expanded(
                  child: TextField(
                    controller: _adController,
                    decoration: InputDecoration(
                      labelText: "Ad",
                      hintText: "Veysel",
                      prefixIcon: const Icon(Icons.person),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: TextField(
                    controller: _soyadController,
                    decoration: InputDecoration(
                      labelText: "Soyad",
                      hintText: "Akyıldız",
                      prefixIcon: const Icon(Icons.person),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            TextField(
              controller: _telefonController,
              decoration: InputDecoration(
                labelText: "Telefon Numarası",
                hintText: "555 000 00 00",
                prefixIcon: const Icon(Icons.phone),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 15),
            TextField(
              controller: _sirketController,
              decoration: InputDecoration(
                labelText: "Şirket Adı ",
                hintText: "Akyıldız Toptancılık",
                prefixIcon: const Icon(Icons.store),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: "E Posta",
                hintText: "@gmail.com",
                prefixIcon: const Icon(Icons.mail),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 15),
            TextField(
              controller: _sifreController,
              decoration: InputDecoration(
                labelText: "Şifre",
                hintText: "***********",
                prefixIcon: const Icon(Icons.security),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 40,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                onPressed: () async {
                  if (_emailController.text.isEmpty || _sifreController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Lütfen e-posta ve şifre alanlarını doldurun!")),
                    );
                    return;
                  }

                  final error = await _authService.signUp(
                    email: _emailController.text.trim(),
                    password: _sifreController.text.trim(),
                    ad: _adController.text.trim(),
                    soyad: _soyadController.text.trim(),
                    telefon: _telefonController.text.trim(),
                    sirketAdi: _sirketController.text.trim(),
                  );

                  if (error == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("✅ Kayıt başarılı! Lütfen e-postanızı onaylayın (eğer gerekiyorsa) ve giriş yapın."),
                        backgroundColor: Colors.green,
                      ),
                    );
                    Navigator.pop(context); // Giriş ekranına geri dön
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("❌ Kayıt hatası: $error"),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                },
                child: const Text(
                  "Kaydet",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
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
