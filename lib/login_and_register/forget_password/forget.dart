// import 'package:country_code_picker/country_code_picker.dart';
// import 'package:ecyc/login_and_register/forget_password/otp.dart';
// import 'package:ecyc/login_and_register/otp_page.dart';
// import 'package:flutter/material.dart';

<<<<<<< HEAD
class ForgotPage extends StatefulWidget {
  const ForgotPage({Key? key}) : super(key: key);
=======
// class ForgotPage extends StatefulWidget {
//   const ForgotPage({Key? key}) : super(key: key);
>>>>>>> b1e51ea4497c714dec7ba564504d5f4b7122fe2d

//   @override
//   State<ForgotPage> createState() => _ForgotPageState();
// }

<<<<<<< HEAD
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
            child: TextField(
              decoration: InputDecoration(
                  hintText: "Phone Number",
                  prefix: Padding(
                    padding: EdgeInsets.all(4),
                    child: Text(dialCodeDigits),
                  )),
              maxLength: 10,
              keyboardType: TextInputType.number,
              controller: _controller,
            ),
          ),
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
=======
// class _ForgotPageState extends State<ForgotPage> {
//   String dialCodeDigits = "+91";
//   TextEditingController _controller = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//           child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           SizedBox(
//             height: 150,
//           ),
//           Container(
//             margin: EdgeInsets.only(top: 10),
//             child: Center(
//               child: Text("Phone OTP Authentication"),
//             ),
//           ),
//           SizedBox(
//             height: 50,
//           ),
//           SizedBox(
//             width: 400,
//             height: 60,
//             child: CountryCodePicker(
//               onChanged: (country) {
//                 setState(() {
//                   dialCodeDigits = country.dialCode!;
//                 });
//               },
//               initialSelection: "IT",
//               showCountryOnly: false,
//               showOnlyCountryWhenClosed: false,
//               favorite: ["+91"],
//             ),
//           ),
//           Container(
//             margin: EdgeInsets.only(top: 10, right: 10, left: 10),
//             child: TextField(
//               decoration: InputDecoration(
//                   hintText: "Phone Number",
//                   prefix: Padding(
//                     padding: EdgeInsets.all(4),
//                     child: Text(dialCodeDigits),
//                   )),
//               maxLength: 12,
//               keyboardType: TextInputType.number,
//               controller: _controller,
//             ),
//           ),
//           Container(
//             margin: EdgeInsets.all(15),
//             width: double.infinity,
//             child: ElevatedButton(
//               onPressed: () {
//                 Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                         builder: (context) => Otp_Page(
//                             phone: _controller.text,
//                             codeDigits: dialCodeDigits)));
//               },
//               child: Text('Next'),
//             ),
//           )
//         ],
//       )),
//     );
//   }
// }
>>>>>>> b1e51ea4497c714dec7ba564504d5f4b7122fe2d
