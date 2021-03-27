import 'package:get/get.dart';
import 'package:rnd_get_x/app/data/provider/album.dart';
import 'package:rnd_get_x/app/data/provider/post.dart';
import 'package:rnd_get_x/app/data/provider/post_sql.dart';
import 'package:rnd_get_x/app/data/repository/album.dart';
import 'package:rnd_get_x/app/data/repository/post.dart';
import 'package:rnd_get_x/app/data/service/api.dart';
import 'package:rnd_get_x/app/data/service/sql.dart';
import 'package:rnd_get_x/app/modules/home/home_controller.dart';

class HomeBinding implements Bindings {
  final SqlController _sqlController = Get.find();
  @override
  void dependencies() {
    if (_sqlController.db == null) throw 'Pettu mone..';
    Get.lazyPut<HomeController>(
      () => HomeController(
        postRepository: PostRepository(
          sqlClient: PostSqlClient(database: _sqlController.db),
          apiClient: PostApiClient(httpClient: Api.dio),
        ),
        albumRepository: AlbumRepository(
          apiClient: AlbumApiClient(httpClient: Api.dio),
        ),
      ),
    );
  }
}
