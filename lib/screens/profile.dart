import 'package:engsinapp_flutter/models/bank.dart';
import 'package:engsinapp_flutter/models/user.dart';
import 'package:engsinapp_flutter/resources/constants.dart';
import 'package:engsinapp_flutter/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _formKey = GlobalKey<FormBuilderState>(debugLabel: "Profile");
  bool _isEditable = false;
  @override
  void initState() {
    super.initState();
    Resources.appbartitleStream.add("Profile");
  }

  Future<UserModel> getUser() async {
    UserModel _user = UserModel(
        createdAt: "1212",
        email: "email",
        name: "firstName",
        id: 1,
        isActive: true,
        isDeleted: false,
        updatedAt: "123123",
        username: "username",
        bankModel: BankModel(
            accountNumber: "123123213",
            bank: "BOC",
            branch: "Galle City",
            cardHolderName: "Kasun Nirmala",
            id: "123123123"));
    return _user;
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
                  child: Icon(
                    FontAwesomeIcons.userCircle,
                    size: 100,
                  ),
                ),
                Expanded(
                    flex: 5,
                    child: SingleChildScrollView(
                        child: FutureBuilder<UserModel>(
                            future: getUser(),
                            builder: (context, snapshot) {
                              return snapshot.hasData
                                  ? FormBuilder(
                                      key: _formKey,
                                      child: Column(children: <Widget>[
                                        FormBuilderTextField(
                                          enabled: _isEditable,
                                          name: 'name',
                                          initialValue: snapshot.data?.name,
                                          decoration: InputDecoration(
                                            labelText: 'Name',
                                          ),
                                        ),
                                        FormBuilderTextField(
                                          enabled: _isEditable,
                                          name: 'email',
                                          initialValue: snapshot.data?.email,
                                          decoration: InputDecoration(
                                            labelText: 'Email',
                                          ),
                                        ),
                                        FormBuilderTextField(
                                          enabled: _isEditable,
                                          name: 'mobNo',
                                          initialValue:
                                              snapshot.data?.mobileNumber,
                                          decoration: InputDecoration(
                                            labelText: 'Mobile Number',
                                          ),
                                        ),
                                        FormBuilderTextField(
                                          enabled: _isEditable,
                                          name: 'address',
                                          initialValue: snapshot.data?.address,
                                          decoration: InputDecoration(
                                            labelText: 'Address',
                                          ),
                                        ),
                                        Divider(),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 5, vertical: 15),
                                          child: Container(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  "PROMO CODE",
                                                  style: kH4HeaderStyle,
                                                ),
                                                Card(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            5.0),
                                                    child: Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        SelectableText(
                                                          "234324234",
                                                          style: kH2HeaderStyle,
                                                        ),
                                                        SizedBox(
                                                          width: 10,
                                                        ),
                                                        IconButton(
                                                            onPressed: () {
                                                              Clipboard.setData(
                                                                  ClipboardData(
                                                                      text:
                                                                          "234324234"));
                                                              ScaffoldMessenger
                                                                      .of(
                                                                          context)
                                                                  .showSnackBar(
                                                                      SnackBar(
                                                                          content:
                                                                              Text('PromoCode is copied')));
                                                            },
                                                            icon: Icon(
                                                                FontAwesomeIcons
                                                                    .copy))
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Divider(),
                                        Center(
                                            child: Text(
                                          "Bank Details",
                                          style: kH4HeaderStyle,
                                        )),
                                        FormBuilderTextField(
                                          enabled: _isEditable,
                                          name: 'accountName',
                                          initialValue: snapshot
                                              .data?.bankModel?.cardHolderName,
                                          decoration: InputDecoration(
                                            labelText: "Account Holder's Name",
                                          ),
                                        ),
                                        FormBuilderTextField(
                                          enabled: _isEditable,
                                          name: 'accountNo',
                                          initialValue: snapshot
                                              .data?.bankModel?.accountNumber,
                                          decoration: InputDecoration(
                                            labelText: "Account Number",
                                          ),
                                        ),
                                        FormBuilderTextField(
                                          enabled: _isEditable,
                                          name: 'bank',
                                          initialValue:
                                              snapshot.data?.bankModel?.bank,
                                          decoration: InputDecoration(
                                            labelText: "Bank",
                                          ),
                                        ),
                                        FormBuilderTextField(
                                          enabled: _isEditable,
                                          name: 'branch',
                                          initialValue:
                                              snapshot.data?.bankModel?.branch,
                                          decoration: InputDecoration(
                                            labelText: "Branch",
                                          ),
                                        ),
                                      ]),
                                    )
                                  : Center(
                                      child: CircularProgressIndicator(),
                                    );
                            })))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
