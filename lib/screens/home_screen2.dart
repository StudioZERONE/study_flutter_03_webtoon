import 'package:flutter/material.dart';
import 'package:study_flutter_03_webtoon/models/webtoon_model.dart';
import 'package:study_flutter_03_webtoon/services/api_service.dart';
import 'package:study_flutter_03_webtoon/widgets/webtoon_widget.dart';

class HomeScreen2 extends StatelessWidget {
  HomeScreen2({super.key});

  Future<List<WebtoonModel>> webtoons = ApiService().getTodaysToons();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
            // return ListView(
            //   children: [
            //     for (var webtoon in snapshot.data!) Text(webtoon.title)
            //   ],
            // );

            // return ListView.builder(
            //   scrollDirection: Axis.vertical,
            //   itemCount: snapshot.data!.length,
            //   itemBuilder: (context, index) {
            //     var webtoon = snapshot.data![index];
            //     print(index);
            //     return Text(webtoon.title);
            //   },
            // );

            // return ListView.separated(
            //   scrollDirection: Axis.horizontal,
            //   itemCount: snapshot.data!.length,
            //   itemBuilder: (context, index) {
            //     var webtoon = snapshot.data![index];
            //     print(index);
            //     return Text(webtoon.title);
            //   },
            //   separatorBuilder: (context, index) => const SizedBox(
            //     width: 20,
            //   ),
            // );

            // return makeList(snapshot);

            return Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Expanded(child: makeList(snapshot)),
              ],
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  ListView makeList(AsyncSnapshot<List<WebtoonModel>> snapshot) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: snapshot.data!.length,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      itemBuilder: (context, index) {
        var webtoon = snapshot.data![index];
        return Webtoon(
          title: webtoon.title,
          thumb: webtoon.thumb,
          id: webtoon.id,
        );
      },
      separatorBuilder: (context, index) => const SizedBox(
        width: 40,
      ),
    );
  }
}
