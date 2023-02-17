// ignore_for_file: avoid_unnecessary_containers

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';


class VideoPlayers extends StatefulWidget{
  @override
   VideoPlayers({Key? key ,required this.video_url}) : super(key: key);
String video_url ='';
  
  @override
  _VideoPlayersState createState() => _VideoPlayersState();
}
class _VideoPlayersState extends State<VideoPlayers> {
  
  late VideoPlayerController controller;
String url='';
  @override
  void initState() {
    setState(() {
     url= widget.video_url;
    });
    loadVideoPlayer();
    super.initState();
  }

  loadVideoPlayer(){
     controller = VideoPlayerController.network(url);
     controller.addListener(() {
     });
    controller.initialize().then((value){
        setState(() {});
    });

  }

  @override
  Widget build(BuildContext context) {
    return  SizedBox( 
            child: Column(
              children:[
                  AspectRatio( 
                    aspectRatio: controller.value.aspectRatio,
                     child: SizedBox(
                      height: 300,
                      child: VideoPlayer(controller)
                      ),
                  ),

                  Container( //duration of video
                     child: Text("Temps: ${controller.value.duration}"),
                  ),

                  Container(
                      child: VideoProgressIndicator(
                        controller, 
                        allowScrubbing: true,
                        colors:const VideoProgressColors(
                            backgroundColor: Colors.redAccent,
                            playedColor: Colors.green,
                            bufferedColor: Colors.purple,
                        )
                      )
                  ),

                  Center(
                    child: Container(
                       child: Row(
                           children: [
                              IconButton(
                                  onPressed: (){
                                    if(controller.value.isPlaying){
                                      controller.pause();
                                    }else{
                                      controller.play();
                                    }

                                    setState(() {
                                      
                                    });
                                  }, 
                                  icon:Icon(controller.value.isPlaying?Icons.pause:Icons.play_arrow)
                             ),

                             IconButton(
                                  onPressed: (){
                                    controller.seekTo(const Duration(seconds: 0));

                                    setState(() {
                                      
                                    });
                                  }, 
                                  icon:const Icon(Icons.stop)
                             )
                           ],
                       ),
                    ),
                  )
              ]
            )
          );
  }
}