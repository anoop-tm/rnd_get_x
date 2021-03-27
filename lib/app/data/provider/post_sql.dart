import 'package:flutter/material.dart';
import 'package:rnd_get_x/app/data/model/post.dart';
import 'package:sqflite/sqflite.dart';

class PostSqlClient {
  final Database database;
  PostSqlClient({@required this.database}) : assert(database != null);

  getPosts() async {
    var response = await database.query('post');
    var posts = (response).map((e) => Post.fromJson(e)).toList();
    return posts;
  }

  Future<dynamic> savePost(Post post) async {
    var x = await database.insert('post', post.toJson());
    return x;
  }

  deletePost(int id) async {
    var x = await database.delete('post', where: 'id = $id');
    print('> delete $x');
  }
}
