import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:productive/config/theme.dart';
import 'package:productive/firebase_options.dart';
import 'package:productive/pages/add_page.dart';
import 'package:productive/pages/home_page.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: primaryColor,
        appBarTheme: AppBarTheme(
          elevation: 0,
          backgroundColor: bgPageColor,
          iconTheme: IconThemeData(
            color: primaryColor,
          ),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/add': (context) => const AddPage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
