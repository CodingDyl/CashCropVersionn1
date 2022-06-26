import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserData {
  final String uid;
  final String displayName;
  final String avatar;

  UserData({
    required this.uid,
    required this.displayName,
    required this.avatar,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      uid: json['UID'].toString(),
      displayName: json['DisplayName'].toString(),
      avatar: json['Avatar'],
    );
  }
}

Future<void> userSetup(String displayName) async {
  FirebaseAuth auth = FirebaseAuth.instance;
  CollectionReference users = FirebaseFirestore.instance.collection('Users');
  String uid = auth.currentUser!.uid.toString();
  users.add({'displayName': displayName, 'uid': uid});
  return;
}
