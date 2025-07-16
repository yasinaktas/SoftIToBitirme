import 'dart:math';

import 'package:clone_lcwaikiki/models/urun.dart';

class UrunGenerator {
  final Random _random = Random();
  final List<String> _names = [
    "LCW Vision",
    "LCW Casual",
    "LCW Classic",
    "SOUTHBLUE",
    "XSIDE",
    "LCW HOME",
  ];
  final List<String> _descriptions = [
    "Standart kalıp erkek kargo pantolon",
    "Slim fit erkek gömlek",
    "Regular fit erkek tişört",
    "Standart kalıp erkek kot pantolon",
    "Regular fit erkek sweatshirt",
    "Slim fit erkek blazer ceket",
    "Regular fit erkek yelek",
    "Slim fit erkek ceket",
    "Regular fit erkek mont",
    "Slim fit erkek kaban",
    "Regular fit erkek triko",
    "Polo yaka erkek tişört",
    "Dar kalıp erkek tişört",
    "Regular fit erkek gömlek",
    "Slim fit erkek pantolon",
    "Regular fit erkek şort",
    "Slim fit erkek tişört",
    "Regular fit erkek sweatshirt",
    "Slim fit erkek yelek",
    "Regular fit erkek ceket",
    "Slim fit erkek mont",
    "Regular fit erkek kaban",
    "Slim fit erkek triko",
    "Regular fit erkek tişört",
    "Slim fit erkek gömlek",
    "Regular fit erkek pantolon",
    "Slim fit erkek şort",
  ];
  final List<String> _imageUrls = [
    "images/urun/urun1_1.webp",
    "images/urun/urun1_2.webp",
    "images/urun/urun1_3.webp",
    "images/urun/urun2_1.webp",
    "images/urun/urun2_2.webp",
    "images/urun/urun2_3.webp",
    "images/urun/urun3_1.webp",
    "images/urun/urun3_2.webp",
    "images/urun/urun3_3.webp",
    "images/urun/urun4_1.webp",
    "images/urun/urun4_2.webp",
    "images/urun/urun4_3.webp",
    "images/urun/urun5_1.webp",
    "images/urun/urun5_2.webp",
    "images/urun/urun5_3.webp",
    "images/urun/urun6_1.webp",
    "images/urun/urun6_2.webp",
    "images/urun/urun6_3.webp",
    "images/urun/urun7_1.webp",
    "images/urun/urun7_2.webp",
    "images/urun/urun8_1.webp",
    "images/urun/urun8_2.webp",
    "images/urun/urun9.webp",
    "images/urun/urun10_1.webp",
    "images/urun/urun10_2.webp",
    "images/urun/urun11_1.webp",
    "images/urun/urun11_2.webp",
    "images/urun/urun11_3.webp",
  ];

  Urun generateRandomUrun() {
    int imageCount = _random.nextInt(3) + 2;
    List<String> selectedImages = [];
    for (int i = 0; i < imageCount; i++) {
      selectedImages.add(_imageUrls[_random.nextInt(_imageUrls.length)]);
    }
    Urun urun = Urun(
      name: _names[_random.nextInt(_names.length)],
      description: _descriptions[_random.nextInt(_descriptions.length)],
      price: (_random.nextDouble() * 500 + 50).roundToDouble(),
      rate: (_random.nextInt(5) + 1),
      rateCount: (_random.nextInt(100) + 1),
      colorChoice: _random.nextInt(8),
      imaUrls: selectedImages,
    );
    if (_random.nextInt(10) > 4) {
      urun.coupon = (_random.nextInt(5) + 1) * 10;
    }
    return urun;
  }

  List<Urun> generateRandomUrunList(int count) {
    List<Urun> urunList = [];
    for (int i = 0; i < count; i++) {
      urunList.add(generateRandomUrun());
    }
    return urunList;
  }
}
