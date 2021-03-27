import 'package:meta/meta.dart';
import 'package:rnd_get_x/app/data/provider/post.dart';

class PostRepository {
  final PostApiClient apiClient;

  PostRepository({@required this.apiClient}) : assert(apiClient != null);

  getAll() {
    return apiClient.getAll();
  }
}
