import 'package:get/get.dart';
import 'package:rnd_get_x/app/data/provider/album.dart';
import 'package:rnd_get_x/app/data/repository/album.dart';
import 'package:rnd_get_x/app/data/service/api.dart';
import 'package:rnd_get_x/app/modules/album/album_controller.dart';

class AlbumBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AlbumController>(() => AlbumController(
        repository:
            AlbumRepository(apiClient: AlbumApiClient(httpClient: Api.dio))));
  }
}
