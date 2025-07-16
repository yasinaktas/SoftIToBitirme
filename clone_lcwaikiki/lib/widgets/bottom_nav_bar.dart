import 'package:clone_lcwaikiki/models/global_state.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

class CustomBottomNavBar extends StatefulWidget {
  final double height;
  final double centerButtonSize;
  final int selectedIndex;
  final Function(int index) onItemSelected;
  bool isCenterButtonSelected;
  CustomBottomNavBar({
    super.key,
    this.height = 56,
    this.centerButtonSize = 72,
    this.selectedIndex = 0,
    required this.onItemSelected,
    required this.isCenterButtonSelected,
  });

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  final selectedColor = const Color.fromARGB(255, 0, 78, 142);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height + MediaQuery.of(context).padding.bottom,
      padding: EdgeInsets.only(top: 0),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 2,
            spreadRadius: 1,
            offset: Offset(0, -2),
          ),
        ],
      ),
      alignment: Alignment.topCenter,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              BottomNavMenuItem(
                height: widget.height * 0.8,
                title: "Ana Sayfa",
                icon: Icons.home_outlined,
                index: 0,
                onTap: (index) {
                  widget.onItemSelected(0);
                },
                isSelected: widget.selectedIndex == 0,
              ),
              BottomNavMenuItem(
                height: widget.height * 0.8,
                title: "Kategoriler",
                icon: Icons.menu,
                index: 1,
                onTap: (index) {
                  widget.onItemSelected(1);
                },
                isSelected: widget.selectedIndex == 1,
              ),
              Container(margin: EdgeInsets.symmetric(horizontal: 20)),
              BottomNavMenuItem(
                height: widget.height * 0.8,
                title: "Sepetim",
                icon: Icons.shopping_bag_outlined,
                index: 2,
                onTap: (index) {
                  widget.onItemSelected(2);
                },
                isSelected: widget.selectedIndex == 2,
              ),
              BottomNavMenuItem(
                height: widget.height * 0.8,
                title: "Favorilerim",
                icon: Icons.favorite_outline,
                index: 3,
                onTap: (index) {
                  widget.onItemSelected(3);
                },
                isSelected: widget.selectedIndex == 3,
              ),
            ],
          ),
          Positioned(
            top: -(widget.centerButtonSize / 2),
            left:
                MediaQuery.of(context).size.width / 2 -
                (widget.centerButtonSize / 2),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  widget.isCenterButtonSelected =
                      !widget.isCenterButtonSelected;
                  widget.onItemSelected(4);
                });
              },
              child: Container(
                width: widget.centerButtonSize,
                height: widget.centerButtonSize,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black,
                  border: Border.all(
                    color: Colors.white,
                    width: widget.centerButtonSize * 0.075,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 1,
                      spreadRadius: 0,
                      offset: Offset(0, -2),
                    ),
                  ],
                ),
                child: Icon(
                  widget.isCenterButtonSelected
                      ? Icons.close
                      : Icons.grid_view_rounded,
                  color: Colors.white,
                  size: widget.centerButtonSize * 0.55,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BottomNavMenuItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool isSelected;
  final int index;
  final Function(int index) onTap;
  final double height;
  const BottomNavMenuItem({
    super.key,
    required this.height,
    required this.title,
    required this.icon,
    this.isSelected = false,
    required this.index,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final selectedColor = const Color.fromARGB(255, 0, 78, 142);
    return InkWell(
      onTap: () {
        onTap(index);
      },
      child: Column(
        children: [
          isSelected
              ? Padding(
                  padding: const EdgeInsets.only(bottom: 5.0),
                  child: SizedBox(
                    width: height,
                    child: Divider(
                      radius: BorderRadius.circular(2),
                      color: selectedColor,
                      height: 3,
                      thickness: 3,
                    ),
                  ),
                )
              : SizedBox(height: 8),
          if (index == 0 || index == 1)
            Icon(icon, color: isSelected ? selectedColor : Colors.black),
          if (index == 2)
            badges.Badge(
              badgeStyle: badges.BadgeStyle(badgeColor: Colors.transparent),
              badgeContent: CircleAvatar(
                radius: 8,
                backgroundColor: const Color.fromARGB(255, 0, 50, 135),
                child: Text(
                  GlobalState.cart.length.toString(),
                  style: TextStyle(fontSize: 10, color: Colors.white),
                ),
              ),
              child: Icon(
                icon,
                color: isSelected ? selectedColor : Colors.black,
              ),
            ),
          if (index == 3)
            badges.Badge(
              badgeStyle: badges.BadgeStyle(badgeColor: Colors.transparent),
              badgeContent: CircleAvatar(
                radius: 8,
                backgroundColor: const Color.fromARGB(255, 0, 50, 135),
                child: Text(
                  GlobalState.favorites.length.toString(),
                  style: TextStyle(fontSize: 10, color: Colors.white),
                ),
              ),
              child: Icon(
                icon,
                color: isSelected ? selectedColor : Colors.black,
              ),
            ),
          Text(
            title,
            style: TextStyle(
              color: isSelected ? selectedColor : Colors.black,
              fontSize: 12,
              letterSpacing: 0,
            ),
          ),
        ],
      ),
    );
  }
}
