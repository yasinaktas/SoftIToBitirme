import 'dart:math';

import 'package:clone_lcwaikiki/models/global_state.dart';
import 'package:clone_lcwaikiki/widgets/favorite_card.dart';
import 'package:flutter/material.dart';

class Favoriler extends StatefulWidget {
  const Favoriler({super.key});

  @override
  State<Favoriler> createState() => _FavorilerState();
}

class _FavorilerState extends State<Favoriler> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Favorilerim (${GlobalState.favorites.length})",
            style: TextStyle(fontSize: 18),
          ),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(1),
            child: Divider(color: Colors.grey.shade300),
          ),
        ),
        body: Column(
          children: [
            TabBar(
              tabs: [
                Tab(text: "Favoriler"),
                Tab(text: "Koleksiyonlar"),
                Tab(
                  child: Row(
                    spacing: 4,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.transparent,
                        radius: 12,
                        child: Image.asset("images/kategori_orta/elsiva.png"),
                      ),
                      Text("Elsiva"),
                    ],
                  ),
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 8,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade200,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Row(
                                  spacing: 8,
                                  children: [
                                    Icon(
                                      Icons.search,
                                      color: Colors.grey.shade600,
                                    ),
                                    Text(
                                      "Favorilerimde Ara",
                                      style: TextStyle(
                                        color: Colors.grey.shade600,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: SizedBox(
                                height: 32,
                                child: Row(
                                  spacing: 4,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.edit_note_outlined,
                                      color: Colors.grey.shade600,
                                      size: 16,
                                    ),
                                    Text(
                                      "Düzenle",
                                      style: TextStyle(
                                        color: Colors.grey.shade600,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                    VerticalDivider(indent: 4, endIndent: 4),
                                    Icon(
                                      Icons.ios_share_outlined,
                                      color: Colors.grey.shade600,
                                      size: 16,
                                    ),
                                    Text(
                                      "Paylaş",
                                      style: TextStyle(
                                        color: Colors.grey.shade600,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        SizedBox(
                          height: 50,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              ChoiceChip(
                                selected: false,
                                onSelected: (value) {},
                                label: Text(
                                  "Tümü",
                                  style: TextStyle(
                                    color: const Color.fromARGB(
                                      255,
                                      0,
                                      57,
                                      156,
                                    ),
                                    fontSize: 12,
                                  ),
                                ),
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  side: BorderSide(color: Colors.grey.shade200),
                                ),
                              ),
                              SizedBox(width: 10),
                              ChoiceChip(
                                selected: false,
                                onSelected: (value) {},
                                label: Row(
                                  spacing: 4,
                                  children: [
                                    Icon(
                                      Icons.favorite,
                                      size: 16,
                                      color: const Color.fromARGB(
                                        255,
                                        0,
                                        57,
                                        156,
                                      ),
                                    ),
                                    Text(
                                      "En Çok Beğenilenler",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  side: BorderSide(color: Colors.grey.shade200),
                                ),
                              ),
                              SizedBox(width: 10),
                              ChoiceChip(
                                selected: false,
                                onSelected: (value) {},
                                label: Row(
                                  spacing: 4,
                                  children: [
                                    Icon(
                                      Icons.whatshot,
                                      size: 16,
                                      color: Colors.red,
                                    ),
                                    Text(
                                      "En Çok Satanlar",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  side: BorderSide(color: Colors.grey.shade200),
                                ),
                              ),
                              SizedBox(width: 10),
                              ChoiceChip(
                                selected: false,
                                onSelected: (value) {},
                                label: Row(
                                  spacing: 4,
                                  children: [
                                    Icon(
                                      Icons.star_rate,
                                      size: 16,
                                      color: Colors.orange,
                                    ),
                                    Text(
                                      "En Çok Değerlendirilenler",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  side: BorderSide(color: Colors.grey.shade200),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 8),
                        Expanded(
                          child: ListView.builder(
                            itemCount: GlobalState.favorites.length,
                            itemBuilder: (context, index) {
                              return Dismissible(
                                key: Key(Random().nextInt(1000000).toString()),
                                background: Container(
                                  color: Colors.red,
                                  alignment: Alignment.centerRight,
                                  padding: EdgeInsets.only(right: 16),
                                  child: Icon(
                                    Icons.delete,
                                    color: Colors.white,
                                  ),
                                ),
                                onDismissed: (direction) {
                                  setState(() {
                                    GlobalState.favorites.removeAt(index);
                                  });
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text("Favori silindi")),
                                  );
                                },
                                child: FavoriteCard(
                                  urun: GlobalState.favorites[index],
                                  onAddToCart: () {},
                                  onDeleted: () {},
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Center(child: Text("Koleksiyonlar")),
                  Center(child: Text("Elsiva")),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
