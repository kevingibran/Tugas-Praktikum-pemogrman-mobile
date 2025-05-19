import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../models/user_model.dart';
import 'register_page.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  String _error = '';

  void _login() async {
    final box = Hive.box<UserModel>('users');
    final users = box.values.toList();

    for (var user in users) {
      if (user.email == _emailController.text && user.password == _passwordController.text) {
        setState(() {
          _error = '';
        });
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => HomePage()));
        return;
      }
    }

    setState(() {
      _error = 'Invalid credentials';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(controller: _emailController, decoration: InputDecoration(labelText: 'Email')),
            TextField(controller: _passwordController, decoration: InputDecoration(labelText: 'Password'), obscureText: true),
            SizedBox(height: 10),
            if (_error.isNotEmpty) Text(_error, style: TextStyle(color: Colors.red)),
            SizedBox(height: 20),
            ElevatedButton(onPressed: _login, child: Text('Login')),
            TextButton(
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => RegisterPage())),
              child: Text('Don\'t have an account? Register'),
            ),
          ],
        ),
      ),
    );
  }
}
