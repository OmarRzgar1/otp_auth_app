import 'package:flutter/material.dart';

class afterOtpScreen extends StatelessWidget {
  static const screenRoute = "afterOtpScreen";

  const afterOtpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaQueryData sizze = MediaQuery.of(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        bottomNavigationBar: BottomNavigationBar(items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.bookmark), label: "Bookmark"),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_box), label: "Account"),
        ]),
        backgroundColor: Colors.white,
        body: Container(
          child: Center(
              child: Text(
            'Loading!',
            style: TextStyle(fontSize: 40),
          )),
        ),
      ),
    );
  }
}
