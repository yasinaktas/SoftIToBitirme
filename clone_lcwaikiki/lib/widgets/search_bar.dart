import 'package:clone_lcwaikiki/models/global_state.dart';
import 'package:clone_lcwaikiki/pages/giris.dart';
import 'package:clone_lcwaikiki/pages/profil.dart';
import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  final double height;
  final bool showCamera;
  final bool showUserButton;
  const CustomSearchBar({
    super.key,
    this.height = 44,
    this.showCamera = true,
    this.showUserButton = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        spacing: 16,
        children: [
          Expanded(
            child: Container(
              height: height,
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                spacing: 12,
                children: [
                  SizedBox(),
                  Image.asset("images/icons/search.png", width: 16, height: 16),
                  Expanded(
                    child: Text(
                      "Ürün, kategori, marka ara",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                  Image.asset(
                    "images/icons/microphone.png",
                    width: 20,
                    height: 20,
                    color: Colors.black,
                  ),
                  Image.asset(
                    "images/icons/barcode.png",
                    width: 16,
                    height: 16,
                    color: Colors.black,
                  ),
                  if (showCamera)
                    Image.asset(
                      "images/icons/camera.png",
                      width: 20,
                      height: 20,
                      color: Colors.black,
                    ),
                  SizedBox(),
                ],
              ),
            ),
          ),
          if (showUserButton)
            InkWell(
              onTap: () {
                if (GlobalState.isLoggedIn == true) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Profil()),
                  );
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => GirisSayfasi()),
                  );
                }
              },
              child: Container(
                height: height,
                width: height,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 222, 237, 250),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Image.asset(
                  "images/icons/profile.png",
                  width: 24,
                  height: 24,
                  color: const Color.fromARGB(255, 0, 65, 163),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
