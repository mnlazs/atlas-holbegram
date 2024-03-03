import 'package:firebase_auth/firebase_auth.dart';
import 'package:holbegram/models/user.dart'; // Ajusta esta ruta si es necesario

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  
  // Ajuste para usar tu clase Users
  Users _userFromFirebaseUser(User user) {
    return Users(
      uid: user.uid,
      email: user.email ?? '', // Asume un valor por defecto si es null
      username: '', // Estos valores deben ser ajustados según tu lógica de negocio
      bio: '',
      photoUrl: '',
      followers: [],
      following: [],
      posts: [],
      saved: [],
      searchKey: '',
    );
  }

  Future<Users> getUserDetails() async {
    User? firebaseUser = _auth.currentUser;
    if (firebaseUser != null) {
      return _userFromFirebaseUser(firebaseUser);
    }
    throw Exception("No user logged in");
  }
}
