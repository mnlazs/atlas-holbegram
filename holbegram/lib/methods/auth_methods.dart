import 'package:firebase_auth/firebase_auth.dart';



class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  
  // Tu modelo de usuario debe ajustarse a esto
  Userd _userFromFirebaseUser(User user) {
    return Userd(...); // Transforma un User de Firebase en tu modelo Userd
  }

  Future<Userd> getUserDetails() async {
    User? firebaseUser = _auth.currentUser;
    if (firebaseUser != null) {
      // Asume que tienes un método para convertir un snapshot de Firebase en tu objeto Userd
      return _userFromFirebaseUser(firebaseUser);
    }
    // Retorna un valor por defecto o maneja el caso de usuario nulo
    throw Exception("No user logged in");
  }
}
