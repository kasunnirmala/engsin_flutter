import 'package:engsinapp_flutter/resources/constants.dart';
import 'package:engsinapp_flutter/resources/resources.dart';
import 'package:flutter/material.dart';

class ReferalsScreen extends StatefulWidget {
  const ReferalsScreen({Key? key}) : super(key: key);

  @override
  _ReferalsScreenState createState() => _ReferalsScreenState();
}

class _ReferalsScreenState extends State<ReferalsScreen> {
  @override
  void initState() {
    super.initState();
    Resources.appbartitleStream.add("Referals");
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
                Text(
                  "My Referals",
                  style: kH1HeaderStyle,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
