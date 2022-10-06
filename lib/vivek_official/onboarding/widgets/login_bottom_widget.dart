import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_sample/vivek_official/models/phone_number_register.dart';
import 'package:flutter_sample/vivek_official/screens/otp_verification_screen.dart';

class LoginBottomBar extends StatefulWidget {
  LoginBottomBar({Key? key}) : super(key: key);

  @override
  State<LoginBottomBar> createState() => _LoginBottomBarState();
}

class _LoginBottomBarState extends State<LoginBottomBar> {
  final _form = GlobalKey<FormState>();

  String? _mobileNumber;
  bool isShow = false;
  bool isButtonEnabled = false;
  bool _termsCondition = false;

  String? validateMyInput(String? value) {
    if (value == null) {
      return 'Please Enter Mobile Number';
    }
    if (value.isEmpty) {
      return 'Please Enter Mobile Number';
    }
    String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'Enter Valid Mobile Number';
    } else {
      return null;
    }
  }

  void _saveForm() {
    final isValid = _form.currentState?.validate();
    if (isValid == null || !isValid) {
      isShow = false;
      isButtonEnabled = false;
      setState(() {});
      return;
    } else {
      isShow = true;
      isButtonEnabled = true;
      setState(() {});
    }
    _form.currentState?.save();
  }

  void _isPhoneNumberRegistered(BuildContext context) async {
    String baseUrl = 'https://staging.zadinga.dev/';
    String endPoint = 'api/v1/Authentication/IsRegisteredPhoneNumber';
    var body = jsonEncode({'phoneNumber': "+91$_mobileNumber", 'region': "IN"});
    try {
      final response = await http.post(Uri.parse(baseUrl + endPoint),
          body: body,
          headers: {
            "Accept": "application/json",
            "content-type": "application/json"
          });

      if (response.statusCode == 200) {
        print(response.body);
        isShow = false;
        _showProgressBar();
        final Map map = jsonDecode(response.body);
        final phoneNumberRegisteredReponse =
            PhoneNumberRegisteredReponse.fromJson(map);
        if (!phoneNumberRegisteredReponse.data!.isRegistered) {
          setState(() {
            _termsCondition = true;
          });
        } else {
          setState(() {
            _termsCondition = false;
          });
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Something went wrong"),
        ));
        print(response.body);
        isShow = false;
        _showProgressBar();
      }
    } on SocketException {
      isShow = false;
      _showProgressBar();
      throw Exception('No Internet Connection');
    }
  }

  void _showProgressBar() {
    setState(() {});
  }

  void _sendOtpOnSms(BuildContext context) async {
    String baseUrl = 'https://staging.zadinga.dev/';
    String endPoint = 'api/v1/Authentication/SendOTPViaSMS';
    // final body =json.encode();
    var body = jsonEncode({'phoneNumber': "+91$_mobileNumber", 'region': "IN"});
    try {
      final response = await http.post(Uri.parse(baseUrl + endPoint),
          body: body,
          headers: {
            "Accept": "application/json",
            "content-type": "application/json"
          });

      if (response.statusCode == 200) {
        print(response.body);
        Navigator.of(context).pushNamed(OtpVerificationScreen.routeName);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Something went wrong"),
        ));
        print(response.body);
      }
    } on SocketException {
      throw Exception('No Internet Connection');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      fit: FlexFit.loose,
      child: Form(
        key: _form,
        child: Container(
          // height:
          //     (mediaQuery.size.height - mediaQuery.padding.top - 80) *
          //         0.3,
          color: const Color(0xfffE5E5E5),
          child: Card(
            elevation: 10,
            color: Colors.white,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
              ),
            ),
            child: Container(
              alignment: FractionalOffset.bottomCenter,
              // height: (mediaQuery.size.height - mediaQuery.padding.top) * 0.3,
              padding: const EdgeInsets.only(
                left: 25,
                right: 25,
                bottom: 15,
                top: 30,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Get Started with Zadinga',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'OpenSans'),
                  ),
                  Stack(
                    children: [
                      TextFormField(
                        onChanged: (value) {
                          _mobileNumber = value;
                          _saveForm();
                        },
                        onFieldSubmitted: (value) {
                          _mobileNumber = value;
                          _saveForm();
                        },
                        keyboardType: TextInputType.number,
                        maxLength: 10,
                        decoration: const InputDecoration(
                          hintStyle: TextStyle(
                            fontSize: 16,
                            fontFamily: 'OpenSans',
                          ),
                          hintText: 'Enter mobile number',
                          counterText: '',
                        ),
                        validator: (value) {
                          return validateMyInput(value);
                        },
                        onSaved: (value) {
                          _mobileNumber = value;
                          isShow = true;
                          _showProgressBar();
                          _isPhoneNumberRegistered(context);
                        },
                      ),
                      if (isShow) const CircularProgressIndicator(),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 30),
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: (isButtonEnabled
                          ? () => {_sendOtpOnSms(context)}
                          : null),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 13),
                        primary: isButtonEnabled
                            ? const Color(0xfff81a713)
                            : const Color(0xfffC4C4C4),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        textStyle: const TextStyle(
                            fontSize: 14, fontFamily: 'OpenSans'),
                      ),
                      child: const Text(
                        'Request Otp',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'OpenSans',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
