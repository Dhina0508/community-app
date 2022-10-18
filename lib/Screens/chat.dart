import 'package:flutter/material.dart';

class chatScreen extends StatefulWidget {
  const chatScreen({super.key});

  @override
  State<chatScreen> createState() => _chatScreenState();
}

class _chatScreenState extends State<chatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Requestor')),
      body: Column(
        children: [
          Expanded(child: Container()),
          Card(
            color: Colors.amber[100],
            child: TextFormField(
              textAlignVertical: TextAlignVertical.center,
              autofocus: true,
              decoration: InputDecoration(
                  hintText: "Send A Message",
                  suffix: IconButton(onPressed: () {}, icon: Icon(Icons.send))),
            ),
          ),
        ],
      ),
    );
  }
}
