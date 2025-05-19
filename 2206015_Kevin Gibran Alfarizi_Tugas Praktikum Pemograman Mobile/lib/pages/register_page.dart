import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../models/user_model.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void _register() async {
    final box = Hive.box<UserModel>('users');
    final newUser = UserModel(
      username: _usernameController.text,
      email: _emailController.text,
      password: _passwordController.text,
    );
    await box.add(newUser);

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Registration successful')));
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Register')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(controller: _usernameController, decoration: InputDecoration(labelText: 'Username')),
            TextField(controller: _emailController, decoration: InputDecoration(labelText: 'Email')),
            TextField(controller: _passwordController, decoration: InputDecoration(labelText: 'Password'), obscureText: true),
            SizedBox(height: 20),
            ElevatedButton(onPressed: _register, child: Text('Register')),
          ],
        ),
      ),
    );
  }
}
