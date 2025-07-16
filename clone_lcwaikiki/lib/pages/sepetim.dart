import 'dart:math';

import 'package:clone_lcwaikiki/models/global_state.dart';
import 'package:clone_lcwaikiki/models/urun.dart';
import 'package:clone_lcwaikiki/widgets/sepet_card.dart';
import 'package:flutter/material.dart';

class Sepetim extends StatefulWidget {
  const Sepetim({super.key});

  @override
  State<Sepetim> createState() => _SepetimState();
}

class _SepetimState extends State<Sepetim> {
  bool _isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: Text(
          "Sepetim (${GlobalState.cart.length} Ürün)",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.close, color: Colors.grey),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Divider(height: 0, color: Colors.grey.shade200),
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).padding.bottom,
          left: 16,
          right: 16,
          top: 16,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              spreadRadius: 0,
              offset: Offset(0, -2),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "SİPARİŞ ÖZETİ",
                  style: TextStyle(
                    fontSize: 18,
                    color: const Color.fromARGB(255, 0, 94, 255),
                  ),
                ),
                Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.keyboard_arrow_down,
                    color: Color.fromARGB(255, 0, 94, 255),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.green.shade100,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Column(
                    children: [
                      Text(
                        "Toplam İndirim",
                        style: TextStyle(fontSize: 14, color: Colors.green),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "0,00 TL",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "Ödenecek Tutar",
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "${GlobalState.cart.fold(0.0, (sum, item) => sum + item.price).toInt()} TL",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 24),
            Container(
              padding: EdgeInsets.symmetric(vertical: 12),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 0, 51, 138),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                "Ödeme Adımına Geç",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(color: Colors.white),
            child: Row(
              children: [
                Icon(Icons.keyboard_arrow_left),
                SizedBox(width: 8),
                Text("Alışverişe Devam Et", style: TextStyle(fontSize: 12)),
                Spacer(),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey.shade200, width: 1),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.favorite, color: Colors.pinkAccent, size: 18),
                      SizedBox(width: 4),
                      Text(
                        "Benim İçin Al",
                        style: TextStyle(
                          color: Colors.blueAccent,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 12, left: 12, right: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Checkbox(
                      value: _isSelected,
                      onChanged: (value) {
                        setState(() {
                          _isSelected = value!;
                        });
                      },
                    ),
                    Text(
                      "LC Waikiki",
                      style: TextStyle(
                        color: Colors.blueAccent,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(width: 4),
                    Text(
                      "tarafından gönderilecek ürünler",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
                for (Urun urun in GlobalState.cart)
                  Dismissible(
                    key: Key(Random().nextInt(1000000).toString()),
                    background: Container(
                      color: Colors.red,
                      alignment: Alignment.centerRight,
                      padding: EdgeInsets.only(right: 16),
                      child: Icon(Icons.delete, color: Colors.white),
                    ),
                    onDismissed: (direction) {
                      setState(() {
                        GlobalState.cart.remove(urun);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("${urun.name} sepetten çıkarıldı."),
                          ),
                        );
                      });
                    },
                    child: Column(
                      children: [
                        Divider(
                          height: 1,
                          color: Colors.grey.shade200,
                          indent: 16,
                          endIndent: 16,
                        ),
                        SepetCard(
                          urun: urun,
                          onFavoriteToggle: () {
                            setState(() {
                              urun.favorited = !urun.favorited;
                              if (urun.favorited) {
                                GlobalState.favorites.add(urun);
                              } else {
                                GlobalState.favorites.remove(urun);
                              }
                            });
                          },
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 16, left: 12, right: 12),
            padding: EdgeInsets.only(top: 16, bottom: 4, left: 8, right: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Kupon Kodu Ekle",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        alignment: Alignment.centerLeft,
                        height: 40,
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Kupon kodunu giriniz",
                            hintStyle: TextStyle(
                              fontSize: 14,
                              color: Colors.grey.shade600,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(2),
                              borderSide: BorderSide(
                                color: Colors.grey.shade200,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 8),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey.shade400,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(2),
                        ),
                        elevation: 0,
                      ),
                      child: Text(
                        "Uygula",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 4,
              children: [
                Icon(Icons.info_outline, size: 16),
                SizedBox(width: 4),
                Expanded(
                  child: Text(
                    "Sepete eklenen ürünleri diğer müşterilerimiz satın alabilmektedir.\nStoklar tükenmeden alışveriş işlemlerinizi tamamlayınız.",
                    style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
