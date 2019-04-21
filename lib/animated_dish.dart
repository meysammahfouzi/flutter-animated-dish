import 'package:flutter/material.dart';
import 'dart:math' as math;

class AnimatedDish extends StatefulWidget {
  @override
  AnimatedDishState createState() {
    return new AnimatedDishState();
  }
}

class AnimatedDishState extends State<AnimatedDish>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation _animation;
  bool _isComingIn;

  @override
  void initState() {
    super.initState();
    _isComingIn = true;
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    _animation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.fastOutSlowIn,
    ));

    _animation.addStatusListener(listener);

    _controller.forward();
  }

  void listener(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      _isComingIn = false;
      _animation.removeStatusListener(listener);
      _controller.reset();
      _animation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: _controller,
        curve: Curves.fastOutSlowIn,
      ));
      _controller.forward();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final dishWidth = MediaQuery.of(context).size.width * 4 / 6;
    return AnimatedBuilder(
      animation: _animation,
      child: SizedBox(
        width: dishWidth,
        child: Image.asset("assets/images/dish-food.png"),
      ),
      builder: (BuildContext context, Widget child) {
        print(_animation.value);
        return Transform.translate(
          child: Transform.rotate(
            angle: _animation.value * 2.0 * math.pi,
            child: child,
          ),
          offset: Offset(
            _animation.value * dishWidth * 2,
            (_isComingIn ? -1 : 1) * _animation.value * dishWidth,
          ),
        );
      },
    );
  }
}
