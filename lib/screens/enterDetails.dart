import 'package:auto_route/auto_route.dart';
import 'package:engsinapp_flutter/resources/constants.dart';
import 'package:engsinapp_flutter/resources/resources.dart';
import 'package:engsinapp_flutter/route/appRouter.gr.dart';
import 'package:engsinapp_flutter/widgets/LoginSignup/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class EnterDetailsScreen extends StatefulWidget {
  const EnterDetailsScreen({Key? key}) : super(key: key);

  @override
  _EnterDetailsScreenState createState() => _EnterDetailsScreenState();
}

class _EnterDetailsScreenState extends State<EnterDetailsScreen> {
  final _formKey = GlobalKey<FormBuilderState>(debugLabel: "Details");

  @override
  void initState() {
    super.initState();
    Resources.appbartitleStream.add("Fill Profile");
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
                          FormBuilderTextField(
                            name: 'name',
                            decoration: InputDecoration(labelText: "Name"),
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(context),
                            ]),
                          ),
                          FormBuilderTextField(
                            name: 'nic',
                            decoration: InputDecoration(labelText: "NIC"),
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(context),
                            ]),
                          ),
                          FormBuilderTextField(
                            name: 'address',
                            decoration: InputDecoration(labelText: "Address"),
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(context),
                            ]),
                          ),
                          FormBuilderTextField(
                            name: 'mobileNo',
                            decoration:
                                InputDecoration(labelText: "Mobile Number"),
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(context),
                            ]),
                          ),
                          FormBuilderTextField(
                            name: 'promo',
                            decoration:
                                InputDecoration(labelText: "Promo Code"),
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(context),
                            ]),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Divider(),
                          SizedBox(
                            height: 10,
                          ),
                          FormBuilderTextField(
                            name: 'holderName',
                            decoration:
                                InputDecoration(labelText: "Holder Name"),
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(context),
                            ]),
                          ),
                          FormBuilderTextField(
                            name: 'accountNumber',
                            decoration:
                                InputDecoration(labelText: "Account Number"),
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(context),
                            ]),
                          ),
                          FormBuilderTextField(
                            name: 'bank',
                            decoration: InputDecoration(labelText: "Bank"),
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(context),
                            ]),
                          ),
                          FormBuilderTextField(
                            name: 'branch',
                            decoration: InputDecoration(labelText: "Branch"),
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(context),
                            ]),
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          RoundedButton(
                              text: "Next",
                              press: () {
                                AutoRouter.of(context).push(
                                    UploadSlipScreenRoute(
                                        userModel: Resources.userModel));
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
