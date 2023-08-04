

import 'package:flutter/material.dart';
import 'package:app2/Activity/Home.dart';
import 'package:app2/Activity/Loading.dart';
import 'package:app2/Activity/Location.dart';


void main() {
  runApp(MaterialApp(
    routes: {
      "/" : (context) => Loading(),
      "/home" : (context) => Home(),
      "/loading": (context) => Loading(),
    },
  ));
}


