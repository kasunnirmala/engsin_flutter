import 'package:auto_route/auto_route.dart';
import 'package:engsinapp_flutter/models/user.dart';
import 'package:engsinapp_flutter/resources/constants.dart';
import 'package:engsinapp_flutter/resources/resources.dart';
import 'package:engsinapp_flutter/route/appRouter.gr.dart';
import 'package:engsinapp_flutter/widgets/LoginSignup/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class UploadSlipScreen extends StatefulWidget {
  final UserModel userModel;
  const UploadSlipScreen(this.userModel);

  @override
  _UploadSlipScreenState createState() => _UploadSlipScreenState();
}

class _UploadSlipScreenState extends State<UploadSlipScreen> {
  final _formKey = GlobalKey<FormBuilderState>(debugLabel: "Upload");
  @override
  void initState() {
    super.initState();
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
                          // FormBuilderImagePicker(
                          //   name: 'name',
                          //   decoration: InputDecoration(labelText: "Name"),
                          //   validator: FormBuilderValidators.compose([
                          //     FormBuilderValidators.required(context),
                          //   ]),
                          // ),
                          SizedBox(
                            height: 50,
                          ),
                          RoundedButton(
                              text: "Upload",
                              press: () {
                                AutoRouter.of(context)
                                    .push(AccountActivePendingRoute());
                              })
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
