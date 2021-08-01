import 'dart:typed_data';
import 'package:auto_route/auto_route.dart';
import 'package:engsinapp_flutter/models/bank.dart';
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

class EnterBankDetaillScreen extends StatefulWidget {
  final UserModel userModel;
  const EnterBankDetaillScreen(this.userModel);

  @override
  _EnterBankDetaillScreenState createState() => _EnterBankDetaillScreenState();
}

class _EnterBankDetaillScreenState extends State<EnterBankDetaillScreen> {
  final _formKey = GlobalKey<FormBuilderState>(debugLabel: "Upload");
  XFile? image;
  final ImagePicker _picker = ImagePicker();
  late UserService _userService;
  @override
  void initState() {
    super.initState();
    _userService = UserService(context);
    Resources.appbartitleStream.add("Bank Details");
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
                        child: Column(children: <Widget>[
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
                              text: "Save",
                              press: () async {
                                if (_formKey.currentState!.saveAndValidate()) {
                                  BankModel _bankModal = BankModel(
                                      cardHolderName: _formKey
                                          .currentState?.value["holderName"],
                                      accountNumber: _formKey
                                          .currentState?.value["accountNumber"],
                                      bank:
                                          _formKey.currentState?.value["bank"],
                                      branch: _formKey
                                          .currentState?.value["branch"]);
                                  widget.userModel.bankModel = _bankModal;
                                  var resp = await _userService
                                      .updateUser(widget.userModel);
                                  if (resp["status"]) {
                                    AutoRouter.of(context)
                                        .replace(AccountActivePendingRoute());
                                  } else {}
                                }
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
