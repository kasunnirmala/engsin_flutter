import 'package:auto_route/auto_route.dart';
import 'package:engsinapp_flutter/models/payment.dart';
import 'package:engsinapp_flutter/resources/constants.dart';
import 'package:engsinapp_flutter/resources/resources.dart';
import 'package:engsinapp_flutter/services/balanceService.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class BalanceScreen extends StatefulWidget {
  const BalanceScreen({Key? key}) : super(key: key);

  @override
  _BalanceScreenState createState() => _BalanceScreenState();
}

class _BalanceScreenState extends State<BalanceScreen> {
  late BalanceService _balanceService;
  final _formKey = GlobalKey<FormBuilderState>(debugLabel: "Profile");
  @override
  void initState() {
    super.initState();
    _balanceService = BalanceService(context);
    Resources.appbartitleStream.add("Balance");
  }

  Future<double> getMyBalance() async {
    return await _balanceService.getMyBalance();
  }

  Future<List<PaymentModel?>> getAllMyRequests() async {
    List<PaymentModel?> _payments = await _balanceService.getAllMyPayments();
    return _payments;
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
                    "Balance",
                    style: kH1HeaderStyle,
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: FutureBuilder<double>(
                      future: getMyBalance(),
                      builder: (context, snapshot) {
                        return snapshot.hasData
                            ? FormBuilder(
                                key: _formKey,
                                child: Column(
                                  children: [
                                    Text(
                                        "You hace : LKR ${snapshot.data} to request."),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    FormBuilderTextField(
                                      name: 'amount',
                                      decoration: InputDecoration(
                                        labelText: 'Amount',
                                      ),
                                      validator: FormBuilderValidators.compose([
                                        FormBuilderValidators.required(context),
                                        FormBuilderValidators.numeric(context),
                                        FormBuilderValidators.max(
                                            context, snapshot.data!),
                                      ]),
                                      keyboardType: TextInputType.number,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    ElevatedButton(
                                        onPressed: () async {
                                          if (_formKey.currentState!
                                              .saveAndValidate()) {
                                            EasyLoading.show(
                                                status: "Requesting");
                                            var resp = await _balanceService
                                                .requestPayment(double.tryParse(
                                                        _formKey.currentState!
                                                            .value["amount"]) ??
                                                    0);
                                            EasyLoading.dismiss();
                                            if (resp["status"]) {
                                              Resources.getSuccessToast(
                                                  resp["message"]);
                                              AutoRouter.of(context).pop();
                                            } else {
                                              Resources.getErrorToast(
                                                  resp["message"]);
                                            }
                                          } else {}
                                        },
                                        child: Text("Request"))
                                  ],
                                ),
                              )
                            : Container();
                      }),
                ),
                Expanded(
                    flex: 8,
                    child: FutureBuilder<List<PaymentModel?>>(
                        future: getAllMyRequests(),
                        builder: (context, snapshot) {
                          return snapshot.hasData
                              ? ListView.builder(
                                  itemCount: snapshot.data?.length,
                                  itemBuilder: (context, index) {
                                    return _BalanceCard(
                                      size: size,
                                      amount:
                                          "${snapshot.data?[index]?.amount}",
                                      description:
                                          "${snapshot.data![index]!.paidStatus ? 'Paid' : 'Pending'}",
                                    );
                                  })
                              : Container();
                        })),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _BalanceCard extends StatelessWidget {
  final Size size;
  final String amount;
  final String description;
  const _BalanceCard(
      {Key? key,
      required this.size,
      required this.amount,
      required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: size.width * 0.9,
              height: size.height * 0.15,
              child: Card(
                  color: kSecondaryColor,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "රු. $amount",
                          style: kH1HeaderStyle,
                        ),
                        Text(
                          "$description",
                          style: kH3HeaderStyle,
                        ),
                      ],
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
