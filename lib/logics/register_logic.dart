// import 'package:firebase_auth/firebase_auth.dart';

// class AuthService {
//   final FirebaseAuth _auth = FirebaseAuth.instance;

//   Future<User?> registerWithEmailAndPassword(
//     String email,
//     String password,
//   ) async {
//     try {
//       UserCredential result = await _auth.createUserWithEmailAndPassword(
//         email: email,
//         password: password,
//       );
//       return result.user;
//     } catch (e) {
//       print('Registration Error: $e');
//       return null;
//     }
//   }
// }
