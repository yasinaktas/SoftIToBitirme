import 'dart:async';

import 'package:clone_lcwaikiki/pages/urunler.dart';

import '../models/brand.dart';
import '../widgets/brand_list.dart';
import '../widgets/image_carousel.dart';
import '../widgets/search_bar.dart';
import 'package:flutter/material.dart';

/*
 * Host Page içinde gösterilir
 * 
 */
class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  final List<String> appBarTexts = [
    "Binlerce Marka Tek Tıkla LC Waikiki'de",
    "LC Wakiki Kalitesi ve Güvencesi",
    "Kapıda Nakit Ödeme Seçeneği",
    "İstanbul'da 14.00'a Kadar Sipariş Ver, Bugün Teslimat!",
    "Mağazadan Ücretsiz Teslimat",
  ];
  int _currentIndex = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 3), (timer) {
      setState(() {
        _currentIndex = (_currentIndex + 1) % appBarTexts.length;
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  final List<String> carouselImages1 = [
    "images/anasayfa/1.webp",
    "images/anasayfa/2.webp",
    "images/anasayfa/3.webp",
    "images/anasayfa/4.webp",
    "images/anasayfa/5.webp",
    "images/anasayfa/6.webp",
  ];
  final List<String> carouselImages2 = [
    "images/anasayfa/7.webp",
    "images/anasayfa/8.webp",
    "images/anasayfa/9.webp",
    "images/anasayfa/10.webp",
    "images/anasayfa/11.webp",
  ];
  final List<String> images1 = [
    "images/anasayfa/12.webp",
    "images/anasayfa/13.webp",
    "images/anasayfa/14.webp",
    "images/anasayfa/15.webp",
    "images/anasayfa/16.webp",
    "images/anasayfa/17.webp",
    "images/anasayfa/18.webp",
    "images/anasayfa/19.webp",
  ];
  final List<String> carouselImages3 = [
    "images/anasayfa/20.webp",
    "images/anasayfa/21.webp",
  ];
  final List<Brand> brands = [
    Brand(name: "LC WAIKIKI", imageUrl: "images/anasayfa/logo1.png"),
    Brand(name: "Civil", imageUrl: "images/anasayfa/logo2.jpg"),
    Brand(name: "ALTINYILDIZ", imageUrl: "images/anasayfa/logo3.png"),
    Brand(name: "D'S damat", imageUrl: "images/anasayfa/logo4.jpeg"),
    Brand(name: "HATEMOĞLU", imageUrl: "images/anasayfa/logo5.png"),
    Brand(name: "FLO", imageUrl: "images/anasayfa/logo6.jpg"),
    Brand(name: "TUDORS", imageUrl: "images/anasayfa/logo7.jpg"),
    Brand(name: "ADIDAS", imageUrl: "images/anasayfa/logo8.png"),
    Brand(name: "AVON", imageUrl: "images/anasayfa/logo9.png"),
    Brand(name: "BELLA MAISON", imageUrl: "images/anasayfa/logo10.png"),
    Brand(name: "JACK&JONES", imageUrl: "images/anasayfa/logo11.webp"),
    Brand(name: "LEGO", imageUrl: "images/anasayfa/logo12.png"),
    Brand(name: "Slazenger", imageUrl: "images/anasayfa/logo13.png"),
  ];
  final List<String> images2 = [
    "images/anasayfa/22.webp",
    "images/anasayfa/23.webp",
    "images/anasayfa/24.webp",
    "images/anasayfa/25.webp",
    "images/anasayfa/26.webp",
    "images/anasayfa/27.webp",
  ];

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 4.0,
                  horizontal: 12.0,
                ),
                child: Text(
                  appBarTexts[_currentIndex],
                  style: TextStyle(fontSize: 13, color: Colors.black),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Divider(color: Colors.grey.shade200, thickness: 0.5),
            CustomSearchBar(),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Urunler()),
                );
              },
              child: CustomImageCarousel(
                imageUrls: carouselImages1,
                heightRatio: 0.55,
              ),
            ),
            SizedBox(height: 8.0),
            CustomImageCarousel(imageUrls: carouselImages2, heightRatio: 0.08),
            for (int i = 0; i < images1.length; i++)
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Row(
                  children: [
                    Expanded(child: Image.asset(images1[i], fit: BoxFit.cover)),
                  ],
                ),
              ),
            SizedBox(height: 8.0),
            BrandList(height: height * 0.15, brands: brands),
            SizedBox(height: 8.0),
            CustomImageCarousel(imageUrls: carouselImages3, heightRatio: 0.085),
            for (int i = 0; i < images2.length; i++)
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Row(
                  children: [
                    Expanded(child: Image.asset(images2[i], fit: BoxFit.cover)),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
