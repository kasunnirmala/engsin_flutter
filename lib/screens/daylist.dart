import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:engsinapp_flutter/resources/constants.dart';
import 'package:engsinapp_flutter/resources/resources.dart';
import 'package:engsinapp_flutter/route/appRouter.gr.dart';
import 'package:engsinapp_flutter/services/wordService.dart';
import 'package:flutter/material.dart';

class DayListScreen extends StatefulWidget {
  const DayListScreen({Key? key}) : super(key: key);

  @override
  _DayListScreenState createState() => _DayListScreenState();
}

class _DayListScreenState extends State<DayListScreen> {
  late WordService _wordService;
  List days = [];
  @override
  void initState() {
    super.initState();
    Resources.appbartitleStream.add("Days");
    _wordService = WordService(context);
    getData();
  }

  getData() async {
    List ds = await _wordService.getDays();
    setState(() {
      days = ds;
    });
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
                  child: GridView.count(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    children: days.map<Widget>((value) {
                      return GestureDetector(
                        child: Card(
                          color: Colors.primaries[
                              Random().nextInt(Colors.primaries.length)],
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "${value['_id']}",
                              )
                            ],
                          ),
                        ),
                        onTap: () {
                          AutoRouter.of(context).push(SingleDayScreenRoute(
                              title: "${value['_id']}",
                              meta: "${value['data']}"));
                        },
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
