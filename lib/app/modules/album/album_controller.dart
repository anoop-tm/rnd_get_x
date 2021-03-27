import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:rnd_get_x/app/data/model/album.dart';
import 'package:rnd_get_x/app/data/repository/album.dart';

class AlbumController extends GetxController {
  final AlbumRepository repository;
  AlbumController({@required this.repository}) : assert(repository != null);

  final albums = <Album>[].obs;
  final isLoading = false.obs;

  @override
  void onInit() async {
    super.onInit();
    isLoading(true);
    var albums = await repository.getAll();
    this.albums(albums);
    isLoading(false);
  }
}
