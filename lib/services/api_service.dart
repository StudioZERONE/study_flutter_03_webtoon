import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:study_flutter_03_webtoon/models/webtoon_detail_model.dart';
import 'package:study_flutter_03_webtoon/models/webtoon_episode_model.dart';
import 'package:study_flutter_03_webtoon/models/webtoon_model.dart';

class ApiService {
  static const String baseUrl =
      'https://webtoon-crawler.nomadcoders.workers.dev';
  static const String today = 'today';

  static Future<List<WebtoonModel>> getTodaysToons() async {
    List<WebtoonModel> webtoonInstances = [];

    final url = Uri.parse('$baseUrl/$today');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      // print(response.body);
      // flutter: [
      // {"title":"장씨세가 호위무사","thumb":"https://shared-comic.pstatic.net/thumb/webtoon/728750/thumbnail/thumbnail_IMAG21_47c21251-b213-4882-bacc-15adce1acfc8.jpg","id":"728750"},
      // {"title":"윈드브레이커","thumb":"https://shared-comic.pstatic.net/thumb/webtoon/602910/thumbnail/thumbnail_IMAG21_e861f2cf-6157-4d33-8e02-7b4cbf0a8baf.jpg","id":"602910"},
      // {"title":"소녀의 세계","thumb":"https://shared-comic.pstatic.net/thumb/webtoon/654774/thumbnail/thumbnail_IMAG21_4048794550434817075.jpg","id":"654774"}
      // ]
      final List<dynamic> webtoons = jsonDecode(response.body);
      for (var webtoon in webtoons) {
        // print(webtoon);
        // flutter: {title: 장씨세가 호위무사, thumb: https://shared-comic.pstatic.net/thumb/webtoon/728750/thumbnail/thumbnail_IMAG21_47c21251-b213-4882-bacc-15adce1acfc8.jpg, id: 728750}
        // flutter: {title: 윈드브레이커, thumb: https://shared-comic.pstatic.net/thumb/webtoon/602910/thumbnail/thumbnail_IMAG21_e861f2cf-6157-4d33-8e02-7b4cbf0a8baf.jpg, id: 602910}
        // flutter: {title: 소녀의 세계, thumb: https://shared-comic.pstatic.net/thumb/webtoon/654774/thumbnail/thumbnail_IMAG21_4048794550434817075.jpg, id: 654774}

        // final toon = WebtoonModel.fromJson(webtoon);
        // print(toon.title);
        // flutter: 장씨세가 호위무사
        // flutter: 윈드브레이커
        // flutter: 소녀의 세계

        webtoonInstances.add(WebtoonModel.fromJson(webtoon));
      }
      return webtoonInstances;
    }
    throw Error();
  }

  static Future<WebtoonDetailModel> getToonById(String id) async {
    final url = Uri.parse("$baseUrl/$id");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final webtoon = jsonDecode(response.body);
      return WebtoonDetailModel.fromJson(webtoon);
    }
    throw Error();
  }

  static Future<List<WebtoonEpisodeModel>> getLatestEpisodesById(
      String id) async {
    List<WebtoonEpisodeModel> episodesInstances = [];
    final url = Uri.parse("$baseUrl/$id/episodes");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final episodes = jsonDecode(response.body);
      for (var episode in episodes) {
        episodesInstances.add(WebtoonEpisodeModel.fromJson(episode));
      }
      return episodesInstances;
    }
    throw Error();
  }
}
