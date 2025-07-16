import 'package:clone_lcwaikiki/helper/urun_generator.dart';
import 'package:clone_lcwaikiki/models/global_state.dart';
import 'package:clone_lcwaikiki/models/urun.dart';
import 'package:clone_lcwaikiki/pages/urun_detay.dart';
import 'package:clone_lcwaikiki/widgets/urun_card.dart';
import 'package:flutter/material.dart';

class Urunler extends StatefulWidget {
  const Urunler({super.key});

  @override
  State<Urunler> createState() => _UrunlerState();
}

class _UrunlerState extends State<Urunler> {
  final List<Urun> urunler = GlobalState.products;
  int gridCount = 2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Column(
          children: [
            Text("İndirimli Ürünler", style: TextStyle(fontSize: 18)),
            Text(
              "12.066 ürün",
              style: TextStyle(color: Colors.black38, fontSize: 13),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Image.asset("images/icons/search.png", width: 20, height: 20),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                gridCount = 3 - gridCount;
              });
            },
            icon: Icon(
              gridCount == 2 ? Icons.grid_view_outlined : Icons.square_outlined,
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Divider(color: Colors.grey.shade300),
        ),
      ),
      body: Column(
        children: [
          Container(
            height: 40,
            alignment: Alignment.center,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "images/icons/filter.png",
                          width: 20,
                          height: 20,
                        ),
                        SizedBox(width: 16),
                        Text(
                          "Filtrele",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(child: VerticalDivider(color: Colors.grey.shade300)),
                Expanded(
                  child: InkWell(
                    onTap: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "images/icons/sort.png",
                          width: 20,
                          height: 20,
                        ),
                        SizedBox(width: 16),
                        Text(
                          "Sırala",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Divider(color: Colors.grey.shade300),
          SizedBox(
            height: 50,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                const SizedBox(width: 16),
                ChoiceChip(
                  selected: false,
                  onSelected: (value) {},
                  label: Text(
                    "LC WAIKIKI",
                    style: TextStyle(
                      color: const Color.fromARGB(255, 0, 57, 156),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(color: Colors.grey.shade200),
                  ),
                ),
                const SizedBox(width: 10),
                ChoiceChip(
                  selected: false,
                  onSelected: (value) {},
                  label: Text("Tişört"),
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(color: Colors.grey.shade200),
                  ),
                ),
                const SizedBox(width: 10),
                ChoiceChip(
                  selected: false,
                  onSelected: (value) {},
                  label: Text("Gömlek"),
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(color: Colors.grey.shade200),
                  ),
                ),
                const SizedBox(width: 10),
                ChoiceChip(
                  selected: false,
                  onSelected: (value) {},
                  label: Text("Kazak"),
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(color: Colors.grey.shade200),
                  ),
                ),
                const SizedBox(width: 10),
                ChoiceChip(
                  selected: false,
                  onSelected: (value) {},
                  label: Text("Pantolon"),
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(color: Colors.grey.shade200),
                  ),
                ),
                const SizedBox(width: 10),
                ChoiceChip(
                  selected: false,
                  onSelected: (value) {},
                  label: Text("Elbise"),
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(color: Colors.grey.shade200),
                  ),
                ),
                const SizedBox(width: 16),
              ],
            ),
          ),
          SizedBox(height: 8),
          Expanded(
            child: GridView.builder(
              itemCount: urunler.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: gridCount,
                childAspectRatio: gridCount == 2 ? 2 / 5 : 2 / 4,
              ),
              itemBuilder: (context, index) {
                final urun = urunler[index];
                return InkWell(
                  onTap: () async {
                    Urun guncelUrun = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UrunDetay(urun: urun),
                      ),
                    );
                    setState(() {
                      // Update the product in the list if it was modified
                      urunler[index] = guncelUrun;
                    });
                  },
                  child: UrunCard(
                    urun: urun,
                    long: gridCount != 2,
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
                    onAddToCart: () {
                      setState(() {
                        if (GlobalState.cart.contains(urun)) {
                          GlobalState.cart.remove(urun);
                        } else {
                          GlobalState.cart.add(urun);
                        }
                      });
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
