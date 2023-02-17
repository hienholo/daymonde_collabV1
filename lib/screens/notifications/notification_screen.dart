import 'package:daymonde_collaboration/const/color.dart';
import 'package:daymonde_collaboration/screens/notifications/AudioPayer.dart';
import 'package:daymonde_collaboration/screens/notifications/detail_notification_screen.dart';
import 'package:flutter/material.dart';
class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);
  @override
  State<NotificationScreen> createState() => _NotificationFournisseurScreenState();
}

class _NotificationFournisseurScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor:  Colors.white,
        title: Row(
          children: [
            Row(
              children: [
                Stack(
                  children: [
                    Icon(Icons.notifications,size: 39,),
                    Positioned(
                      right: 1,
                      top: -2,
                      child:Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.pink[100],

                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(6.0),
                            child: Text("1",style: TextStyle(color: Colors.pink,fontSize:10,)),
                          )
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text('Noitifications',style: TextStyle(color:Colors.black,fontSize: 16),),
                ),
              ],
            ),
          ],
        ),
        //automaticallyImplyLeading: false,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(110),
          child:  Padding(
            padding: EdgeInsets.all(10),
            child: Container(
              height: 90,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(6),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromARGB(36, 158, 158, 158),
                    blurRadius: 5,
                    offset: Offset(1, 2),
                  ),
                  BoxShadow(
                    color: Color.fromARGB(54, 158, 158, 158),
                    blurRadius: 5,
                    offset: Offset(2, 1),
                  ),
                ],
              ),
              child: Row(
                children: [
                  const SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      alignment: Alignment.bottomLeft,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              image: AssetImage('assets/profil/14.png'),
                              fit: BoxFit.fill
                          )
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 6,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8),
                          child:   Text(
                            "Titre du sujet",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                        AudioPayer()
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          SizedBox(height: 10,),
          Column(
            children: [
              InkWell(
                onTap: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context)=>DetailNotificationScreen()));
                },
                child: KNotifications(
                    context,
                    'assets/images/MISSION.png',
                    'NOUVELLE MISSION',
                    'En cours',
                    "assets/images/desktop.png",
                    '13 Mai 2022',
                    false,
                    true
                ),
              ),
              KNotifications(
                  context,
                  'assets/images/ecouter.png',
                  'REGIE DAYMOND',
                  'Bonjour Mr kone BEN ISAC votre commande votre mission a été effectué avec succès',
                  "assets/images/desktop.png",
                  '13 Mai 2022',
                  false,
                  false
              ),
              KNotifications(
                  context,
                  'assets/images/PC.png',
                  'MISSION DAYMOND',
                  'Rémail kouadio a marqué ce produit stock epuisé',
                  "assets/images/desktop.png",
                  '13 Mai 2022',
                  false,
                  false
              ),
              KNotifications(
                  context,
                  'assets/images/MISSION.png',
                  'DEMANDE DE RUPTURE',
                  'Nous avons besoin de produit',
                  "assets/images/desktop.png",
                  '13 Mai 2022',
                  false,
                  false,
              ),

            ],
          ),
        ],
      ),
    );
  }
}


Container KNotifications(
    BuildContext context,
    String image_profil,
    String titre,
    String sous_titre,
    String image_produit,
    String temps,
    bool status,
    bool status_mission
    ){
  return Container(
      margin: EdgeInsets.all(3),
      decoration: BoxDecoration(
        color: status? Colors.purple.shade50  :  Colors.white ,
        borderRadius: BorderRadius.circular(6),
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(36, 158, 158, 158),
            blurRadius: 5,
            offset: Offset(1, 2),
          ),
          BoxShadow(
            color: Color.fromARGB(54, 158, 158, 158),
            blurRadius: 5,
            offset: Offset(2, 1),
          ),
        ],
      ),
      child:ListTile(
        leading: Container(
          width: 70,
          height: 70,
          padding: EdgeInsets.only(top: 20),
          decoration: BoxDecoration(
              border: Border.all(width: 4, color: Colors.white),
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(image_profil)
              )
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(titre.toUpperCase(),
              style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 14),overflow:TextOverflow.ellipsis,),
            Column(
              children: [
                Image.asset(image_produit,width: 30,),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(temps,style: TextStyle(fontSize: 12),),
                ),
              ],
            ),
          ],
        ),
        subtitle: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Text(sous_titre,style: TextStyle(color: status_mission ? green :  Colors.black),),
        ),
      )
  );
}