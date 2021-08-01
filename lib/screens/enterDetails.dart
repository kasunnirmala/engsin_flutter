import 'package:auto_route/auto_route.dart';
import 'package:engsinapp_flutter/models/district.dart';
import 'package:engsinapp_flutter/models/user.dart';
import 'package:engsinapp_flutter/resources/resources.dart';
import 'package:engsinapp_flutter/route/appRouter.gr.dart';
import 'package:engsinapp_flutter/services/openService.dart';
import 'package:engsinapp_flutter/widgets/LoginSignup/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class EnterDetailsScreen extends StatefulWidget {
  const EnterDetailsScreen({Key? key}) : super(key: key);

  @override
  _EnterDetailsScreenState createState() => _EnterDetailsScreenState();
}

class _EnterDetailsScreenState extends State<EnterDetailsScreen> {
  final _formKey = GlobalKey<FormBuilderState>(debugLabel: "Details");
  UserModel _userModel = Resources.userModel;
  late OpenService _openService;
  List districts = [];
  @override
  void initState() {
    _openService = OpenService(context);
    super.initState();
    Resources.appbartitleStream.add("Fill Profile");
    getDistricts();
  }

  getDistricts() async {
    districts = await _openService.getDistricts();
    print(districts);
    setState(() {});
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
                          SizedBox(height: 10),
                          Card(
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: FormBuilderTextField(
                                name: 'promo',
                                decoration:
                                    InputDecoration(labelText: "Promo Code"),
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          FormBuilderDropdown(
                            name: 'district',
                            decoration: InputDecoration(
                              labelText: 'District',
                            ),
                            // initialValue: 'Male',
                            allowClear: true,
                            hint: Text('Select District'),
                            validator: FormBuilderValidators.compose(
                                [FormBuilderValidators.required(context)]),
                            items: districts
                                .map((district) => DropdownMenuItem(
                                      value: district["district_meta"],
                                      child: Text('${district["district"]}'),
                                    ))
                                .toList(),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          RoundedButton(
                              text: "Next",
                              press: () async {
                                if (_formKey.currentState!.saveAndValidate()) {
                                  if ((_formKey.currentState?.value["promo"]
                                          as String)
                                      .isNotEmpty) {
                                    EasyLoading.show(
                                        status: "Checking Promocode");
                                    bool res = await _openService.checkPromo(
                                        _formKey.currentState?.value["promo"]);
                                    EasyLoading.dismiss();
                                    if (!res) {
                                      Resources.getErrorToast(
                                          "Cannot Find Promo Code.");
                                      return;
                                    }
                                  }
                                  _userModel.name =
                                      _formKey.currentState?.value["name"];
                                  _userModel.nic =
                                      _formKey.currentState?.value["nic"];
                                  _userModel.address =
                                      _formKey.currentState?.value["address"];
                                  _userModel.mobileNumber =
                                      _formKey.currentState?.value["mobileNo"];
                                  _userModel.promoCode =
                                      _formKey.currentState?.value["promo"];
                                  _userModel.district = DistrictModel(
                                      district_meta: _formKey
                                          .currentState?.value["district"]);

                                  AutoRouter.of(context).push(
                                      EnterBankDetaillScreenRoute(
                                          userModel: _userModel));
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
