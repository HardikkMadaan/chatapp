import 'package:flutter/material.dart';
import 'package:chatapp/chat_screen.dart';

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Messenger",
        textAlign: TextAlign.center,),
      ),
      body: ChatScreen()
    );
  }
}