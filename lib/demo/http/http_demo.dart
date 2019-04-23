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
//    fetchPost();
    final post = {
      'title': 'hello',
      'description': 'hhhhhh',
    };
    print(post['title']);
    print(post['description']);

    final postJson = json.encode(post); //map转json

    print(postJson);

    final postJsonCoverted = json.decode(postJson);

    print(postJsonCoverted['title']);
    print(postJsonCoverted['description']);
    print(postJsonCoverted is Map);

    final postModel=Post.fromJson(postJsonCoverted);

    print('title: ${postModel.title}');
    print('title: ${postModel.description}');

    print('${json.encode(postModel)}');
  }

  fetchPost() async {
    final response =
        await http.get('https://resources.ninghao.net/demo/posts.json');
    print('statusCode: ${response.statusCode}');
    print('body: ${response.body}');
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class Post {
  final String title;
  final String description;

  Post(this.title, this.description);

  Post.fromJson(Map json)
      : title = json['title'],
        description = json['description'];

  Map toJson() =>{
    'title':title,
    'description':description
  };
}
