import 'package:clone_lcwaikiki/models/global_state.dart';
import 'package:clone_lcwaikiki/models/urun.dart';
import 'package:flutter/material.dart';

class UrunDetay extends StatefulWidget {
  final Urun urun;
  const UrunDetay({super.key, required this.urun});

  @override
  State<UrunDetay> createState() => _UrunDetayState();
}

class _UrunDetayState extends State<UrunDetay> {
  final PageController pageController = PageController(initialPage: 0);
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        elevation: 12,
        shadowColor: Colors.black,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 0, 64, 174),
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          onPressed: () {
            setState(() {
              if (!GlobalState.cart.contains(widget.urun)) {
                GlobalState.cart.add(widget.urun);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("${widget.urun.name} ${widget.urun.description} sepete eklendi!"),
                    duration: Duration(seconds: 2),
                  ),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("${widget.urun.name} ${widget.urun.description} zaten sepette!"),
                    duration: Duration(seconds: 2),
                  ),
                );
              }
            });
          },
          child: Text(
            "Sepete Ekle",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.6,
              child: Stack(
                children: [
                  PageView.builder(
                    controller: pageController,
                    onPageChanged: (newIndex) {
                      setState(() {
                        index = newIndex;
                      });
                    },
                    itemCount: widget.urun.imaUrls.length,
                    itemBuilder: (context, index) {
                      return Image.asset(
                        widget.urun.imaUrls[index],
                        fit: BoxFit.cover,
                      );
                    },
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(widget.urun.imaUrls.length, (
                        circleIndex,
                      ) {
                        return Container(
                          margin: EdgeInsets.only(
                            bottom: 24,
                            left: 2,
                            right: 2,
                          ),
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: index == circleIndex
                                ? const Color.fromARGB(255, 0, 55, 151)
                                : Colors.grey.shade400,
                          ),
                        );
                      }),
                    ),
                  ),
                  if (widget.urun.coupon != null)
                    Positioned(
                      top: 4,
                      left: 4,
                      child: Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.all(8),
                        padding: EdgeInsets.symmetric(
                          horizontal: 4,
                          vertical: 0,
                        ),
                        decoration: BoxDecoration(color: Colors.black87),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              spacing: 2,
                              children: [
                                Text(
                                  "%",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 8,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  widget.urun.coupon.toString(),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              "Kupon",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 8,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Column(
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context, widget.urun);
                          },
                          icon: Icon(Icons.close),
                        ),
                        SizedBox(height: 8),
                        Container(
                          margin: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.ios_share),
                            color: Colors.black,
                            iconSize: 24,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            onPressed: () {
                              setState(() {
                                widget.urun.favorited = !widget.urun.favorited;
                              });
                            },
                            icon: Icon(
                              widget.urun.favorited
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                            ),
                            color: widget.urun.favorited
                                ? Colors.red
                                : Colors.black,
                            iconSize: 24,
                          ),
                        ),
                        Text("3.4B"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 4,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.urun.name,
                              style: TextStyle(
                                fontSize: 18,
                                color: const Color.fromARGB(255, 0, 60, 163),
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              widget.urun.description,
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(height: 16),
                            Row(
                              children: [
                                Row(
                                  children: List.generate(5, (index) {
                                    return Icon(
                                      index < widget.urun.rate
                                          ? Icons.star
                                          : Icons.star_border_outlined,
                                      size: 18,
                                      color: Colors.black,
                                    );
                                  }),
                                ),
                                SizedBox(width: 4),
                                Text(
                                  "(${widget.urun.rateCount} Değerlendirme)",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 12),
                            Text(
                              "Satıcı: LC Waikiki (İade Süresi: 120 Gün)",
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "${widget.urun.price} TL",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 24),
                  Row(
                    children: [
                      Text(
                        "Beden",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Spacer(),
                      Icon(Icons.info_outline, size: 16, color: Colors.black54),
                      SizedBox(width: 4),
                      Text(
                        "Beden Tablosu",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black54,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    runSpacing: 4,
                    children: [
                      ChoiceChip(
                        onSelected: (value) {},
                        label: Text("XS"),
                        selected: false,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                        backgroundColor: Colors.white,
                      ),
                      ChoiceChip(
                        onSelected: (value) {},
                        label: Text("S"),
                        selected: false,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                        backgroundColor: Colors.white,
                      ),
                      ChoiceChip(
                        onSelected: (value) {},
                        label: Text("M"),
                        selected: false,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                        backgroundColor: Colors.white,
                      ),
                      ChoiceChip(
                        onSelected: (value) {},
                        label: Text("L"),
                        selected: false,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                        backgroundColor: Colors.white,
                      ),
                      ChoiceChip(
                        onSelected: (value) {},
                        label: Text("XL"),
                        selected: false,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                        backgroundColor: Colors.white,
                      ),
                      ChoiceChip(
                        onSelected: (value) {},
                        label: Text("2XL"),
                        selected: false,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                        backgroundColor: Colors.white,
                      ),
                    ],
                  ),
                  SizedBox(height: 12),
                  Row(
                    children: [
                      Text(
                        "Renk",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Spacer(),
                      Text(
                        "(6 Renk)",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black54,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    runSpacing: 4,
                    children: [
                      ChoiceChip(
                        onSelected: (value) {},
                        label: Text("Siyah"),
                        selected: false,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                        backgroundColor: Colors.white,
                      ),
                      ChoiceChip(
                        onSelected: (value) {},
                        label: Text("Kırmızı"),
                        selected: false,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                        backgroundColor: Colors.white,
                      ),
                      ChoiceChip(
                        onSelected: (value) {},
                        label: Text("Beyaz"),
                        selected: false,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                        backgroundColor: Colors.white,
                      ),
                      ChoiceChip(
                        onSelected: (value) {},
                        label: Text("Yeşil"),
                        selected: false,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                        backgroundColor: Colors.white,
                      ),
                      ChoiceChip(
                        onSelected: (value) {},
                        label: Text("Mavi"),
                        selected: false,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                        backgroundColor: Colors.white,
                      ),
                      ChoiceChip(
                        onSelected: (value) {},
                        label: Text("Sarı"),
                        selected: false,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                        backgroundColor: Colors.white,
                      ),
                    ],
                  ),
                  SizedBox(height: 24),
                  Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.grey.shade200),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Bu ürün LC Waikiki satıcısı tarafından gönderilecektir.",
                          style: TextStyle(fontSize: 14, color: Colors.black),
                          textAlign: TextAlign.start,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Divider(color: Colors.grey.shade300, height: 20),
                        Row(
                          spacing: 8,
                          children: [
                            Icon(Icons.refresh_rounded),
                            Text("120 Gün İçerisinde İade"),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
                  Row(
                    spacing: 4,
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(color: Colors.blue.shade50),
                          ),
                          child: Column(
                            children: [
                              Image.asset(
                                "images/icons/bag.png",
                                width: 24,
                                height: 24,
                                color: const Color.fromARGB(255, 0, 60, 162),
                              ),
                              SizedBox(height: 4),
                              Text(
                                "Kombini Tamamla",
                                style: TextStyle(
                                  fontSize: 11,
                                  color: const Color.fromARGB(255, 0, 60, 162),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(color: Colors.blue.shade50),
                          ),
                          child: Column(
                            children: [
                              Image.asset(
                                "images/icons/tshirt.png",
                                width: 24,
                                height: 24,
                                color: const Color.fromARGB(255, 0, 60, 162),
                              ),
                              SizedBox(height: 4),
                              Text(
                                "Benzer Ürünler",
                                style: TextStyle(
                                  fontSize: 11,
                                  color: const Color.fromARGB(255, 0, 60, 162),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(color: Colors.blue.shade50),
                          ),
                          child: Column(
                            children: [
                              Image.asset(
                                "images/icons/comment.png",
                                width: 24,
                                height: 24,
                                color: const Color.fromARGB(255, 0, 60, 162),
                              ),
                              SizedBox(height: 4),
                              Text(
                                "Değerlendirmeler",
                                style: TextStyle(
                                  fontSize: 11,
                                  color: const Color.fromARGB(255, 0, 60, 162),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.blue.shade50,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.grey.shade200),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          spacing: 8,
                          children: [
                            Icon(
                              Icons.campaign_outlined,
                              size: 24,
                              color: const Color.fromARGB(255, 0, 51, 140),
                            ),
                            Text(
                              "Ürünün Kapmpanyaları",
                              style: TextStyle(
                                fontSize: 18,
                                color: const Color.fromARGB(255, 0, 51, 140),
                              ),
                              textAlign: TextAlign.start,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                        Divider(color: Colors.white, height: 20),
                        Text(
                          "Sepette İndirim! Kampanyası",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8),
                        Text(
                          "Başlangıç Tarihi: 01.01.2024 - 09:00",
                          style: TextStyle(fontSize: 12, color: Colors.black54),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "Bitiş Tarihi: 10.01.2024 - 09:00",
                          style: TextStyle(fontSize: 12, color: Colors.black54),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 12),
                ],
              ),
            ),
            Container(height: 24, color: Colors.grey.shade100),
            Padding(
              padding: EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Ürün Açıklaması", style: TextStyle(fontSize: 16)),
                  SizedBox(height: 16),
                  Text(
                    "Ürün Kodu: S4CT09Z8 - LQJ - Siyah Baskılı",
                    style: TextStyle(fontSize: 12, color: Colors.black54),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Desenli mikrofiber kumaş, hafif ve suya dayanıklıdır. Beli bağlama detayı ve iki yandan cepleriyle kullanışlı bir tasarıma sahiptir. Hem plajda hem de havuzda stil sahibi olmak için ideal bir seçimdir.",
                    style: TextStyle(fontSize: 12, color: Colors.black54),
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(height: 16),
                  Text("Manken Bilgisi", style: TextStyle(fontSize: 16)),
                  SizedBox(height: 8),
                  Text(
                    "Göğüs: 100 cm / Bel: 79 cm / Basen: 96 cm / Boy: 188 cm\nManken M beden ürün giyiyor",
                    style: TextStyle(fontSize: 12, color: Colors.black54),
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
            ),
            Divider(),
            ExpansionTile(
              title: Text("Ürün İçeriği ve Özellikleri"),
              shape: RoundedRectangleBorder(),
              childrenPadding: EdgeInsets.only(left: 16),
              expandedAlignment: Alignment.centerLeft,
              children: [
                Text(
                  """• Ana Kumaş: %15 ELASTAN %85 Polyester
• Astar: %100 Polyester
• Ürün Özellikleri:
• Satıcı: LC Waikiki
• Marka: LCW SWIMWEAR
• Ürün Tipi: Yüzme Şort
• Cinsiyet: Erkek
• Kalıp: Loose & Bol
• Kumaş: Mikrofiber
• Desen: Düz
• Uzunluk: Diz Altı
• Bel Fiti: Beli Lastikli""",
                  style: TextStyle(fontSize: 12, color: Colors.black54),
                  textAlign: TextAlign.start,
                ),
              ],
            ),
            Divider(),
            ExpansionTile(
              title: Text("İade ve Değişim"),
              shape: RoundedRectangleBorder(),
              expandedAlignment: Alignment.centerLeft,
              childrenPadding: EdgeInsets.only(left: 16),
              children: [
                Text(
                  "Satın aldığınız ürünü kullanılmamış olması halinde, orijinal ambalajıyla birlikte 120 gün içerisinde iade edebilirsiniz.",
                  style: TextStyle(fontSize: 12, color: Colors.black54),
                  textAlign: TextAlign.start,
                ),
              ],
            ),
            Divider(),
            ExpansionTile(
              title: Text("Mağaza Stok Durumu"),
              shape: RoundedRectangleBorder(),
            ),
            Divider(),
            SizedBox(height: 16),
            Padding(
              padding: EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "Ürün Değerlendirmeleri",
                        style: TextStyle(fontSize: 16),
                      ),
                      Spacer(),
                      Text(
                        "Tümünü Görüntüle",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.blue,
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 12,
                        color: Colors.blue,
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Text(
                        "${widget.urun.rate}.0",
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                      SizedBox(width: 8),
                      Row(
                        children: List.generate(5, (index) {
                          return Icon(
                            index < widget.urun.rate
                                ? Icons.star
                                : Icons.star_border_outlined,
                            size: 20,
                            color: Colors.black,
                          );
                        }),
                      ),
                      SizedBox(width: 4),
                      Text(
                        "| ${widget.urun.rateCount} Değerlendirme",
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
