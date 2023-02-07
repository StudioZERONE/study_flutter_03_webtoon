import 'package:flutter/material.dart';
import 'package:study_flutter_03_webtoon/screens/home_screen2.dart';

void main() {
  // ApiService().getTodaysToons();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Webtoon App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen2(),
    );
  }
}
