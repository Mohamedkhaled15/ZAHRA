import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:zahra/presentation/resources/assets_manager.dart';
import 'package:zahra/presentation/resources/color_manager.dart';
import 'package:zahra/presentation/resources/strings_manager.dart';
import 'package:zahra/presentation/resources/styles_manager.dart';

import '../../../../resources/font_manager.dart';
import '../../../../resources/values_manager.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'message_line.dart';

final _firestore = FirebaseFirestore.instance;
late User signedInUser;

class PrivateDoctor extends StatefulWidget {
  const PrivateDoctor({Key? key}) : super(key: key);

  @override
  State<PrivateDoctor> createState() => _PrivateDoctorState();
}

class _PrivateDoctorState extends State<PrivateDoctor> {
  final messageTextController = TextEditingController();

  final _auth = FirebaseAuth.instance;

  String? messageText;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() {
    final user = _auth.currentUser;
    try {
      if (user != null) {
        signedInUser = user;
        print(signedInUser.email);
      }
    } catch (e) {
      print(e);
    }
  }

  // void getMessages() async{
  //  final messages= await _firestore.collection('messages').get();
  //  for(var message in messages.docs){
  //    print(message.data());
  //  }
  // }

  void messageStreams() async {
    await for (var snapshot in _firestore.collection('messages').snapshots()) {
      for (var message in snapshot.docs) {
        print(message.data());
      }
    }
  }

