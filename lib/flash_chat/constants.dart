import 'package:flutter/material.dart';

const kSendButtonTextStyle = TextStyle(
  color: Colors.lightBlueAccent,
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
);

const kMessageTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  hintText: 'Type your message here...',
  border: InputBorder.none,
);

const kMessageContainerDecoration = BoxDecoration(
  border: Border(
    top: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
  ),
);

const kHintTextStyle = TextStyle(
  color: Colors.grey,
);

InputDecoration getInputDecoration(String text){
  return InputDecoration(
    hintText: text,
    hintStyle: kHintTextStyle,
    contentPadding:
    const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
    border: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(32.0)),
    ),
    enabledBorder: const OutlineInputBorder(
      borderSide:
      BorderSide(color: Colors.lightBlueAccent, width: 1.0),
      borderRadius: BorderRadius.all(Radius.circular(32.0)),
    ),
    focusedBorder: const OutlineInputBorder(
      borderSide:
      BorderSide(color: Colors.lightBlueAccent, width: 2.0),
      borderRadius: BorderRadius.all(Radius.circular(32.0)),
    ),
  );
}

const kSenderNameTextStyle = TextStyle(
  fontFamily: "Poppins",
  color: Colors.white60,
  fontSize: 12.0,
);

const kChatStyle = TextStyle(
  fontFamily: "Poppins",
  color: Colors.white,
  fontSize: 14.0,
);

const kTodoTitle = TextStyle(
  fontFamily: 'Poppins',
  fontWeight: FontWeight.w700,
  fontSize: 40.0,
  color: Colors.white,
);

const kTodoSubText = TextStyle(
  fontFamily: 'Poppins',
  fontSize: 20.0,
  color: Colors.white,
);

const kTodoTaskText = TextStyle(
  fontFamily: 'Poppins',
  fontSize: 20.0,
  color: Colors.black,
);

const kTodoBottomText = TextStyle(
  fontFamily: 'Poppins',
  fontWeight: FontWeight.w700,
  fontSize: 20.0,
  color: Colors.black,
);

const kTodoBottomButtonText = TextStyle(
  fontFamily: 'Poppins',
  fontSize: 20.0,
  color: Colors.white,
);