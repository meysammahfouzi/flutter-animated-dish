import 'package:flutter/material.dart';
import 'package:logo/animated_dish.dart';
import 'package:logo/shape_painter.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomPaint(
          painter: ShapePainter(),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).size.height / 5,
              ),
              Center(
                child: AnimatedDish(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
