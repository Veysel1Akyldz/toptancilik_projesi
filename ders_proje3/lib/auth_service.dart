import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  final SupabaseClient _supabase = Supabase.instance.client;

  // --- KAYIT OLMA FONKSİYONU ---
  Future<String?> signUp({
    required String email,
    required String password,
    required String ad,
    required String soyad,
    required String telefon,
    required String sirketAdi,
  }) async {
    try {
      // 1. Supabase Auth'a kullanıcıyı ekle
      final response = await _supabase.auth.signUp(
        email: email,
        password: password,
        data: {
          'display_name': '$ad $soyad',
        },
      );

      final user = response.user;

      if (user != null) {
        // 2. Kendi 'users' tablomuza ekstra bilgileri ekle (PostgreSQL tablon)
        // Tablo adının 'users' olduğundan ve sütun isimlerinin doğruluğundan emin ol
        await _supabase.from('users').insert({
          'id': user.id, // Supabase Auth ID'si
          'ad_soyad': '$ad $soyad',
          'telefon': telefon,
          'sirket_adi': sirketAdi,
          'eposta': email,
        });
        return null; // Hata yoksa null dön
      }
      return "Kullanıcı oluşturulamadı.";
    } catch (e) {
      return e.toString(); // Hata varsa hata mesajını dön
    }
  }

  // --- GİRİŞ YAPMA FONKSİYONU ---
  Future<String?> signIn({
    required String email,
    required String password,
  }) async {
    try {
      await _supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );
      return null; // Başarılı
    } catch (e) {
      return e.toString();
    }
  }

  // --- ÇIKIŞ YAPMA ---
  Future<void> signOut() async {
    await _supabase.auth.signOut();
  }

  // Mevcut kullanıcının ID'sini getir
  String? get currentUserId => _supabase.auth.currentUser?.id;
}
