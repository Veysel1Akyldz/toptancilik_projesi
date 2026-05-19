import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'login_page.dart';
import 'home_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://umblhcsrcdznowadfzza.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InVtYmxoY3NyY2R6bm93YWRmenphIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzgwNzkwNTYsImV4cCI6MjA5MzY1NTA1Nn0.6OMYkJt4YsDFjOYjb9ZzNawxTxxz9_XS6Y3GoRF_bRE',
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Akyıldız Toptancılık",

      initialRoute: '/',
      routes: {
        '/': (context) => const login_page(),
        '/home': (context) => const home(),
      },
    );
  }
}
