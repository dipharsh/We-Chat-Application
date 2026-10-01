import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:we_chat/models/chat_user.dart';

class APIs {
  static FirebaseAuth auth = FirebaseAuth.instance;
  static FirebaseFirestore firestore = FirebaseFirestore.instance;

  static late ChatUser me;

  static User get user => auth.currentUser!;

  static Future<bool> userExist() async {
    return (await firestore.collection('users').doc(auth.currentUser!.uid).get()).exists;
  }

  static Future<void> getSelfInfo() async {
    try {
      final userDoc = await firestore.collection('users').doc(auth.currentUser!.uid).get();

      if (userDoc.exists) {
        me = ChatUser.fromJson(userDoc.data()!);
        print('My Data: ${userDoc.data()}');
      } else {
        await createUser();
        await getSelfInfo();
      }
    } catch (e) {
      print('Error in getSelfInfo: $e');
    }
  }

  static Future<void> createUser() async {
    final time = DateTime.now().millisecondsSinceEpoch.toString();

    final chatUser = ChatUser(
      id: user.uid,
      name: user.displayName.toString(),
      email: user.email.toString(),
      about: "Hey, I'm using We Chat!",
      image: user.photoURL.toString(),
      createdAt: time,
      isOnline: false,
      lastActive: time,
      pushToken: '',
    );

    return await firestore.collection('users').doc(user.uid).set(chatUser.toJson());
  }

  static Stream<QuerySnapshot<Map<String, dynamic>>> getAllUsers() {
    return firestore
        .collection('users')
        .where('id', isNotEqualTo: user.uid)
        .snapshots();
  }
  static Future<void> updateUserInfo() async {
    await firestore.collection('users').doc(auth.currentUser!.uid).update({
      'name': me.name,
      'about': me.about,
    });
  }
}
