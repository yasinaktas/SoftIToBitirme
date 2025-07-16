import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  bool _showPassword = false;
  Timer? _timer;
  final PageController _controller = PageController();
  int _currentCard = 0;
  bool isEmailSelected = false;
  bool isSmsSelected = false;
  bool isCallSelected = false;
  bool isSozlesmeSelected = false;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 3), (timer) {
      setState(() {
        _currentCard = (_currentCard + 1) % 3;
        _controller.jumpToPage(_currentCard);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.onUnfocus,
      child: Column(
        children: [
          Center(child: Text("Neden Üye Olmalısın?")),
          SizedBox(height: 16),
          Container(
            height: 56,
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.blue.shade50,
              borderRadius: BorderRadius.circular(4),
            ),
            child: PageView(
              controller: _controller,
              onPageChanged: (value) {
                setState(() {
                  _currentCard = value;
                });
              },
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 12,
                  children: [
                    Icon(
                      Icons.notifications_outlined,
                      color: const Color.fromARGB(255, 0, 47, 127),
                    ),
                    Flexible(
                      child: Text(
                        "İndirimlerden Öncelikli Haberdar Olma Fırsatı",
                        style: TextStyle(
                          color: const Color.fromARGB(255, 0, 47, 127),
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 12,
                  children: [
                    Icon(
                      FontAwesomeIcons.gift,
                      size: 20,
                      color: const Color.fromARGB(255, 0, 47, 127),
                    ),
                    Flexible(
                      child: Text(
                        "İlk Siparişe Kargo Bedava",
                        style: TextStyle(
                          color: const Color.fromARGB(255, 0, 47, 127),
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 12,
                  children: [
                    Icon(
                      Icons.credit_card_outlined,
                      color: const Color.fromARGB(255, 0, 47, 127),
                    ),
                    Flexible(
                      child: Text(
                        "Kapıda Nakit Ödeme Seçeneği",
                        style: TextStyle(
                          color: const Color.fromARGB(255, 0, 47, 127),
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              3,
              (index) => Container(
                width: 6,
                height: 6,
                margin: EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  color: _currentCard == index
                      ? const Color.fromARGB(255, 0, 47, 127)
                      : Colors.grey.shade400,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
          SizedBox(height: 24),
          TextFormField(
            controller: _emailController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Bu alan zorunludur.";
              }
              return null;
            },
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 12),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade400),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade400),
              ),
              hintText: "E-Posta Adresi",
              hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 14),
            ),
          ),
          SizedBox(height: 16),
          TextFormField(
            controller: _passwordController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Lütfen şifre giriniz.";
              }
              return null;
            },
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 12),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade400),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade400),
              ),
              hintText: "Şifre",
              hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 14),
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    _showPassword = !_showPassword;
                  });
                },
                icon: Icon(
                  _showPassword
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                  size: 20,
                  color: Colors.black54,
                ),
              ),
            ),
            obscureText: !_showPassword,
          ),
          SizedBox(height: 16),
          TextFormField(
            controller: _phoneController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Bu alan zorunludur.";
              }
              return null;
            },
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 12),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade400),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade400),
              ),
              hintText: "0 (5__) ___ __ __",
              hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 14),
            ),
          ),
          SizedBox(height: 24),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: Text(
                  "Aşağıdaki yöntemlerden birkaçını seçerek bize iletişim izni vermek ister misiniz?",
                  style: TextStyle(fontSize: 10),
                ),
              ),
              Icon(Icons.info_outline, size: 16),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CheckboxMenuButton(
                style: ButtonStyle(
                  padding: WidgetStateProperty.all<EdgeInsets>(
                    EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                  ),
                ),
                value: isEmailSelected,
                onChanged: (value) {
                  setState(() {
                    isEmailSelected = !isEmailSelected;
                  });
                },
                child: Text(
                  "E-Posta",
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                ),
              ),
              CheckboxMenuButton(
                style: ButtonStyle(
                  padding: WidgetStateProperty.all<EdgeInsets>(
                    EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                  ),
                ),
                value: isSmsSelected,
                onChanged: (value) {
                  setState(() {
                    isSmsSelected = !isSmsSelected;
                  });
                },
                child: Text(
                  "SMS",
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                ),
              ),
              CheckboxMenuButton(
                style: ButtonStyle(
                  padding: WidgetStateProperty.all<EdgeInsets>(
                    EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                  ),
                ),
                value: isCallSelected,
                onChanged: (value) {
                  setState(() {
                    isCallSelected = !isCallSelected;
                  });
                },
                child: Text(
                  "Arama",
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                ),
              ),
            ],
          ),
          CheckboxMenuButton(
            style: ButtonStyle(
              padding: WidgetStateProperty.all<EdgeInsets>(
                EdgeInsets.symmetric(horizontal: 0, vertical: 0),
              ),
            ),
            value: isSozlesmeSelected,
            onChanged: (value) {
              setState(() {
                isSozlesmeSelected = !isSozlesmeSelected;
              });
            },
            child: RichText(
              text: TextSpan(
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Colors.black54,
                ),
                children: [
                  TextSpan(
                    text: "Kullanım ve Gizlilik Sözleşmesini",
                    style: TextStyle(
                      color: const Color.fromARGB(255, 0, 47, 127),
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  TextSpan(text: " okudum,\nonaylıyorum."),
                ],
              ),
            ),
          ),
          SizedBox(height: 8),
          Align(
            alignment: Alignment.centerLeft,
            child: RichText(
              text: TextSpan(
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Colors.black54,
                ),
                children: [
                  TextSpan(text: "Kişisel verileriniz, "),
                  TextSpan(
                    text: "Aydınlatma Metinleri",
                    style: TextStyle(
                      color: const Color.fromARGB(255, 0, 47, 127),
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  TextSpan(text: " kapsamında\nişlenmektedir."),
                ],
              ),
            ),
          ),
          SizedBox(height: 24),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: const Color.fromARGB(255, 0, 47, 127),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  onPressed: () {},
                  child: Text("Üye Ol", style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Center(
            child: Text(
              "veya hesabınız varsa",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
            ),
          ),
          SizedBox(height: 4),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: const Color.fromARGB(255, 0, 47, 127),
                      ),
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    "Giriş Yap",
                    style: TextStyle(
                      color: const Color.fromARGB(255, 0, 47, 127),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
