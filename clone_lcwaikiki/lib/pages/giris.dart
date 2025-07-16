import 'package:clone_lcwaikiki/pages/login.dart';
import 'package:clone_lcwaikiki/pages/register.dart';
import 'package:flutter/material.dart';

class GirisSayfasi extends StatefulWidget {
  const GirisSayfasi({super.key});

  @override
  State<GirisSayfasi> createState() => _GirisSayfasiState();
}

class _GirisSayfasiState extends State<GirisSayfasi> {
  int _selectedIndex = 0;
  List<Widget> _pages = [Login(), Register()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Profil", style: TextStyle(fontSize: 18)),
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
              padding: EdgeInsets.only(left: 8, right: 8, top: 8, bottom: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedIndex = 0;
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 76,
                        decoration: BoxDecoration(
                          color: _selectedIndex == 0
                              ? Colors.white
                              : Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          "Giriş Yap",
                          style: TextStyle(
                            color: _selectedIndex == 0
                                ? const Color.fromARGB(255, 0, 51, 139)
                                : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedIndex = 1;
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 76,
                        decoration: BoxDecoration(
                          color: _selectedIndex == 1
                              ? Colors.white
                              : Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          "Üye Ol",
                          style: TextStyle(
                            color: _selectedIndex == 1
                                ? const Color.fromARGB(255, 0, 51, 139)
                                : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16),
            padding: EdgeInsets.only(left: 24, right: 24, bottom: 20, top: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(8),
                bottomRight: Radius.circular(8),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade300,
                  blurRadius: 1,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: _pages[_selectedIndex],
          ),
          SizedBox(height: 16),
          ListTile(
            leading: Icon(Icons.local_shipping_outlined),
            title: Text("Sipaiş Takip", style: TextStyle(fontSize: 14)),
            trailing: Icon(Icons.arrow_forward_ios, size: 16),
          ),
          Divider(indent: 16, endIndent: 16, color: Colors.grey.shade200),
          ListTile(
            leading: Icon(Icons.help_outline),
            title: Text("Yardım", style: TextStyle(fontSize: 14)),
            trailing: Icon(Icons.arrow_forward_ios, size: 16),
          ),
          Divider(indent: 16, endIndent: 16, color: Colors.grey.shade200),
          Padding(
            padding: const EdgeInsets.all(16.0),
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
