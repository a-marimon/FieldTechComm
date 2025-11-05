// import 'package:firebase_database/firebase_database.dart';
//
// class DBServices {
//   final FirebaseDatabase _firebaseDatabase = FirebaseDatabase.instance;
//
//   // Create and/or Update
//   Future<void> create ({
//     required String path,
//     required Map<String, dynamic> data,
//   }) async {
//     final DatabaseReference ref = _firebaseDatabase.ref().child(path);
//     await ref.set(data);
//   }
// }