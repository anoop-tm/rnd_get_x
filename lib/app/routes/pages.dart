import 'package:get/get.dart';
import 'package:rnd_get_x/app/modules/album/album_binding.dart';
import 'package:rnd_get_x/app/modules/album/album_page.dart';
import 'package:rnd_get_x/app/modules/home/home_bindings.dart';
import 'package:rnd_get_x/app/modules/home/home_page.dart';
import 'package:rnd_get_x/app/modules/post/binding.dart';
import 'package:rnd_get_x/app/modules/post/page.dart';
part './routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(name: Routes.HOME, page: () => HomePage(), binding: HomeBinding()),
    GetPage(name: Routes.POST, page: () => PostPage(), binding: PostBinding()),
    GetPage(
        name: Routes.ALBUM, page: () => AlbumPage(), binding: AlbumBinding()),
  ];
}
