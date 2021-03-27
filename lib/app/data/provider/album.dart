import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:rnd_get_x/app/data/model/album.dart';

class AlbumApiClient {
  final Dio httpClient;
  AlbumApiClient({@required this.httpClient});

  Future<List<Album>> getAll() async {
    try {
      var response = await httpClient.get('/albums');

      if (response.statusCode == 200) {
        List<Album> listAlbum = (response.data as List).map((map) {
          return Album.fromJson(map);
        }).toList();

        return listAlbum;
      } else
        return Future.value(<Album>[]);
    } catch (e) {
      printError(info: e.toString());
      return <Album>[];
    }
  }
}
// 
//    final response =
//           await Api.dio.post('/dashboard/GetEvents', queryParameters: params);
//       var events =
//           (response.data as List).map((e) => Event.fromJson(e)).toList();