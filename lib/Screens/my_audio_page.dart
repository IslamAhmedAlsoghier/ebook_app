import 'package:ebook_with_audio_player/Consts/app_colors.dart';
import 'package:ebook_with_audio_player/Screens/audio_fils.dart';
import 'package:flutter/material.dart';

class MyAudioPage extends StatefulWidget {
  const MyAudioPage({Key? key}) : super(key: key);

  @override
  _MyAudioPageState createState() => _MyAudioPageState();
}

class _MyAudioPageState extends State<MyAudioPage> {
  AudioFiles? advancedAoudioFiles;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    advancedAoudioFiles = AudioFiles();
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColor.audioBluishBackground,
      body: Stack(
        children: [
          Positioned(
              top: 0,
              left: 0,
              right: 0,
              height: screenHeight / 3,
              child: Container(
                color: AppColor.audioBlueBackground,
              )),
          Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0.0,
                leading: IconButton(
                  onPressed: () => {},
                  icon: Icon(Icons.arrow_back),
                ),
                actions: [
                  IconButton(
                    onPressed: () => {},
                    icon: Icon(Icons.search),
                  ),
                ],
              )),
          Positioned(
            left: 0,
            right: 0,
            top: screenHeight * 0.2,
            height: screenHeight * 0.36,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40), color: Colors.white),
              child: Column(
                children: [
                  SizedBox(
                    height: screenHeight * 0.1,
                  ),
                  Text(
                    'FLUTTER ACTIONS',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Avenir'),
                  ),
                  Text(
                    'Islam Ahmed',
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  AudioFiles(
                    advacedAudioFile: advancedAoudioFiles,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: (screenWidth - 150) / 2,
            right: (screenWidth - 150) / 2,
            top: screenHeight * 0.12,
            height: screenHeight * 0.16,
            child: Container(
                decoration: BoxDecoration(
                    color: AppColor.audioGreyBackground,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Colors.white,
                      width: 2,
                    )),
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white,
                          width: 5,
                        ),
                        image: DecorationImage(
                            image: AssetImage('assets/imgs/p1.PNG'),
                            fit: BoxFit.cover)),
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
