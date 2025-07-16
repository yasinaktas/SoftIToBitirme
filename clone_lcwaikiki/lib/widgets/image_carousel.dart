import 'package:flutter/material.dart';

class CustomImageCarousel extends StatefulWidget {
  final List<String> imageUrls;
  final double heightRatio;
  const CustomImageCarousel({
    super.key,
    required this.imageUrls,
    required this.heightRatio,
  });

  @override
  State<CustomImageCarousel> createState() => _CustomImageCarouselState();
}

class _CustomImageCarouselState extends State<CustomImageCarousel> {
  final controller = PageController();
  int currentPage = 0;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * widget.heightRatio,
      child: Stack(
        children: [
          PageView.builder(
            controller: controller,
            itemCount: widget.imageUrls.length,
            itemBuilder: (context, index) {
              return Image.asset(widget.imageUrls[index], fit: BoxFit.cover);
            },
            onPageChanged: (index) {
              setState(() {
                currentPage = index;
              });
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int i = 0; i < widget.imageUrls.length; i++)
                    Container(
                      margin: const EdgeInsets.all(4.0),
                      width: 8.0,
                      height: 8.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: currentPage == i
                            ? const Color.fromARGB(255, 0, 69, 188)
                            : Colors.grey.shade400,
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
