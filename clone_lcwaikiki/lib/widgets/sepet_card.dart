import 'dart:math';

import 'package:clone_lcwaikiki/models/urun.dart';
import 'package:flutter/material.dart';

class SepetCard extends StatefulWidget {
  final Urun urun;
  final Function onFavoriteToggle;
  const SepetCard({
    super.key,
    required this.urun,
    required this.onFavoriteToggle,
  });

  @override
  State<SepetCard> createState() => _SepetCardState();
}

class _SepetCardState extends State<SepetCard> {
  bool _isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      padding: EdgeInsets.only(top: 16, bottom: 16, right: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Checkbox(
            value: _isSelected,
            onChanged: (value) {
              setState(() {
                _isSelected = value!;
              });
            },
          ),
          Image.asset(widget.urun.imaUrls[0], fit: BoxFit.fitHeight),
          SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.urun.name,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 4),
              Text(
                widget.urun.description.substring(
                  0,
                  min(20, widget.urun.description.length),
                ),
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
              Spacer(),
              Text(
                "Beden: M / Gri",
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
              Spacer(),
              Container(
                padding: EdgeInsets.symmetric(vertical: 2, horizontal: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Row(
                  spacing: 16,
                  children: [
                    Icon(Icons.delete_outline, size: 14),
                    Text("1"),
                    Icon(Icons.add, size: 14),
                  ],
                ),
              ),
            ],
          ),
          Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    widget.onFavoriteToggle();
                  });
                },
                icon: Icon(
                  widget.urun.favorited
                      ? Icons.favorite
                      : Icons.favorite_outline,
                  color: widget.urun.favorited ? Colors.red : Colors.black,
                ),
              ),
              Spacer(),
              Text(
                "${widget.urun.price.toInt()} TL",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
