import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  final String postId;
  final String caption;
  final String uid;
  final String username;
  final List<dynamic> likes;
  final DateTime datePublished;
  final String postUrl;
  final String profImage;

  Post({
    required this.postId,
    required this.caption,
    required this.uid,
    required this.username,
    required this.likes,
    required this.datePublished,
    required this.postUrl,
    required this.profImage,
  });

  factory Post.fromMap(Map<String, dynamic> map) {
    return Post(
      postId: map['postId'],
      caption: map['caption'],
      uid: map['uid'],
      username: map['username'],
      likes: map['likes'],
      datePublished: (map['datePublished'] as Timestamp).toDate(),
      postUrl: map['postUrl'],
      profImage: map['profImage'],
    );
  }
}

class Posts extends StatefulWidget {
  const Posts({super.key});

  @override
  State<Posts> createState() => _PostsState();
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
          return const CircularProgressIndicator();
        }

        List<Post> posts = snapshot.data!.docs
            .map((doc) => Post.fromMap(doc.data() as Map<String, dynamic>))
            .toList();

        return ListView.builder(
          itemCount: posts.length,
          itemBuilder: (context, index) {
            Post post = posts[index];
            return Card(
              margin: const EdgeInsets.all(8),
              child: Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(post.profImage),
                    ),
                    title: Text(post.username),
                    subtitle: Text(post.datePublished.toString()),
                  ),
                  Image.network(post.postUrl),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(post.caption),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
