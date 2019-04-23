import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HttpDemo extends StatefulWidget {
  @override
  _HttpDemoState createState() => _HttpDemoState();
}

class _HttpDemoState extends State<HttpDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HttpDemo'),
        elevation: 4.0,
      ),
      body: HttpDemoHome(),
    );
  }
}

class HttpDemoHome extends StatefulWidget {
  @override
  _HttpDemoHomeState createState() => _HttpDemoHomeState();
}

class _HttpDemoHomeState extends State<HttpDemoHome> {
  @override
  void initState() {
    super.initState();
    fetchPosts().then((value) => print("aaa: $value"));
//    final post = {
//      'title': 'hello',
//      'description': 'hhhhhh',
//    };
//    print(post['title']);
//    print(post['description']);
//
//    final postJson = json.encode(post); //map转json
//
//    print(postJson);l
//
//    final postJsonCoverted = json.decode(postJson);
//
//    print(postJsonCoverted['title']);
//    print(postJsonCoverted['description']);
//    print(postJsonCoverted is Map);
//
//    final postModel = Post.fromJson(postJsonCoverted);
//
//    print('title: ${postModel.title}');
//    print('title: ${postModel.description}');
//
//    print('${json.encode(postModel)}');
  }

  Future<List<Post>> fetchPosts() async {
    final response =
        await http.get('https://resources.ninghao.net/demo/posts.json');
//    print('statusCode: ${response.statusCode}');
//    print('body: ${response.body}');
    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      List<Post> posts = responseBody['posts']
          .map<Post>((item) => Post.fromJson(item))
          .toList();
      return posts;
    } else {
      throw Exception('statusCode: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fetchPosts(),
      builder: (ctx, snapshot) {
        print('data: ${snapshot.data}');
        print('data: ${snapshot.connectionState}');
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: Text('Loading'),
          );
        }
        return ListView(
          children: snapshot.data.map<Widget>((item){
            return ListTile(
              title: Text(item.title),
              subtitle: Text(item.author),
              leading: CircleAvatar(
                backgroundImage: NetworkImage(item.imageUrl),
              ),
            );
          }).toList(),
        );
      },
    );
  }
}

class Post {
  final int id;
  final String title;
  final String description;
  final String author;
  final String imageUrl;

  Post(this.id, this.title, this.description, this.author, this.imageUrl);

  Post.fromJson(Map json)
      : id = json['id'],
        title = json['title'],
        description = json['description'],
        author = json['author'],
        imageUrl = json['imageUrl'];

  Map toJson() => {'title': title, 'description': description};
}
