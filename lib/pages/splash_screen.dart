import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Untuk menyembunyikan status bar
import 'package:tugas_1/main.dart'; // Impor MainPage

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState(); // Publik
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
      if (mounted) { // Pastikan widget masih ada
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const MainPage()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []); // Sembunyikan status bar
    return Scaffold(
      backgroundColor: const Color.fromARGB(221, 97, 97, 97),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'images/VoChrono.png', // Ganti dengan path gambar Anda
              width: 200,
              height: 200,
            ),
          ],
        ),
      ),
    );
  }
}