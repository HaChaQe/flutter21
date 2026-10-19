import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login Page")),
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: _emailController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Bu alan boş bırakılamaz!';
                }
                return null;
              },
              decoration: InputDecoration(labelText: "E-posta"),
            ),
            TextFormField(
              controller: _passwordController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Bu alan boş bırakılamaz!';  
                }
                if (value.length < 6) {
                  return 'Şifre en az 6 karakter olmalı!';
                }
                return null;
                
              },
              decoration: InputDecoration(labelText: "Şifre"),
              obscureText: true,
            ),
            ElevatedButton(
              child: Text("Giriş Yap"),
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  try {
                    await FirebaseAuth.instance.signInWithEmailAndPassword(
                      email: _emailController.text,
                      password: _passwordController.text,
                    );
                    debugPrint("Giriş başarılı!");
                  } on FirebaseAuthException catch (e) {
                    debugPrint(e.code);
                  }
                }
              },
            ),
            ElevatedButton(
              child: Text("Çıkış Yap"),
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                debugPrint("Çıkış başarılı!");
              },
            )
          ],
        ),
      ),
    );
  }
}
