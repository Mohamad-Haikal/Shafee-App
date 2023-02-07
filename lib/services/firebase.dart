import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseCtrl {
/////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////

  // Get specific data from specific user (uid)
  static getDataOfUser() async {
    Map data = await _getDataOfCurrentUser();
    return data;
  }

  static Future<Map> _getDataOfCurrentUser() async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    final User? user = _auth.currentUser;
    if (user != null) {
      // User is signed in
      DocumentSnapshot<Map<dynamic, dynamic>> snapshot = await FirebaseFirestore.instance.collection('users').doc(user.uid).get();
      if (snapshot.exists) {
        // User document exists
        return snapshot.data() as Map;
      } else {
        return {"NoUser": "NoUser"};
      }
    }
    return {"NoAuth": "NoAuth"};
  }

/////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////

  // Get specific data from specific user (uid)
  static getDataOfSpecificUser({required var uid}) async {
    Map? data = await _getDataOfAnyUser(uid: uid);
    return data;
  }

  static Future<Map> _getDataOfAnyUser({required var uid}) async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    DocumentSnapshot<Map<dynamic, dynamic>> snapshot = await FirebaseFirestore.instance.doc(uid).get();
    if (snapshot.exists) {
      // User document exists
      return snapshot.data() as Map;
    }
    return {"NoUser": "NoUser"};
  }

/////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////

  // Get specific data from specific user (uid)
  static Future<String?> getSpecificDataOfCurrentUser(String parameter) async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    final User? user = _auth.currentUser;
    if (user != null) {
      // User is signed in
      DocumentSnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore.instance.collection('users').doc(user.uid).get();
      if (snapshot.exists) {
        // User document exists
        var role = snapshot.data()?[parameter];
        return role;
      } else {
        return "NoUser";
      }
    } else {
      return 'NoAuth';
    }
  }

/////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////

  // Get role of user [student - teacher - noUser - noAuth]
  static getRoleOfUser() {
    var role = getSpecificDataOfCurrentUser('role');
    return role;
  }

/////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////

}
