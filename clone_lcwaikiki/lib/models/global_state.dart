import 'package:clone_lcwaikiki/helper/urun_generator.dart';
import 'package:clone_lcwaikiki/models/urun.dart';

class GlobalState {
  static bool isLoggedIn = true;
  static String userEmail = "yasin@gmail.com";
  static String userPhone = "05457661950";
  static String userPassword = "123456";
  static List<Urun> products = UrunGenerator().generateRandomUrunList(100);
  static List<Urun> cart = [];
  static List<Urun> favorites = [];
}
