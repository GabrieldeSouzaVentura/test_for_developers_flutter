import 'package:flutter/material.dart';
import 'package:flutter_good_burger/core/dependency_injection/di.dart';
import 'package:flutter_good_burger/core/data/local_data_base.dart';
import 'good_burger/presentation/pages/splash_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  setupDependencies();

  await LocalDataBase.database;

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Good Burger',
      theme: ThemeData(primarySwatch: Colors.red),
      home: SplashPage(),
    );
  }
}
