import 'package:get/get.dart';
import 'package:rnd_get_x/app/data/provider/post.dart';
import 'package:rnd_get_x/app/data/provider/post_sql.dart';
import 'package:rnd_get_x/app/data/repository/post.dart';
import 'package:rnd_get_x/app/data/service/api.dart';
import 'package:rnd_get_x/app/data/service/sql.dart';
import 'package:rnd_get_x/app/modules/post/controller.dart';

class PostBinding implements Bindings {
  final SqlController _sqlController = Get.find();

  @override
  void dependencies() {
    Get.lazyPut<PostController>(
      () => PostController(
        repository: PostRepository(
          apiClient: PostApiClient(httpClient: Api.dio),
          sqlClient: PostSqlClient(database: _sqlController.db),
        ),
      ),
    );
  }
}
