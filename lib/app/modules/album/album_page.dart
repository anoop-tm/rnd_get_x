import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rnd_get_x/app/modules/album/album_controller.dart';

class AlbumPage extends GetView<AlbumController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('AlbumPage')),
      body: Container(
        child: GetX<AlbumController>(
          builder: (_) {
            return _.isLoading.value
                ? Center(child: CircularProgressIndicator())
                : ListView.separated(
                    separatorBuilder: (context, index) => Divider(
                      height: 1,
                    ),
                    itemCount: _.albums.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        onTap: () {},
                        title: Text(_.albums[index].title),
                        subtitle: Text(index.toString()),
                      );
                    },
                  );
          },
        ),
      ),
    );
  }
}
