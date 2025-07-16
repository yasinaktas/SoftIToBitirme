import 'package:clone_lcwaikiki/models/brand.dart';
import 'package:flutter/material.dart';


class BrandList extends StatefulWidget {
  final double height;
  final List<Brand> brands;
  const BrandList({super.key, required this.height, required this.brands});

  @override
  State<BrandList> createState() => _BrandListState();
}

class _BrandListState extends State<BrandList> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      child: ListView.builder(
        itemCount: widget.brands.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 20, right: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(2.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(color: Colors.grey.shade300, width: 1),
                    color: Colors.white,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.asset(
                      widget.brands[index].imageUrl,
                      width: widget.height * 0.5,
                      height: widget.height * 0.5,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                SizedBox(height: 4),
                Expanded(
                  child: Text(
                    widget.brands[index].name,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
