import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:rnd_get_x/app/data/model/post.dart';

const baseUrl = 'https://jsonplaceholder.typicode.com/posts';

class PostApiClient {
  final Dio httpClient;
  PostApiClient({@required this.httpClient});

  getAll() async {
    try {
      var response = await httpClient.get(baseUrl);
      if (response.statusCode == 200) {
        var posts =
            (response.data as List).map((e) => Post.fromJson(e)).toList();
        return posts;
      } else
        print('erro -get');
    } catch (_) {}
  }
}
