import 'package:get/get.dart';
import 'package:rnd_get_x/app/data/model/album.dart';
import 'package:rnd_get_x/app/data/model/post.dart';
import 'package:rnd_get_x/app/data/repository/album.dart';
import 'package:meta/meta.dart';
import 'package:rnd_get_x/app/data/repository/post.dart';

class HomeController extends GetxController {
  final AlbumRepository albumRepository;
  final PostRepository postRepository;

  HomeController({
    @required this.albumRepository,
    @required this.postRepository,
  }) : assert(albumRepository != null);

  final albums = <Album>[].obs;
  final posts = <Post>[].obs;
  final savedPosts = <Post>[].obs;
  final isLoadingPosts = false.obs;

  @override
  void onInit() {
    printInfo(info: 'onInit()');
    _getAlbums();
    _getPosts();
    _getSavedPosts();
    super.onInit();
  }

  @override
  void onReady() {
    printInfo(info: 'Onready');
    super.onReady();
  }

  void _getAlbums() async {
    try {
      var albums = await albumRepository.getAll();
      this.albums.assignAll(albums);
    } catch (e) {}
  }

  void _getPosts() async {
    try {
      this.isLoadingPosts(true);
      var posts = await postRepository.getAll();
      this.posts(posts);
    } catch (e) {
      printError(info: e.toString());
    } finally {
      this.isLoadingPosts(false);
    }
  }

  void _getSavedPosts() async {
    var posts = await postRepository.getPosts();
    printInfo(info: 'Got posts ${posts.length}');
  }
}
