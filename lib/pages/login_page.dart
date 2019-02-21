import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            SizedBox(
              height: 100,
            ),
            Center(
              child: Text(
                'Logo',
                style: TextStyle(fontSize: 50, fontFamily: "Courier"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
