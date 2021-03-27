import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:rnd_get_x/app/data/model/post.dart';
import 'package:rnd_get_x/app/data/repository/post.dart';

class PostController extends GetxController {
  final PostRepository repository;

  final posts = <Post>[].obs;
  final savedPosts = <Post>[].obs;
  final isLoadingPosts = false.obs;

  PostController({@required this.repository}) : assert(repository != null);

  @override
  void onInit() async {
    await _getPosts();
    super.onInit();
  }

  Future<void> _getPosts() async {
    try {
      this.isLoadingPosts(true);
      var posts = await repository.getAll();
      this.posts(posts);
    } catch (e) {
      printError(info: e.toString());
    } finally {
      this.isLoadingPosts(false);
    }
  }

  savePost(Post post) {
    var x = repository.savePost(post);
  }
}
