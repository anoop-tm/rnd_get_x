import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rnd_get_x/app/modules/post/controller.dart';

class PostPage extends GetView<PostController> {
  final _random = new Random();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Posts ${controller.posts.length}')),
      body: Container(
        child: GetX<PostController>(
          builder: (_) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: GridView.builder(
                itemCount: _.posts.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 1,
                  crossAxisCount: 2,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                ),
                itemBuilder: (context, i) {
                  return GestureDetector(
                    onDoubleTap: () {
                      try {
                        var x = _.savePost(_.posts[i]);
                        Get.snackbar('Saved!', x.toString(),
                            snackPosition: SnackPosition.BOTTOM);
                      } catch (e) {
                        Get.snackbar('Error!', e.toString());
                        printError(info: e.toString());
                      }
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      color: _randomColor(),
                      elevation: 8,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            '${controller.posts[i].title}',
                            textAlign: TextAlign.center,
                            style: Get.textTheme.headline6
                                .copyWith(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }

  Color _randomColor() {
    var colors = [Colors.purple, Colors.green, Colors.amber[900], Colors.blue];
    return colors[_random.nextInt(4)];
  }
}
