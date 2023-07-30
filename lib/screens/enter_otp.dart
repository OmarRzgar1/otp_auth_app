import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:otp_auth_app/screens/after_otp_entered_screen.dart';
import 'package:otp_auth_app/screens/enter_number_screen.dart';
import 'package:go_router/go_router.dart';

class enterOtpScreen extends StatefulWidget {
  @override
  State<enterOtpScreen> createState() => _enterOtpScreenState();
}

class _enterOtpScreenState extends State<enterOtpScreen> {
  final FirebaseAuth auth = FirebaseAuth.instance;

  bool isLoading = false;

  var code = "";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 150),
                child: Center(
                  child: Image.asset(
                    "assets/images/enternum.jpg",
                    width: 250,
                    height: 250,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 19),
                child: Center(
                  child: Text(
                    "Enter The Code that sent \n   to your phone number",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 80, left: 15, right: 15),
                  child: TextField(
                    keyboardType: TextInputType.phone,
                    style: TextStyle(fontSize: 24),
                    onChanged: (value) {
                      code = value;
                    },
                    decoration: InputDecoration(
                        icon: Icon(
                          Icons.numbers,
                          color: Colors.blue,
                          size: 35,
                        ),
                        hintText: "Enter The OTP here...",
                        hintStyle: TextStyle(fontSize: 21)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: isLoading
                    ? CircularProgressIndicator()
                    : OutlinedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                          elevation: MaterialStateProperty.all<double>(20),
                          fixedSize:
                              MaterialStateProperty.all(Size.fromHeight(50)),
                          side: MaterialStateProperty.all<BorderSide>(
                            BorderSide(width: 3, color: Colors.lightBlue),
                          ),
                        ),
                        onPressed: () async {
                          //  Create a PhoneAuthCredential with the code
                          setState(() {
                            isLoading = true;
                          });
                          PhoneAuthCredential credential =
                              PhoneAuthProvider.credential(
                                  verificationId: NumberEnterScreen.verify,
                                  smsCode: code);

                          // Sign the user in (or link) with the credential
                          await auth.signInWithCredential(credential);
                          Future.delayed(Duration(seconds: 4), () {
                            GoRouter.of(context).go("/afterotp");
                          });
                        },
                        child: Text(
                          "Verify OTP",
                          style: TextStyle(color: Colors.black, fontSize: 18),
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
