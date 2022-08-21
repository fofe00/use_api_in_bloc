import 'dart:convert';

import 'package:http/http.dart';

Post postFromJson(String str) => Post.fromJson(json.decode(str));

String postToJson(Post data) => json.encode(data.toJson());

List<Post> listpostFromJson(String str) =>
    List<Post>.from(json.decode(str).map((x) => Post.fromJson(x)));

String listpostToJson(List<Post> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Post {
  Post({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  int userId;
  int id;
  String title;
  String body;

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
      };
}

class PostService {
  Future<Post> getPost() async {
    final response =
        await get(Uri.parse("https://jsonplaceholder.typicode.com/posts/1"));
    final post = postFromJson(response.body);
    return post;
  }

  Future<List<Post>> getPosts() async {
    final response =
        await get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
    final posts = listpostFromJson(response.body);
    return posts;
  }
}
