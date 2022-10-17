import 'package:country_code_picker/country_code_picker.dart';
import 'package:ecyc/login_and_register/forget_password/otp.dart';
import 'package:ecyc/login_and_register/otp_page.dart';
import 'package:flutter/material.dart';

class ForgotPage extends StatefulWidget {
  var phoneNo;
  ForgotPage({this.phoneNo});

  @override
  State<ForgotPage> createState() => _ForgotPageState();
}

class _ForgotPageState extends State<ForgotPage> {
  String dialCodeDigits = "+91";
  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 150,
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Center(
              child: Text("Phone OTP Authentication"),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          SizedBox(
            width: 400,
            height: 60,
            child: CountryCodePicker(
              onChanged: (country) {
                setState(() {
                  dialCodeDigits = country.dialCode!;
                });
              },
              initialSelection: "IT",
              showCountryOnly: false,
              showOnlyCountryWhenClosed: false,
              favorite: ["+91"],
            ),
          ),
          Container(
              margin: EdgeInsets.only(top: 10, right: 10, left: 10),
              child: Text('')),
          Container(
            margin: EdgeInsets.all(15),
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Otp_Page(
                            phone: _controller.text,
                            codeDigits: dialCodeDigits)));
              },
              child: Text('Next'),
            ),
          )
        ],
      )),
    );
  }
}
