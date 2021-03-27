import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rnd_get_x/app/routes/pages.dart';

import 'home_controller.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('HomePage')),
      body: Container(
        width: Get.width,
        child: GetX<HomeController>(builder: (_) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _InfoCard(
                title: 'Albums',
                info: _.albums.length.toString(),
                isLoading: false,
                route: Routes.ALBUM,
              ),
              SizedBox(
                height: 30,
              ),
              _InfoCard(
                title: 'Posts',
                info: controller.posts.length.toString(),
                isLoading: controller.isLoadingPosts.value,
                route: Routes.POST,
              ),
            ],
          );
        }),
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  final String title;
  final String info;
  final bool isLoading;
  final String route;
  const _InfoCard({
    this.title,
    this.info,
    this.isLoading,
    this.route,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(route),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        clipBehavior: Clip.antiAlias,
        elevation: 6,
        borderOnForeground: true,
        child: Container(
          height: 150,
          width: Get.width / 2 - 10,
          child: Column(
            children: [
              Container(
                height: 50,
                width: Get.width,
                color: Colors.blueAccent,
                child: Center(
                  child: Text(
                    title,
                    style:
                        Get.textTheme.headline5.copyWith(color: Colors.white),
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: isLoading
                      ? CircularProgressIndicator()
                      : Text(
                          info,
                          style: Get.textTheme.headline2
                              .copyWith(color: Colors.grey),
                        ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
