class Urun {
  final String name;
  final String description;
  final double price;
  final int rate;
  final int rateCount;
  final int colorChoice;
  int? coupon;
  final List<String> imaUrls;
  bool favorited;

  Urun({
    required this.name,
    required this.description,
    required this.price,
    required this.rate,
    required this.rateCount,
    required this.colorChoice,
    this.coupon,
    required this.imaUrls,
    this.favorited = false,
  });
}
