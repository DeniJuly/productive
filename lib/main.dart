import 'package:flutter/material.dart';
import 'package:productive/config/theme.dart';
import 'package:productive/pages/add_page.dart';
import 'package:productive/pages/home_page.dart';
import 'package:productive/provider/plan_provider.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => PlanProvider()),
      ],
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: primaryColor,
          accentColor: secondaryColor,
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
      ),
    );
  }
}
