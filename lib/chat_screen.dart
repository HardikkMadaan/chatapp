import 'package:flutter/material.dart';
import 'package:chatapp/chat_message.dart';

class ChatScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ChatScreenState();
  }
}

class ChatScreenState extends State<ChatScreen> {
 final TextEditingController _textController =  new TextEditingController();
  final List<ChatMessage> _messages = <ChatMessage> [];



  Widget _textComposerWidget() {
    return IconTheme(
      data: IconThemeData(
        color: Colors.green
      ),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: <Widget>[
            Flexible(
              child: TextField(
                controller: _textController,
                decoration: InputDecoration.collapsed(hintText: "Send a Message"),

              ),
            ),
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 4.0),
                child: IconButton(
                    icon: Icon(Icons.send),
                  onPressed: () => _handleSubmitted(_textController.text),

                )
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Flexible(
          child: ListView.builder(
            padding: EdgeInsets.all(8.0),
            reverse: true,
            itemBuilder: (_,int index) => _messages[index],
            itemCount: _messages.length,
          ),
        ),
        Divider(height: 1.0),
        Container(
            decoration: BoxDecoration(
                color: Theme.of(context).cardColor
            ),
            child: _textComposerWidget()
        )
      ],
    );
  }

   _handleSubmitted(String text) {

     _textController.clear();
    ChatMessage message = new ChatMessage(
      text: text,

    );

    setState(() {
      _messages.insert(0, message);
    });

  }
}

