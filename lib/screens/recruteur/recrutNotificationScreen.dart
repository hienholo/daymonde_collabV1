import 'package:daymonde_collaboration/const/color.dart';
import 'package:daymonde_collaboration/screens/recruteur/chatBox.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RecrutNotifications extends StatefulWidget {
  const RecrutNotifications({Key? key}) : super(key: key);

  @override
  State<RecrutNotifications> createState() => _RecrutNotificationsState();
}

class _RecrutNotificationsState extends State<RecrutNotifications> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: light,
        appBar: AppBar(
            title: Row(
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Icon(
                      Icons.notifications,
                      color: Colors.black,
                      size: 30,
                    ),
                    Positioned(
                      top: 5,
                      left: 16,
                      child: CircleAvatar(
                        radius: 6,
                        backgroundColor: Colors.red,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Notifications",
                  style: TextStyle(color: Colors.black, fontSize: 25),
                )
              ],
            ),
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                )),
            backgroundColor: Colors.white,
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: IconButton(
                  icon: Icon(
                    FontAwesomeIcons.facebookMessenger,
                    size: 40,
                    color: blue,
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context)=>ChatBox()));
                  },
                ),
              )
            ]),
        body: Container(
          height: size.height,
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Container(
                  color: Colors.white,
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          CircleAvatar(
                            radius: 50,
                            backgroundImage: AssetImage('assets/profil/11.png'),
                          ),
                          Positioned(
                            right: 0,
                            bottom: 20,
                            child: CircleAvatar(
                              radius: 8,
                              backgroundColor: Colors.green,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Marc",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 25),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          SizedBox(
                            width: 200,
                            child: Text(
                              "Ceci est une description ceci est une description",
                              style: TextStyle(
                                  overflow: TextOverflow.clip, fontSize: 12),
                              maxLines: 2,
                            ),
                          )
                        ],
                      ),
                      Expanded(
                        child: Text(
                          "10:10",
                          style: TextStyle(
                              overflow: TextOverflow.clip, fontSize: 12),
                          maxLines: 2,
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ));
  }
}
