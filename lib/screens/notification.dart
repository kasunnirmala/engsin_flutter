import 'package:engsinapp_flutter/resources/resources.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  void initState() {
    super.initState();
    Resources.appbartitleStream.add("Notifications");
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        height: size.height,
        width: size.width,
        child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, i) {
              return Card(
                child: ListTile(
                    title: Text("Title"), subtitle: Text("Notification body")),
              );
            }));
  }
}
