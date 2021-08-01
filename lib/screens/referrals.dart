import 'package:engsinapp_flutter/models/user.dart';
import 'package:engsinapp_flutter/resources/constants.dart';
import 'package:engsinapp_flutter/resources/resources.dart';
import 'package:engsinapp_flutter/services/userService.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class ReferalsScreen extends StatefulWidget {
  const ReferalsScreen({Key? key}) : super(key: key);

  @override
  _ReferalsScreenState createState() => _ReferalsScreenState();
}

class _ReferalsScreenState extends State<ReferalsScreen> {
  late UserService _userService;
  @override
  void initState() {
    super.initState();
    _userService = UserService(context);
    Resources.appbartitleStream.add("Referals");
  }

  Future<List<UserModel?>> getMyReferals() async {
    EasyLoading.show(status: "Loading...");
    List<UserModel?> _users = await _userService.getMyReferals();
    EasyLoading.dismiss();
    return _users;
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
                  child: Text(
                    "My Referals",
                    style: kH1HeaderStyle,
                  ),
                ),
                Expanded(
                  flex: 11,
                  child: FutureBuilder<List<UserModel?>>(
                      future: getMyReferals(),
                      builder: (context, snapshot) {
                        return snapshot.hasData
                            ? ListView.builder(
                                itemCount: snapshot.data?.length,
                                itemBuilder: (context, index) {
                                  return Card(
                                      child: ListTile(
                                    title:
                                        Text("${snapshot.data?[index]?.name}"),
                                  ));
                                })
                            : Container();
                      }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
