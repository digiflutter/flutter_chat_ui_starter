import 'package:flutter/material.dart';

import 'chat/ConversationPageList.dart';
import 'chat/FindUser.dart';
void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ConversationPageList(),
        routes: {
         '/FindUser':(context)=>FindUser(),
        }
    );
  }
}
