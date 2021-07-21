import 'dart:typed_data';
import 'package:auto_route/auto_route.dart';
import 'package:engsinapp_flutter/models/user.dart';
import 'package:engsinapp_flutter/resources/resources.dart';
import 'package:engsinapp_flutter/route/appRouter.gr.dart';
import 'package:engsinapp_flutter/services/userService.dart';
import 'package:engsinapp_flutter/widgets/LoginSignup/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';

class UploadSlipScreen extends StatefulWidget {
  final UserModel userModel;
  const UploadSlipScreen(this.userModel);

  @override
  _UploadSlipScreenState createState() => _UploadSlipScreenState();
}

class _UploadSlipScreenState extends State<UploadSlipScreen> {
  final _formKey = GlobalKey<FormBuilderState>(debugLabel: "Upload");
  XFile? image;
  final ImagePicker _picker = ImagePicker();
  late UserService _userService;
  @override
  void initState() {
    super.initState();
    _userService = UserService(context);
    Resources.appbartitleStream.add("Upload Slip");
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
                  child: SingleChildScrollView(
                    child: FormBuilder(
                        key: _formKey,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        child: Column(children: <Widget>[
                          Container(
                            child: TextButton(
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (_) => AlertDialog(
                                          content: Container(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                ElevatedButton(
                                                    onPressed: () async {
                                                      image = await _picker
                                                          .pickImage(
                                                              source:
                                                                  ImageSource
                                                                      .camera);
                                                      setState(() {});
                                                    },
                                                    child: Icon(FontAwesomeIcons
                                                        .camera)),
                                                ElevatedButton(
                                                    onPressed: () async {
                                                      image = await _picker
                                                          .pickImage(
                                                              source:
                                                                  ImageSource
                                                                      .gallery);
                                                      setState(() {});
                                                    },
                                                    child: Icon(FontAwesomeIcons
                                                        .images))
                                              ],
                                            ),
                                          ),
                                        ));
                              },
                              child: FutureBuilder<Uint8List>(
                                future: image?.readAsBytes(),
                                builder: (_, snapshot) => snapshot.hasData
                                    ? Image.memory(
                                        snapshot.data!,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.5,
                                      )
                                    : Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.2,
                                        child:
                                            Center(child: Text("Select Image")),
                                      ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          Visibility(
                            visible: image != null,
                            child: RoundedButton(
                                text: "Upload",
                                press: () async {
                                  Map res = await _userService.updateUser(
                                      widget.userModel,
                                      image!,
                                      (sent, total) => EasyLoading.showProgress(
                                          (sent / total),
                                          status: 'Uploading'));
                                  EasyLoading.dismiss();
                                  if (res["status"]) {
                                    Resources.getSuccessToast(res["message"]);
                                    AutoRouter.of(context)
                                        .push(AccountActivePendingRoute());
                                  } else {
                                    Resources.getErrorToast(res["message"]);
                                  }
                                }),
                          )
                        ])),
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
