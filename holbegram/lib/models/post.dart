import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

class Post {
  String caption;
  String uid;
  String username;
  List<dynamic> likes;
  String postId;
  DateTime datePublished;
  String postUrl;
  String profImage;

  Post({
    required this.caption,
    required this.uid,
    required this.username,
    required this.likes,
    required this.postId,
    required this.datePublished,
    required this.postUrl,
    required this.profImage,
  });

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        caption: json['caption'],
        uid: json['uid'],
        username: json['username'],
        likes: List<dynamic>.from(json['likes']),
        postId: json['postId'],
        datePublished: DateTime.parse(json['datePublished']),
        postUrl: json['postUrl'],
        profImage: json['profImage'],
      );

  Map<String, dynamic> toJson() => {
        'caption': caption,
        'uid': uid,
        'username': username,
        'likes': List<dynamic>.from(likes),
        'postId': postId,
        'datePublished': datePublished.toIso8601String(),
        'postUrl': postUrl,
        'profImage': profImage,
      };
}

class Posts extends StatefulWidget {
  @override
  _PostsState createState() => _PostsState();
}

class _PostsState extends State<Posts> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('posts').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }

        if (!snapshot.hasData) {
          return CircularProgressIndicator();
        }

        var data = snapshot.data!.docs.map((doc) => Post.fromJson(doc.data() as Map<String, dynamic>)).toList();

        return ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            Post post = data[index];
            return SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.all(8),
                height: 540,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: NetworkImage(post.profImage),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Text(post.username),
                          Spacer(),
                          IconButton(
                            icon: Icon(Icons.more_horiz),
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Post eliminado")));
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(child: Text(post.caption)),
                    SizedBox(height: 10),
                    Container(
                      width: 350,
                      height: 350,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        image: DecorationImage(
                          image: NetworkImage(post.postUrl),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    // Agregar aquí los íconos faltantes según la imagen proporcionada
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
