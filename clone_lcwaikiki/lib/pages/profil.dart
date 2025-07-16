import 'package:clone_lcwaikiki/models/global_state.dart';
import 'package:clone_lcwaikiki/pages/giris.dart';
import 'package:clone_lcwaikiki/pages/sifre_degistirme.dart';
import 'package:flutter/material.dart';

class Profil extends StatelessWidget {
  const Profil({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Profil",
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
      ),
      body: ListView(
        children: [
          Container(
            alignment: Alignment.bottomCenter,
            padding: EdgeInsets.only(left: 16, right: 16, top: 24),
            height: 100,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomLeft,
                colors: [
                  Colors.indigoAccent.shade100,
                  Colors.indigoAccent.shade700,
                ],
              ),
            ),
            child: Container(
              height: 80,
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
              ),
              child: Row(
                spacing: 12,
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 222, 237, 250),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Image.asset(
                      "images/icons/profile.png",
                      width: 32,
                      height: 32,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    "yasinaktasdev@gmail.com",
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ),
          ),
          Divider(
            height: 0,
            color: Colors.grey.shade200,
            indent: 24,
            endIndent: 24,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Icon(Icons.notifications_outlined, color: Colors.black),
                    SizedBox(height: 4),
                    Text(
                      "Bildirimlerim",
                      style: TextStyle(fontSize: 12, color: Colors.black),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Icon(Icons.favorite_outline_rounded, color: Colors.black),
                    SizedBox(height: 4),
                    Text(
                      "Favorilerim",
                      style: TextStyle(fontSize: 12, color: Colors.black),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Icon(Icons.discount_outlined, color: Colors.black),
                    SizedBox(height: 4),
                    Text(
                      "İndirimlerim",
                      style: TextStyle(fontSize: 12, color: Colors.black),
                    ),
                  ],
                ),
                Column(
                  children: [
                    CircleAvatar(
                      radius: 12,
                      backgroundColor: Colors.white,
                      child: Image.asset(
                        "images/kategori_orta/elsiva.png",
                        fit: BoxFit.cover,
                        width: 24,
                        height: 24,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "Elsiva",
                      style: TextStyle(fontSize: 12, color: Colors.black),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Divider(color: Colors.grey.shade200, height: 0),
          ListTile(
            leading: Icon(Icons.shopping_bag_outlined),
            title: Text(
              "Siparişlerim / İadelerim",
              style: TextStyle(fontSize: 14),
            ),
            trailing: Icon(Icons.arrow_forward_ios, size: 16),
          ),
          Divider(
            color: Colors.grey.shade200,
            height: 0,
            indent: 16,
            endIndent: 16,
          ),
          ListTile(
            leading: Icon(Icons.person_outline),
            title: Text("Kullanıcı Bilgilerim", style: TextStyle(fontSize: 14)),
            trailing: Icon(Icons.arrow_forward_ios, size: 16),
          ),
          Divider(
            color: Colors.grey.shade200,
            height: 0,
            indent: 16,
            endIndent: 16,
          ),
          ListTile(
            leading: Icon(Icons.location_pin),
            title: Text("Adreslerim", style: TextStyle(fontSize: 14)),
            trailing: Icon(Icons.arrow_forward_ios, size: 16),
          ),
          Divider(
            color: Colors.grey.shade200,
            height: 0,
            indent: 16,
            endIndent: 16,
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SifreDegistirme()),
              );
            },
            leading: Icon(Icons.lock_outline),
            title: Text("Şifre Değişikliğim", style: TextStyle(fontSize: 14)),
            trailing: Icon(Icons.arrow_forward_ios, size: 16),
          ),
          Divider(
            color: Colors.grey.shade200,
            height: 0,
            indent: 16,
            endIndent: 16,
          ),
          ListTile(
            leading: Icon(Icons.star_rate_outlined),
            title: Text("Değerlendirmelerim", style: TextStyle(fontSize: 14)),
            trailing: Icon(Icons.arrow_forward_ios, size: 16),
          ),
          Divider(
            color: Colors.grey.shade200,
            height: 0,
            indent: 16,
            endIndent: 16,
          ),
          ListTile(
            leading: Icon(Icons.money),
            title: Text("Önceden Aldıklarım", style: TextStyle(fontSize: 14)),
            trailing: Icon(Icons.arrow_forward_ios, size: 16),
          ),
          Divider(
            color: Colors.grey.shade200,
            height: 0,
            indent: 16,
            endIndent: 16,
          ),
          ListTile(
            leading: Icon(Icons.filter_list),
            title: Text("Kayıtlı Filtrelerim", style: TextStyle(fontSize: 14)),
            trailing: Icon(Icons.arrow_forward_ios, size: 16),
          ),
          Divider(
            color: Colors.grey.shade200,
            height: 0,
            indent: 16,
            endIndent: 16,
          ),
          ListTile(
            leading: Icon(Icons.wallet),
            title: Text("LCW Cüzdanım", style: TextStyle(fontSize: 14)),
            trailing: Icon(Icons.arrow_forward_ios, size: 16),
          ),
          Divider(
            color: Colors.grey.shade200,
            height: 0,
            indent: 16,
            endIndent: 16,
          ),
          ListTile(
            leading: Icon(Icons.card_membership),
            title: Text("Kayıtlı Kartlarım", style: TextStyle(fontSize: 14)),
            trailing: Icon(Icons.arrow_forward_ios, size: 16),
          ),
          Divider(
            color: Colors.grey.shade200,
            height: 0,
            indent: 16,
            endIndent: 16,
          ),
          ListTile(
            leading: Icon(Icons.card_giftcard),
            title: Text("Hediye Kartım", style: TextStyle(fontSize: 14)),
            trailing: Icon(Icons.arrow_forward_ios, size: 16),
          ),
          Divider(
            color: Colors.grey.shade200,
            height: 0,
            indent: 16,
            endIndent: 16,
          ),
          ListTile(
            leading: Icon(Icons.help_outline),
            title: Text("Yardım", style: TextStyle(fontSize: 14)),
            trailing: Icon(Icons.arrow_forward_ios, size: 16),
          ),
          Divider(
            color: Colors.grey.shade200,
            height: 0,
            indent: 16,
            endIndent: 16,
          ),
          ListTile(
            onTap: () {
              GlobalState.isLoggedIn = false;
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => GirisSayfasi()),
              );
            },
            leading: Icon(Icons.logout),
            title: Text("Çıkış Yap", style: TextStyle(fontSize: 14)),
            trailing: Icon(Icons.arrow_forward_ios, size: 16),
          ),
          Divider(
            color: Colors.grey.shade200,
            height: 0,
            indent: 16,
            endIndent: 16,
          ),
          SizedBox(height: 4),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "LCW Destek",
                  style: TextStyle(fontSize: 16, color: Colors.black),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 12),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(color: Colors.green.shade100),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 8,
                    children: [
                      Image.asset(
                        "images/icons/whatsapp.png",
                        width: 24,
                        height: 24,
                      ),
                      Text(
                        "Wahtsapp Destek 444 4 529",
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 12),
                Row(
                  spacing: 8,
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(color: Colors.grey.shade300),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          spacing: 8,
                          children: [
                            Icon(Icons.insert_drive_file_outlined),
                            Text(
                              "İletişim Formu",
                              style: TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(color: Colors.grey.shade300),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          spacing: 8,
                          children: [
                            Icon(Icons.phone_outlined),
                            Text("444 4 529", style: TextStyle(fontSize: 12)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Text(
                  "Engelsiz İletişim LCW.COM'da!",
                  style: TextStyle(fontSize: 16, color: Colors.black),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 12),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(color: Colors.blueAccent.shade100),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 8,
                    children: [
                      Icon(
                        Icons.sign_language_outlined,
                        color: Colors.blueAccent,
                      ),
                      Text(
                        "İşaret Dili Hizmeti",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.blueAccent,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
