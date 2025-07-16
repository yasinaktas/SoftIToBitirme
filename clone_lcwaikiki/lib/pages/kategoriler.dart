import 'package:clone_lcwaikiki/pages/urunler.dart';
import 'package:flutter/material.dart';

import '../models/category.dart';
import '../widgets/category_card.dart';
import '../widgets/search_bar.dart';

class Kategoriler extends StatefulWidget {
  const Kategoriler({super.key});

  @override
  State<Kategoriler> createState() => _KategorilerState();
}

class _KategorilerState extends State<Kategoriler> {
  final List<Category> categories = [
    Category(name: "Kadın", imageUrl: "images/kategori/kategori1.webp"),
    Category(name: "Erkek", imageUrl: "images/kategori/kategori2.webp"),
    Category(
      name: "Bebek (0-3 Yaş)",
      imageUrl: "images/kategori/kategori3.webp",
    ),
    Category(name: "Kız Çocuk", imageUrl: "images/kategori/kategori4.webp"),
    Category(name: "Erkek Çocuk", imageUrl: "images/kategori/kategori5.webp"),
    Category(
      name: "Pijama | İç Giyim",
      imageUrl: "images/kategori/kategori6.webp",
    ),
    Category(name: "Ayakkabı", imageUrl: "images/kategori/kategori7.webp"),
    Category(name: "Aksesuar", imageUrl: "images/kategori/kategori8.webp"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomSearchBar(showCamera: false, showUserButton: false),
            Divider(color: Colors.grey.shade300, thickness: 0.5, height: 5),
            Expanded(
              child: ListView.builder(
                itemCount: categories.length,
                itemBuilder: (context, index) =>
                    CategoryCard(category: categories[index]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
