import 'package:clone_lcwaikiki/models/global_state.dart';
import 'package:flutter/material.dart';

class SifreDegistirme extends StatefulWidget {
  const SifreDegistirme({super.key});

  @override
  State<SifreDegistirme> createState() => _SifreDegistirmeState();
}

class _SifreDegistirmeState extends State<SifreDegistirme> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _mevcutSifreController = TextEditingController();
  final TextEditingController _yeniSifreController = TextEditingController();
  final TextEditingController _yeniSifreTekrarController =
      TextEditingController();
  bool _obscureTextMevcut = true;
  bool _obscureTextYeni = true;
  bool _obscureTextYeniTekrar = true;
  String mevcutSifre = "";
  String yeniSifre = "";
  String yeniSifreTekrar = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Şifre Değişikliğim", style: TextStyle(fontSize: 16)),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Divider(color: Colors.grey.shade200),
        ),
      ),
      body: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Mevcut Şifre*", style: TextStyle(fontSize: 14)),
              SizedBox(height: 10),
              TextFormField(
                controller: _mevcutSifreController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Mevcut şifre boş bırakılamaz';
                  }
                  if (value.length < 6) {
                    return 'Şifre en az 6 karakter olmalıdır';
                  }
                  return null;
                },
                onSaved: (value) {
                  setState(() {
                    mevcutSifre = value ?? "";
                  });
                },
                obscureText: _obscureTextMevcut,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade400),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade400),
                  ),
                  contentPadding: EdgeInsets.only(left: 12, right: 12),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade400),
                  ),
                  hintText: "Mevcut Şifre*",
                  hintStyle: TextStyle(
                    fontSize: 12,
                    color: Colors.grey.shade400,
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscureTextMevcut
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                    ),
                    iconSize: 20,
                    onPressed: () {
                      setState(() {
                        _obscureTextMevcut = !_obscureTextMevcut;
                      });
                    },
                  ),
                ),
              ),
              SizedBox(height: 16),
              Text("Yeni Şifre*", style: TextStyle(fontSize: 14)),
              SizedBox(height: 10),
              TextFormField(
                controller: _yeniSifreController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Mevcut şifre boş bırakılamaz';
                  }
                  if (value.length < 6) {
                    return 'Şifre en az 6 karakter olmalıdır';
                  }
                  return null;
                },
                onSaved: (value) {
                  setState(() {
                    yeniSifre = value ?? "";
                  });
                },
                obscureText: _obscureTextYeni,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade400),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade400),
                  ),
                  contentPadding: EdgeInsets.only(left: 12, right: 12),
                  border: OutlineInputBorder(),
                  hintText: "Yeni Şifre*",
                  hintStyle: TextStyle(
                    fontSize: 12,
                    color: Colors.grey.shade400,
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscureTextYeni
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                    ),
                    iconSize: 20,
                    onPressed: () {
                      setState(() {
                        _obscureTextYeni = !_obscureTextYeni;
                      });
                    },
                  ),
                ),
              ),
              SizedBox(height: 16),
              Text("Yeni Şifre Tekrarı*", style: TextStyle(fontSize: 14)),
              SizedBox(height: 10),
              TextFormField(
                controller: _yeniSifreTekrarController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Mevcut şifre boş bırakılamaz';
                  }
                  if (value.length < 6) {
                    return 'Şifre en az 6 karakter olmalıdır';
                  }
                  return null;
                },
                onSaved: (value) {
                  setState(() {
                    yeniSifreTekrar = value ?? "";
                  });
                },
                obscureText: _obscureTextYeniTekrar,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade400),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade400),
                  ),
                  contentPadding: EdgeInsets.only(left: 12, right: 12),
                  border: OutlineInputBorder(),
                  hintText: "Yeni Şifre Tekrarı*",
                  hintStyle: TextStyle(
                    fontSize: 12,
                    color: Colors.grey.shade400,
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscureTextYeniTekrar
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                    ),
                    iconSize: 20,
                    onPressed: () {
                      setState(() {
                        _obscureTextYeniTekrar = !_obscureTextYeniTekrar;
                      });
                    },
                  ),
                ),
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey.shade400,
                        padding: EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      onPressed: () {
                        _formKey.currentState?.save();
                        if (_formKey.currentState?.validate() == true) {
                          if (yeniSifre == yeniSifreTekrar &&
                              mevcutSifre == GlobalState.userPassword) {
                            GlobalState.userPassword = yeniSifre;
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  "Şifreniz başarıyla değiştirildi.",
                                ),
                              ),
                            );
                            Navigator.pop(context);
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  "Yeni şifreler eşleşmiyor veya mevcut şifreniz hatalı.",
                                ),
                              ),
                            );
                          }
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Lütfen tüm alanları doldurun."),
                            ),
                          );
                        }
                      },
                      child: Text(
                        "Kaydet",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
