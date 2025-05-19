import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'models/user_model.dart';
import 'pages/introduction_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(UserModelAdapter());
  await Hive.openBox<UserModel>('users');

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News Hive',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: IntroductionPage(),
    );
  }
}
