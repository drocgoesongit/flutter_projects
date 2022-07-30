import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mi_card/flash_chat/authentication.dart';
import 'package:mi_card/flash_chat/constants.dart';

final _firestore = FirebaseFirestore.instance;
late String currentUserEmail;


class ChatScreen extends StatefulWidget {
  static const String id = "chat_screen";

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final messageTextController = TextEditingController();
  late String message;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Firebase.initializeApp().whenComplete(() {
      print("FirebaseInitialized. ChatScreen.");
      getCurrentUser();
      setState(() { });
    });
  }

  void getCurrentUser() async {
    print("Get current user called");
    try{
      User? user = FirebaseAuth.instance.currentUser!;
      currentUserEmail = user.email.toString();
      if( user != null) {
        print(user.email);
      }else {
        print("No user found");
      }
    } catch (e) {
      print(e);
    }
  }

  void getMessage() async {

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: const Icon(Icons.close),
              onPressed: () {
                signOut();
                Navigator.pop(context);
              }),
        ],
        title: const Text('⚡️Chat'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            StreamBuilderWidget(),
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: messageTextController,
                      onChanged: (value) {
                        message = value;
                      },
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      int datetime = DateTime.now().millisecondsSinceEpoch;
                      _firestore.collection('messages').add({
                        'text' : message,
                        'sender' : currentUserEmail,
                        'time' : datetime,
                      }
                      );
                      messageTextController.clear();
                      },
                    child: const Text(
                      'Send',
                      style: kSendButtonTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class StreamBuilderWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: _firestore.collection('messages').orderBy('time').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            final messages = snapshot.data?.size;
            List<MessageBubble> messageWidgets = [];
            for (int i=messages!-1; i>=0; i--) {
              final messageText = snapshot.data?.docs[i]['text'];
              final messageSender = snapshot.data?.docs[i]['sender'];
              messageWidgets.add(MessageBubble(messageSender: messageSender, messageText: messageText, isMe: currentUserEmail == messageSender,));
            }
            return Expanded(
              child: ListView(
                reverse: true,
                padding: const EdgeInsets.all(15.0),
                children: messageWidgets,
              ),
            );
          } else if (snapshot.hasError) {
            return const Icon(Icons.error_outline);
          } else {
            return const CircularProgressIndicator();
          }
        });
  }
}


class MessageBubble extends StatelessWidget {
  MessageBubble({required this.messageSender, required this.messageText, required this.isMe});

  final String messageText;
  final String messageSender;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            Material(
              borderRadius: BorderRadius.circular(10.0),
              elevation: 5.0,
              color: isMe ? Colors.lightBlueAccent : Colors.white60,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  messageText,
                  style: kChatStyle,
                ),
              ),
            ),
            const SizedBox(
              height: 4.0,
            ),
            Text( messageSender, style: kSenderNameTextStyle,),
          ],
        ),
      ),
    );
  }
}
