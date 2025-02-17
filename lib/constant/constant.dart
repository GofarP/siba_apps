import 'package:flutter/material.dart';

const kHintTextStyle = TextStyle(
  color: Colors.white54,
  fontFamily: 'OpenSans',
);
const kHintTextStyleGrey = TextStyle(
  color: Colors.grey,
  fontFamily: 'OpenSans',
);

const kLabelStyle = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.bold,
  fontFamily: 'OpenSans',
);

const kLabelStyleRegister=TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.bold,
  fontFamily: 'OpenSans',
  fontSize: 18,
);

final kBoxDecorationStyle =  BoxDecoration(
  color: Color(0xFF6CA8F1),
  borderRadius: BorderRadius.circular(10.0),
  boxShadow: [
    BoxShadow(
      color: Colors.black12,
      blurRadius: 6.0,
      // ignore: prefer_const_constructors
      offset: Offset(0, 2),
    ),
  ],
);

final kBoxDecorationStyleWhite=BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.circular(10.0),
  boxShadow: [
    BoxShadow(
      color: Colors.black12,
      blurRadius: 6.0,
      offset: Offset(0, 2)
    ),
  ] 
);
