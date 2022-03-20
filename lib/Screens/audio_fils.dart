import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class AudioFiles extends StatefulWidget {
  final AudioFiles? advacedAudioFile;
  const AudioFiles({Key? key, this.advacedAudioFile}) : super(key: key);

  get onDurationChanged => null;

  get onAudioPositionChanged => null;

  //get onDurationChanged => null;

  @override
  _AudioFilesState createState() => _AudioFilesState();
}

class _AudioFilesState extends State<AudioFiles> {
  Duration _duration = new Duration();
  Duration _position = new Duration();

  final String path = "https://soundcloud.com/holyquranofficial/jmlg2tjgvme3";

  bool isPlaying = false;
  bool isPaused = false;
  bool isLoop = false;

  List<IconData> _icon = [Icons.play_circle_fill, Icons.pause_circle_filled];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // this.widget.advacedAudioFile?.onDurationChanged.listen((d) {
    //   setState(() => _duration = d);
    // });
    // this.widget.advacedAudioFile?.onAudioPositionChanged.listen((p) {
    //   setState(() => _position = p);
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
