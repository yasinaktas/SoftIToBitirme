import 'package:clone_lcwaikiki/models/global_state.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  int _selectedOption = 0;
  bool _showPassword = false;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.onUnfocus,
      child: Column(
        children: [
          Row(
            children: [
              RadioMenuButton(
                value: 0,
                groupValue: _selectedOption,
                onChanged: (value) {
                  setState(() {
                    _selectedOption = value!;
                  });
                },
                child: Text(
                  "E-Posta",
                  style: TextStyle(
                    color: _selectedOption == 0 ? Colors.indigo : Colors.black,
                  ),
                ),
              ),
              Spacer(),
              RadioMenuButton(
                value: 1,
                groupValue: _selectedOption,
                onChanged: (value) {
                  setState(() {
                    _selectedOption = value!;
                  });
                },
                child: Text(
                  "Telefon",
                  style: TextStyle(
                    color: _selectedOption == 1 ? Colors.indigo : Colors.black,
                  ),
                ),
              ),
              Spacer(),
              Spacer(),
            ],
          ),
          SizedBox(height: 12),
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Bu alan zorunludur.";
              }
              if (_selectedOption == 0 && !EmailValidator.validate(value)) {
                return "Lütfen geçerli bir e-posta adresi giriniz.";
              }
              return null;
            },
            controller: _selectedOption == 0
                ? _emailController
                : _phoneController,
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
              hintText: _selectedOption == 0
                  ? "E-Posta Adresi"
                  : "0 (5__) ___ __ __",
              hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 14),
            ),
          ),
          SizedBox(height: 16),
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Lütfen şifre giriniz.";
              }
              if (value.length < 6) {
                return "Şifre en az 6 karakter olmalıdır.";
              }
              return null;
            },
            controller: _passwordController,
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
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {},
              child: Text(
                "Şifremi Unuttum",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
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
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      debugPrint(GlobalState.userEmail);
                      if (_selectedOption == 0 &&
                          _emailController.text.toString() ==
                              GlobalState.userEmail &&
                          GlobalState.userPassword ==
                              _passwordController.text.toString()) {
                        GlobalState.isLoggedIn = true;
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Giriş başarılı!")),
                        );
                        Navigator.pop(context);
                      } else if (_selectedOption == 1 &&
                          _phoneController.text == GlobalState.userPhone &&
                          GlobalState.userPassword ==
                              _passwordController.text) {
                        GlobalState.isLoggedIn = true;
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Giriş başarılı!")),
                        );
                        Navigator.pop(context);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Giriş bilgileri hatalı!")),
                        );
                        return;
                      }
                    }
                  },
                  child: Text(
                    "Giriş Yap",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 4),
          Center(
            child: Text(
              "veya",
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
                    "Üye Ol",
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
