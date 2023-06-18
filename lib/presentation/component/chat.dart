// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
//
// class Chat {
//   String senderId;
//   String receiverId;
//   String message;
//   Timestamp timestamp;
//
//   Chat({required this.senderId, required this.receiverId, required this.message, required this.timestamp});
//
//   Map<String, dynamic> toMap() {
//     return {
//       'senderId': senderId,
//       'receiverId': receiverId,
//       'message': message,
//       'timestamp': timestamp
//     };
//   }
//
//   factory Chat.fromMap(Map<String, dynamic> map) {
//     return Chat(
//         senderId: map['senderId'],
//         receiverId: map['receiverId'],
//         message: map['message'],
//         timestamp: map['timestamp']);
//   }
// }
//
// class ChatService {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final CollectionReference _chatsCollection =
//   FirebaseFirestore.instance.collection('chats');
//
//   Future<void> sendMessage(String receiverId, String message) async {
//     try {
//       String senderId = _auth.currentUser!.uid;
//       Timestamp timestamp = Timestamp.now();
//
//       Chat chat = Chat(
//           senderId: senderId, receiverId: receiverId, message: message, timestamp: timestamp);
//
//       await _chatsCollection.add(chat.toMap());
//     } catch (e) {
//       print('Error sending message: $e');
//     }
//   }
//
//   Stream<List<Chat>> getChats(String receiverId) {
//     String? senderId = _auth.currentUser?.uid;
//     return _chatsCollection
//         .where('senderId', isEqualTo: senderId)
//         .where('receiverId', isEqualTo: receiverId)
//         .orderBy('timestamp', descending: true)
//         .snapshots()
//         .map((QuerySnapshot snapshot) => snapshot.docs
//         .map((DocumentSnapshot document) => Chat.fromMap(document.data()))
//         .toList());
//   }
// }