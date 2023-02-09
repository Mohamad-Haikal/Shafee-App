import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shafee_app/services/firebase.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthCtrl {
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

/////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////

  // SignIn with email & password
  static Future<User?> signInWithEmail(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      return user;
    } catch (e) {
      print('signInWithEmail'+''+e.toString());
      return null;
    }
  }
/////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////

  // SignUp with email & password
  static Future<User?> signUpWithEmail(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      _firestore.collection('users').doc(result.user?.uid).set({
        'email': email,
        'created_at': Timestamp.now(),
      });
      return user;
    } catch (e) {
      print('signUpWithEmail()'+''+e.toString());
      return null;
    }
  }

/////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////

  // Sign out from firebase
  static Future signOut() async {
    await (await SharedPreferences.getInstance()).clear();
    return FirebaseCtrl.auth.signOut();
  }

/////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////

  // Get Current User
  static Future<User?> currentUser() async {
      User? user = _auth.currentUser;
      return user;
  }

/////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////

}
