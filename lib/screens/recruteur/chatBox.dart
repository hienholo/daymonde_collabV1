import 'package:daymonde_collaboration/const/color.dart';
import 'package:flutter/material.dart';

class ChatBox extends StatefulWidget {
  const ChatBox({Key? key}) : super(key: key);

  @override
  State<ChatBox> createState() => _ChatBoxState();
}

class _ChatBoxState extends State<ChatBox> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: light,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.more_vert,
                color: Colors.black,
                size: 30,
              ))
        ],
        title: Text(
          "Messages",
          style: TextStyle(color: black, fontSize: 25),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/profil/11.png'),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  "Bonjour Cissé, je suis Marc Votre assistant du jour, quelle est votre préoccupation ?",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),

              
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        height: 100,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: null,
                icon: Icon(
                  Icons.add_box_outlined,
                  size: 35,
                )),
            Expanded(
              child: Container(
                alignment: Alignment.center,
                height: 70,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50), color: grey),
                child: TextFormField(
                  decoration: InputDecoration(
                      hintText: "Votre message...",
                      contentPadding: EdgeInsets.only(left: 20, right: 20),
                      border: InputBorder.none),
                ),
              ),
            ),
            IconButton(
                onPressed: null,
                icon: Icon(
                  Icons.send,
                  color: blue,
                  size: 35,
                ))
          ],
        ),
      ),
    );
  }
}
