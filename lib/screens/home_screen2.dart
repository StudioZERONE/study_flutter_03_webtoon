import 'package:flutter/material.dart';
import 'package:study_flutter_03_webtoon/models/webtoon_model.dart';
import 'package:study_flutter_03_webtoon/services/api_service.dart';

class HomeScreen2 extends StatelessWidget {
  HomeScreen2({super.key});

  Future<List<WebtoonModel>> webtoons = ApiService().getTodaysToons();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: const Text(
          "Today's Toon",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.green,
        elevation: 3,
      ),
      body: FutureBuilder(
        future: webtoons,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const Text("There is data!");
          }
          return const Text('Loading...');
        },
      ),
    );
  }
}
