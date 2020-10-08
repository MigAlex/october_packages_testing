import 'dart:math';

import 'package:flutter/material.dart';

class HomeAnimatedContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [FollowButton(), RandomButtonWidget()],
      ),
    );
  }
}

class FollowButton extends StatefulWidget {
  @override
  _FollowButtonState createState() => _FollowButtonState();
}

class _FollowButtonState extends State<FollowButton> {
  bool isSmall = true;
  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () {
          setState(() {
            isSmall = !isSmall;
          });
        },
        child: Center(
          child: AnimatedContainer(
            duration: Duration(milliseconds: 300),
            curve: Curves.easeIn,
            width: isSmall ? 50 : 200,
            height: 50,
            child: isSmall ? buildShrinked() : buildStretched(),
          ),
        ),
      );

  Widget buildStretched() => Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.red, width: 2.5),
          borderRadius: BorderRadius.circular(24),
        ),
        child: Center(
          child: FittedBox(
            child: Text(
              'FOLLOW',
              style: TextStyle(color: Colors.red, letterSpacing: 1.5),
            ),
          ),
        ),
      );

  Widget buildShrinked() => Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25), color: Colors.red),
        child: Icon(Icons.people, color: Colors.white),
      );
}

class RandomButtonWidget extends StatefulWidget {
  @override
  _RandomButtonWidgetState createState() => _RandomButtonWidgetState();
}

class _RandomButtonWidgetState extends State<RandomButtonWidget> {
  static const double minSize = 50;
  static const double maxSize = 200;

  Color color = Colors.green;
  double width = maxSize;
  double height = maxSize;
  BorderRadius borderRadius = BorderRadius.zero;

  @override
  Widget build(BuildContext context) => Column(
        children: [
          Container(
            color: Colors.black.withOpacity(0.1),
            width: maxSize,
            height: maxSize,
            child: Center(
              child: AnimatedContainer(
                duration: Duration(milliseconds: 500),
                curve: Curves.easeInBack,
                width: width,
                height: height,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: borderRadius,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          RaisedButton(
            shape: StadiumBorder(),
            color: Colors.red,
            child: Text('Do Magic!', style: TextStyle(color: Colors.white)),
            onPressed: () {
              final random = Random();

              /// Color
              final red = random.nextInt(255);
              final green = random.nextInt(255);
              final blue = random.nextInt(255);
              final color = Color.fromRGBO(red, green, blue, 1);

              /// Size
              final size = generateSize();

              /// BorderRadius
              final borderRadius =
                  BorderRadius.circular(random.nextDouble() * 80);

              setState(() {
                this.color = color;
                this.width = size.width;
                this.height = size.height;
                this.borderRadius = borderRadius;
              });
            },
          ),
        ],
      );

  Size generateSize() {
    final random = Random();

    final addMax = maxSize.toInt() - minSize.toInt();
    final width = minSize + random.nextInt(addMax);
    final height = minSize + random.nextInt(addMax);

    return Size(width, height);
  }
}