  TabController? _tabController;
  int itemCount = 5;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: itemCount,
      child: Padding(
        padding:
            const EdgeInsets.only(left: AppPadding.p2, right: AppPadding.p2),
        child: Column(
          children: [
            Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(AppSize.s32),
                    // boxShadow: [
                    //   BoxShadow(
                    //       color: ColorManager.gray, //New
                    //       blurRadius: 1.0,
                    //       offset:Offset (1,1),
                    //       spreadRadius: 1
                    //   )
                    // ],
                    color: ColorManager.darkPage),
                height: MediaQuery.of(context).size.height / 15,
                child: TabBar(
                  padding: const EdgeInsets.all(0),
                  labelPadding:
                      const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                  indicatorColor: ColorManager.darkSecondary,
                  indicatorSize: TabBarIndicatorSize.label,
                  tabs: [
                    Tab(
                      child: SizedBox(
                        child: ClipOval(
                          child: Image(
                            image: AssetImage(ImageAssets.me),
                          ),
                        ),
                      ),
                    ),
                    Tab(
                      child: SizedBox(
                        child: ClipOval(
                          child: Image(
                            image: AssetImage(ImageAssets.me),
                          ),
                        ),
                      ),
                    ),
                    Tab(
                      child: SizedBox(
                        child: ClipOval(
                          child: Image(
                            image: AssetImage(ImageAssets.me),
                          ),
                        ),
                      ),
                    ),
                    Tab(
                      child: SizedBox(
                        child: ClipOval(
                          child: Image(
                            image: AssetImage(ImageAssets.me),
                          ),
                        ),
                      ),
                    ),
                    Tab(
                      child: GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                backgroundColor: ColorManager.primary,
                                title: Text(
                                  AppStrings.addDoctor,
                                  style:

                                  getNormalStyle(
                                      color: ColorManager.darkSecondary),
                                ),
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: const [],
                                ),
                                actions: [
                                  TextButton(
                                    child: Text('CANCEL',
                                        style: getNormalStyle(
                                            color: ColorManager.darkSecondary)),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                  TextButton(
                                    child: Text('OK',
                                        style: getNormalStyle(
                                            color: ColorManager.darkSecondary)),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                      // Do something when the user presses the OK button
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: CircleAvatar(
                          backgroundImage: (AssetImage(ImageAssets.add)),
                          backgroundColor: ColorManager.darkPage,
                        ),
                      ),
                    ),
                  ],
                )),
            Expanded(
              child: TabBarView(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    margin: const EdgeInsets.symmetric(vertical: 20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: ColorManager.darkPage),
                    width: double.infinity,
                    height: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        StreamBuilder<QuerySnapshot>(
                            stream: _firestore
                                .collection('messages')
                                .orderBy('time')
                                .snapshots(),
                            builder: (context, snapshot) {
                              List<MessageLine> messageWidgets = [];
                              if (!snapshot.hasData) {
                                return Center(
                                  child: CircularProgressIndicator(
                                    backgroundColor: ColorManager.darkSecondary,
                                  ),
                                );
                              }
                              final messages = snapshot.data!.docs.reversed;
                              for (var message in messages) {
                                final messageText = message.get('text');
                                final messageSender = message.get('sender');
                                final currentUser = signedInUser.email;
                                final messageWidget = MessageLine(
                                  sender: messageSender,
                                  text: messageText,
                                  isMe: currentUser == messageSender,
                                  senderImage: ImageAssets.me,
                                );
                                messageWidgets.add(messageWidget);
                              }
                              return Expanded(
                                child: ListView(
                                  reverse: true,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 20),
                                  children: messageWidgets,
                                ),
                              );
                            }),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                child: TextFormField(
                                  controller: messageTextController,
                                  style: TextStyle(
                                    color: ColorManager.white,
                                    fontSize: FontSize.s22,
                                  ),
                                  cursorColor: ColorManager.white,
                                  onChanged: (value) {
                                    messageText = value;
                                  },
                                  decoration: InputDecoration(
                                    labelStyle:
                                        TextStyle(color: ColorManager.white),
                                    fillColor: ColorManager.secondary,
                                    filled: true,
                                    hintText: AppStrings.writeMessage,
                                    hintStyle:
                                        TextStyle(color: ColorManager.white50),
                                    hintTextDirection: TextDirection.rtl,
                                    suffixIcon: IconManager.file,
                                    prefixIcon: InkWell(
                                        onTap: () {
                                          _firestore
                                              .collection('messages')
                                              .add({
                                            'text': messageText,
                                            'sender': signedInUser.email,
                                            'time':
                                                FieldValue.serverTimestamp(),
                                          });
                                          messageTextController.clear();
                                        },
                                        child: Image.asset(
                                          ImageAssets.sendMessage,
                                          color: ColorManager.white,
                                          scale: 25,
                                        )),
                                  ),
                                  textDirection: TextDirection.rtl,
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              CircleAvatar(
                                radius: 25,
                                child: InkWell(
                                    onTap: () {
                                      messageStreams();
                                    },
                                    child: IconManager.record),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    margin: const EdgeInsets.symmetric(vertical: 20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: ColorManager.darkPage),
                    width: double.infinity,
                    height: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        StreamBuilder<QuerySnapshot>(
                            stream: _firestore
                                .collection('messages')
                                .orderBy('time')
                                .snapshots(),
                            builder: (context, snapshot) {
                              List<MessageLine> messageWidgets = [];
                              if (!snapshot.hasData) {
                                return Center(
                                  child: CircularProgressIndicator(
                                    backgroundColor: ColorManager.darkSecondary,
                                  ),
                                );
                              }
                              final messages = snapshot.data!.docs.reversed;
                              for (var message in messages) {
                                final messageText = message.get('text');
                                final messageSender = message.get('sender');
                                final currentUser = signedInUser.email;
                                final messageWidget = MessageLine(
                                  sender: messageSender,
                                  text: messageText,
                                  isMe: currentUser == messageSender,
                                  senderImage: ImageAssets.me,
                                );
                                messageWidgets.add(messageWidget);
                              }
                              return Expanded(
                                child: ListView(
                                  reverse: true,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 20),
                                  children: messageWidgets,
                                ),
                              );
                            }),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                child: TextFormField(
                                  controller: messageTextController,
                                  style: TextStyle(
                                    color: ColorManager.white,
                                    fontSize: FontSize.s22,
                                  ),
                                  cursorColor: ColorManager.white,
                                  onChanged: (value) {
                                    messageText = value;
                                  },
                                  decoration: InputDecoration(
                                    labelStyle:
                                        TextStyle(color: ColorManager.white),
                                    fillColor: ColorManager.secondary,
                                    filled: true,
                                    hintText: AppStrings.writeMessage,
                                    hintStyle:
                                        TextStyle(color: ColorManager.white50),
                                    hintTextDirection: TextDirection.rtl,
                                    suffixIcon: IconManager.file,
                                    prefixIcon: InkWell(
                                        onTap: () {
                                          _firestore
                                              .collection('messages')
                                              .add({
                                            'text': messageText,
                                            'sender': signedInUser.email,
                                            'time':
                                                FieldValue.serverTimestamp(),
                                          });
                                          messageTextController.clear();
                                        },
                                        child: Image.asset(
                                          ImageAssets.sendMessage,
                                          color: ColorManager.white,
                                          scale: 25,
                                        )),
                                  ),
                                  textDirection: TextDirection.rtl,
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              CircleAvatar(
                                radius: 25,
                                child: InkWell(
                                    onTap: () {
                                      messageStreams();
                                    },
                                    child: IconManager.record),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    margin: const EdgeInsets.symmetric(vertical: 20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: ColorManager.darkPage),
                    width: double.infinity,
                    height: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        StreamBuilder<QuerySnapshot>(
                            stream: _firestore
                                .collection('messages')
                                .orderBy('time')
                                .snapshots(),
                            builder: (context, snapshot) {
                              List<MessageLine> messageWidgets = [];
                              if (!snapshot.hasData) {
                                return Center(
                                  child: CircularProgressIndicator(
                                    backgroundColor: ColorManager.darkSecondary,
                                  ),
                                );
                              }
                              final messages = snapshot.data!.docs.reversed;
                              for (var message in messages) {
                                final messageText = message.get('text');
                                final messageSender = message.get('sender');
                                final currentUser = signedInUser.email;
                                final messageWidget = MessageLine(
                                  sender: messageSender,
                                  text: messageText,
                                  isMe: currentUser == messageSender,
                                  senderImage: ImageAssets.me,
                                );
                                messageWidgets.add(messageWidget);
                              }
                              return Expanded(
                                child: ListView(
                                  reverse: true,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 20),
                                  children: messageWidgets,
                                ),
                              );
                            }),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                child: TextFormField(
                                  controller: messageTextController,
                                  style: TextStyle(
                                    color: ColorManager.white,
                                    fontSize: FontSize.s22,
                                  ),
                                  cursorColor: ColorManager.white,
                                  onChanged: (value) {
                                    messageText = value;
                                  },
                                  decoration: InputDecoration(
                                    labelStyle:
                                        TextStyle(color: ColorManager.white),
                                    fillColor: ColorManager.secondary,
                                    filled: true,
                                    hintText: AppStrings.writeMessage,
                                    hintStyle:
                                        TextStyle(color: ColorManager.white50),
                                    hintTextDirection: TextDirection.rtl,
                                    suffixIcon: IconManager.file,
                                    prefixIcon: InkWell(
                                        onTap: () {
                                          _firestore
                                              .collection('messages')
                                              .add({
                                            'text': messageText,
                                            'sender': signedInUser.email,
                                            'time':
                                                FieldValue.serverTimestamp(),
                                          });
                                          messageTextController.clear();
                                        },
                                        child: Image.asset(
                                          ImageAssets.sendMessage,
                                          color: ColorManager.white,
                                          scale: 25,
                                        )),
                                  ),
                                  textDirection: TextDirection.rtl,
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              CircleAvatar(
                                radius: 25,
                                child: InkWell(
                                    onTap: () {
                                      messageStreams();
                                    },
                                    child: IconManager.record),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    margin: const EdgeInsets.symmetric(vertical: 20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: ColorManager.darkPage),
                    width: double.infinity,
                    height: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        StreamBuilder<QuerySnapshot>(
                            stream: _firestore
                                .collection('messages')
                                .orderBy('time')
                                .snapshots(),
                            builder: (context, snapshot) {
                              List<MessageLine> messageWidgets = [];
                              if (!snapshot.hasData) {
                                return Center(
                                  child: CircularProgressIndicator(
                                    backgroundColor: ColorManager.darkSecondary,
                                  ),
                                );
                              }
                              final messages = snapshot.data!.docs.reversed;
                              for (var message in messages) {
                                final messageText = message.get('text');
                                final messageSender = message.get('sender');
                                final currentUser = signedInUser.email;
                                final messageWidget = MessageLine(
                                  sender: messageSender,
                                  text: messageText,
                                  isMe: currentUser == messageSender,
                                  senderImage: ImageAssets.me,
                                );
                                messageWidgets.add(messageWidget);
                              }
                              return Expanded(
                                child: ListView(
                                  reverse: true,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 20),
                                  children: messageWidgets,
                                ),
                              );
                            }),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                child: TextFormField(
                                  controller: messageTextController,
                                  style: TextStyle(
                                    color: ColorManager.white,
                                    fontSize: FontSize.s22,
                                  ),
                                  cursorColor: ColorManager.white,
                                  onChanged: (value) {
                                    messageText = value;
                                  },
                                  decoration: InputDecoration(
                                    labelStyle:
                                        TextStyle(color: ColorManager.white),
                                    fillColor: ColorManager.secondary,
                                    filled: true,
                                    hintText: AppStrings.writeMessage,
                                    hintStyle:
                                        TextStyle(color: ColorManager.white50),
                                    hintTextDirection: TextDirection.rtl,
                                    suffixIcon: IconManager.file,
                                    prefixIcon: InkWell(
                                        onTap: () {
                                          _firestore
                                              .collection('messages')
                                              .add({
                                            'text': messageText,
                                            'sender': signedInUser.email,
                                            'time':
                                                FieldValue.serverTimestamp(),
                                          });
                                          messageTextController.clear();
                                        },
                                        child: Image.asset(
                                          ImageAssets.sendMessage,
                                          color: ColorManager.white,
                                          scale: 25,
                                        )),
                                  ),
                                  textDirection: TextDirection.rtl,
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              CircleAvatar(
                                radius: 25,
                                child: InkWell(
                                    onTap: () {
                                      messageStreams();
                                    },
                                    child: IconManager.record),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    margin: const EdgeInsets.symmetric(vertical: 20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: ColorManager.darkPage),
                    width: double.infinity,
                    height: double.infinity,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
