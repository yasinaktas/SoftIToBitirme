import 'package:clone_lcwaikiki/models/global_state.dart';
import 'package:clone_lcwaikiki/pages/favoriler.dart';
import 'package:clone_lcwaikiki/pages/giris.dart';
import 'package:clone_lcwaikiki/pages/kategoriler_orta.dart';
import 'package:clone_lcwaikiki/pages/sepetim.dart';

import 'pages/anasayfa.dart';
import 'package:flutter/material.dart';

import 'pages/kategoriler.dart';
import 'widgets/bottom_nav_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HostPage(),
      color: Colors.white,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white, // Arka plan rengi beyaz
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white, // AppBar arka plan rengi beyaz
          foregroundColor: Colors.black, // AppBar metin rengi siyah
          elevation: 0, // AppBar gölgesi kaldırıldı
        ),
      ),
    );
  }
}

/*
 * Scaffold yapısı kullanır
 * Bottom Navigation Bar ve ilgili sayfaları barındırır
 * Bottom Navigation Bar Custom Widget olarak tasarlanmıştır
 * App Bar'ı yoktur
 * Bottom Navigation Bar elemanları:
 * - Ana Sayfa
 * - Kategoriler
 * - Kategoriler Yuvarlak Butonu (Bottom Modal Sheet)
 * - Sepetim (Login olunmadıysa Login sayfasına yönlendirir)
 * - Favoriler (Badge var)
 */
class HostPage extends StatefulWidget {
  const HostPage({super.key});

  @override
  State<HostPage> createState() => _HostPageState();
}

class _HostPageState extends State<HostPage> {
  final List<Widget> _pages = [
    Anasayfa(),
    Kategoriler(),
    Sepetim(),
    Favoriler(),
    KategorilerOrta(),
  ];
  int _selectedIndex = 0;
  bool _isCenterButtonSelected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          _pages[_selectedIndex],
          if (_isCenterButtonSelected)
            Positioned.fill(
              child: Opacity(
                opacity: 0.5,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _isCenterButtonSelected = false;
                    });
                  },
                  child: Container(color: Colors.black),
                ),
              ),
            ),
          if (_isCenterButtonSelected) KategorilerOrta(),
        ],
      ),
      bottomNavigationBar: CustomBottomNavBar(
        selectedIndex: _selectedIndex,
        onItemSelected: (index) {
          if (index == 4) {
            setState(() {
              _isCenterButtonSelected = !_isCenterButtonSelected;
            });
            return;
          } else if (index == 2) {
            if (GlobalState.isLoggedIn == true) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Sepetim()),
              );
              return;
            }
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => GirisSayfasi()),
            );
            return;
          }
          setState(() {
            _selectedIndex = index;
            _isCenterButtonSelected = false;
          });
        },
        isCenterButtonSelected: _isCenterButtonSelected,
      ),
    );
  }
}
