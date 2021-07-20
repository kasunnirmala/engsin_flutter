import 'package:engsinapp_flutter/models/word.dart';
import 'package:engsinapp_flutter/resources/constants.dart';
import 'package:engsinapp_flutter/resources/resources.dart';
import 'package:engsinapp_flutter/services/wordService.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:just_audio/just_audio.dart';

class SingleDayScreen extends StatefulWidget {
  final String title;
  final String meta;
  SingleDayScreen(this.title, this.meta);

  @override
  _SingleDayScreenState createState() => _SingleDayScreenState();
}

class _SingleDayScreenState extends State<SingleDayScreen> {
  late WordService _wordService;
  WordModel? _wordModel;
  final player = AudioPlayer();

  @override
  void initState() {
    super.initState();
    Resources.appbartitleStream.add(widget.title);
    _wordService = WordService(context);
    getData();
  }

  play() async {
    if (_wordModel != null) {
      await player.setUrl("$BASE_URL${_wordModel?.audio}");
      player.play();
    }
  }

  resume() async {
    await player.pause();
  }

  stop() async {
    await player.stop();
  }

  getData() async {
    WordModel? wm = await _wordService.getWords(widget.meta);
    setState(() {
      _wordModel = wm;
    });
  }

  @override
  void dispose() {
    player.dispose().then((value) => super.dispose());
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: size.width,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Card(
          color: Colors.grey[200],
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Column(
              children: [
                Expanded(
                    flex: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ToggleButtons(
                          children: [
                            Icon(FontAwesomeIcons.volumeUp),
                            Icon(FontAwesomeIcons.pauseCircle)
                          ],
                          isSelected: [false, false],
                          onPressed: (index) async {
                            setState(() {});
                            switch (index) {
                              case 0:
                                await play();
                                break;
                              case 1:
                                await resume();
                                break;
                            }
                          },
                        )
                        // IconButton(
                        //   icon: Icon(FontAwesomeIcons.volumeUp),
                        //   onPressed: () async {
                        //     await play();
                        //   },
                        // ),
                      ],
                    )),
                Expanded(
                    flex: 11,
                    child: ListView.builder(
                        itemCount: _wordModel?.words?.length ?? 0,
                        itemBuilder: (context, index) {
                          return Container(
                            height: 80,
                            child: Card(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text("${_wordModel?.words?[index][0] ?? ''}"),
                                  Text("${_wordModel?.words?[index][1] ?? ''}"),
                                ],
                              ),
                            ),
                          );
                        }))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
