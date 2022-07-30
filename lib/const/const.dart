import 'package:flutter/material.dart';

const kColorForContainers = Color(0xFF302B3D);
const kBottomContainerHeight = 70.0;
const kBottomContainerColor = Color(0xFFEB1555);
const kActiveColor = Color(0xFF1D1E33);
const kInactiveColor = Color(0xFF111328);
const kBasicMargin = 15.0;
const kBasicRadius = 10.0;
const kFontColorCard = Color(0xFF8D8E98);

const kNotWhite = Color(0xFFF6FAFF);
const kDarkTextBlue = Color(0xFF384569);
const kLightTextGrey = Color(0xFF565880);
const kBitcoinAccentBlue = Color(0xFF4AC8EF);
const kBackgroundDarkBlue = Color(0xFF607CFA);
// mainScreen List Colors.
const kBitcoinLightColor = Color(0xFFFFEFBF);
const kBitcoinStrokeColor = Color(0xFFE8C258);
const kEthereumLightColor = Color(0xFFDEE8FF);
const kEthereumStrokeColor = Color(0xFF7D9DE1);
const kLiteCoinLightColor = Color(0xFFF6FAFF);
const kLiteCoinStrokeColor = Color(0xFF5081BB);

const kThickNumberStyle = TextStyle(
  fontSize: 40.0,
  fontWeight: FontWeight.w900,
  fontFamily: 'SourceSansPro',
);

const kResultMainText = TextStyle(
  fontSize: 22.0,
  fontWeight: FontWeight.bold,
  color: Colors.green
);

const kNoteStyle = TextStyle(
  fontSize: 20.0,
  color: kFontColorCard,
);

const kNumberBmi = TextStyle(
  fontSize: 100.0,
  fontWeight: FontWeight.bold,
);

const kTempTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 100.0,
);

const kMessageTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 60.0,
);

const kButtonTextStyle = TextStyle(
  fontSize: 30.0,
  fontFamily: 'Spartan MB',
);

const kConditionTextStyle = TextStyle(
  fontSize: 100.0,
);

const kTextFieldInputDecoration = InputDecoration(
    filled: true,
    fillColor: Colors.white,
    icon: Icon(
      Icons.location_city,
      color: Colors.white,
    ),
    border: OutlineInputBorder(),
    hintText: "Enter city name",
    hintStyle: TextStyle(
      color: Colors.grey,
    )
);

const kExtraBoldTitleStyle = TextStyle(
  fontFamily: 'Poppins',
  fontWeight: FontWeight.w600,
  fontSize: 34.0,
);

const kCardTextHomePage = TextStyle(
  fontFamily: "Poppins",
  fontWeight: FontWeight.w500,
  fontSize: 16.0,
  color: kDarkTextBlue
);