import 'package:flutter/material.dart';
import 'package:ui_practice/apps/spotify/home.dart';
import 'package:ui_practice/styles/colors.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor: AppColor.spBlack,
          primaryColor: Colors.black,
          textTheme: const TextTheme(
            bodyMedium: TextStyle(color: Colors.white),
          ),
        ),
        home: const SpotifyHome(),
      );
}
