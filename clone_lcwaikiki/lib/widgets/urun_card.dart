import 'package:clone_lcwaikiki/models/global_state.dart';
import 'package:clone_lcwaikiki/models/urun.dart';
import 'package:flutter/material.dart';

class UrunCard extends StatefulWidget {
  final Urun urun;
  final bool long;
  final Function onFavoriteToggle;
  final Function onAddToCart;
  const UrunCard({
    super.key,
    required this.urun,
    required this.long,
    required this.onFavoriteToggle,
    required this.onAddToCart,
  });

  @override
  State<UrunCard> createState() => _UrunCardState();
}

class _UrunCardState extends State<UrunCard> {
  final PageController pageController = PageController(initialPage: 0);
  int selectedImg = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8, left: 4, right: 4),
      child: Column(
        children: [
          Expanded(
            flex: 8,
            child: Container(
              color: Colors.amber,
              child: Stack(
                children: [
                  PageView.builder(
                    controller: pageController,
                    onPageChanged: (index) {
                      setState(() {
                        selectedImg = index;
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
                          margin: EdgeInsets.only(bottom: 8, left: 2, right: 2),
                          width: 6,
                          height: 6,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: selectedImg == circleIndex
                                ? const Color.fromARGB(255, 0, 55, 151)
                                : Colors.grey.shade400,
                          ),
                        );
                      }),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      margin: EdgeInsets.all(8),
                      alignment: Alignment.center,
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            widget.onFavoriteToggle();
                          });
                        },
                        icon: Icon(
                          widget.urun.favorited
                              ? Icons.favorite
                              : Icons.favorite_border_outlined,
                        ),
                        color: widget.urun.favorited
                            ? Colors.red
                            : Colors.black,
                        iconSize: 20,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      margin: EdgeInsets.all(8),
                      alignment: Alignment.center,
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            widget.onAddToCart();
                          });
                        },
                        icon: Icon(
                          GlobalState.cart.contains(widget.urun)
                              ? Icons.shopping_bag
                              : Icons.shopping_bag_outlined,
                        ),
                        color: GlobalState.cart.contains(widget.urun)
                            ? Colors.blueAccent
                            : Colors.black,
                        iconSize: 20,
                      ),
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
                ],
              ),
            ),
          ),
          Expanded(
            flex: widget.long ? 3 : 6,
            child: Container(
              padding: EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(widget.urun.name, style: TextStyle(fontSize: 12)),
                  Text(
                    widget.urun.description,
                    style: TextStyle(fontSize: 11, color: Colors.black54),
                  ),
                  Spacer(),
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
                      Text(
                        " (${widget.urun.rateCount})",
                        style: TextStyle(fontSize: 11, color: Colors.black),
                      ),
                    ],
                  ),
                  Spacer(),
                  Text(
                    "${widget.urun.price} TL",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Spacer(),
                  Row(
                    children: [
                      Image.asset(
                        "images/icons/color.png",
                        width: 14,
                        height: 14,
                      ),
                      SizedBox(width: 8),
                      Text(
                        "${widget.urun.colorChoice} renk seçeneği",
                        style: TextStyle(fontSize: 11, color: Colors.black54),
                      ),
                    ],
                  ),
                  Spacer(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
