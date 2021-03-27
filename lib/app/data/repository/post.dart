import 'package:meta/meta.dart';
import 'package:rnd_get_x/app/data/model/post.dart';
import 'package:rnd_get_x/app/data/provider/post.dart';
import 'package:rnd_get_x/app/data/provider/post_sql.dart';

class PostRepository {
  final PostApiClient apiClient;
  final PostSqlClient sqlClient;

  PostRepository({@required this.apiClient, this.sqlClient})
      : assert(apiClient != null);

  getAll() {
    return apiClient.getAll();
  }

  getPosts() {
    return sqlClient.getPosts();
  }

  savePost(Post post) {
    return sqlClient.savePost(post);
  }

  deletePostLocally(int id) {
    return sqlClient.deletePost(id);
  }
}
