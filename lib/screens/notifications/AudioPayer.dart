import 'dart:typed_data';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class AudioPayer extends  StatefulWidget {
  @override
  State<AudioPayer> createState() => _AudioPayerState();
}

class _AudioPayerState extends State<AudioPayer> {

  int maxduration = 100;
  int currentpos = 0;
  String currentpostlabel = "00:00";
  String audioasset = "assets/audio/Terrain.mp3";
  bool isplaying = false;
  bool audioplayed = false;
  late Uint8List audiobytes;

  AudioPlayer player = AudioPlayer();

  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      ByteData bytes = await rootBundle.load(audioasset); //load audio from assets
      audiobytes = bytes.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);
      //convert ByteData to Uint8List

      player.onDurationChanged.listen((Duration d) { //get the duration of audio
        maxduration = d.inMilliseconds;
        setState(() {

        });
      });

      player.onAudioPositionChanged.listen((Duration  p){
        currentpos = p.inMilliseconds; //get the current position of playing audio

        //generating the duration label
        int shours = Duration(milliseconds:currentpos).inHours;
        int sminutes = Duration(milliseconds:currentpos).inMinutes;
        int sseconds = Duration(milliseconds:currentpos).inSeconds;

        int rhours = shours;
        int rminutes = sminutes - (shours * 60);
        int rseconds = sseconds - (sminutes * 60 + shours * 60 * 60);

        currentpostlabel = "$rhours:$rminutes:$rseconds";

        setState(() {
          //refresh the UI
        });
      });

    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: InkWell(
                  onTap: () async {
                    if(!isplaying && !audioplayed){
                      int result = await player.playBytes(audiobytes);
                      if(result == 1){ //play success
                        setState(() {
                          isplaying = true;
                          audioplayed = true;
                        });
                      }else{
                        print("Error while playing audio.");
                      }
                    }else if(audioplayed && !isplaying){
                      int result = await player.resume();
                      if(result == 1){ //resume success
                        setState(() {
                          isplaying = true;
                          audioplayed = true;
                        });
                      }else{
                        print("Error on resume audio.");
                      }
                    }else{
                      int result = await player.pause();
                      if(result == 1){ //pause success
                        setState(() {
                          isplaying = false;
                        });
                      }else{
                        print("Error on pause audio.");
                      }
                    }
                  },
                  child: Icon(isplaying?Icons.pause:Icons.play_arrow)
              ),
            ),
            Expanded(
              flex: 3,
              child:  Container(
                  child: Slider(
                    value: double.parse(currentpos.toString()),
                    min: 0,
                    max: double.parse(maxduration.toString()),
                    divisions: maxduration,
                    label: currentpostlabel,
                    onChanged: (double value) async {
                      int seekval = value.round();
                      int result = await player.seek(Duration(milliseconds: seekval));
                      if(result == 1){ //seek successful
                        currentpos = seekval;
                      }else{
                        print("Seek unsuccessful.");
                      }
                    },
                  )
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                child: Text(currentpostlabel, style: TextStyle(fontSize: 16),),
              ),
            ),
          ],
        )

    );
  }
}