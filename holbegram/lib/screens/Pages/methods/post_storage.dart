import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';
import 'package:firebase_storage/firebase_storage.dart';


class PostStorage {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<String> uploadImageToStorage(String path, Uint8List imageFile, bool isPost) async {
    Reference ref = _storage.ref().child(path).child(_firestore.collection('posts').doc().id);
    UploadTask uploadTask = ref.putData(imageFile);
    TaskSnapshot snap = await uploadTask;
    String downloadUrl = await snap.ref.getDownloadURL();
    return downloadUrl;
  }

  Future<String> uploadPost(String caption, String uid, String username, String profImage, Uint8List image) async {
    try {
      // Usamos el método real para subir la imagen y obtener la URL
      String imageUrl = await uploadImageToStorage('postImages', image, true);

      String postId = const Uuid().v1();
      await _firestore.collection('posts').doc(postId).set({
        'postId': postId,
        'caption': caption,
        'uid': uid,
        'username': username,
        'profImage': profImage,
        'image': imageUrl,
        'likes': [],
        'datePublished': DateTime.now(),
      });

      return "Ok";
    } catch (e) {
      return e.toString();
    }
  }

  Future<void> deletePost(String postId) async {
    try {
      await _firestore.collection('posts').doc(postId).delete();
    } catch (e) {
      // Considera manejar el error adecuadamente
    }
  }
}
