import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_sequence_animation/flutter_sequence_animation.dart';

class HomeAnimationCC extends StatefulWidget {
  @override
  _HomeAnimationCCState createState() => _HomeAnimationCCState();
}

class _HomeAnimationCCState extends State<HomeAnimationCC>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  SequenceAnimation sequenceAnimation;

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1200));
    sequenceAnimation = SequenceAnimationBuilder()
        .addAnimatable(
            animatable: Tween<double>(begin: 1.0, end: 0.45),
            from: const Duration(milliseconds: 0),
            to: const Duration(milliseconds: 600),
            tag: 'scale')
        .addAnimatable(
            animatable: Tween<double>(begin: 0, end: 0.25),
            from: const Duration(milliseconds: 480),
            to: const Duration(milliseconds: 600),
            tag: 'rotate')
        .addAnimatable(
            animatable: Tween<double>(begin: 0.9, end: 1.0),
            from: const Duration(milliseconds: 600),
            to: const Duration(milliseconds: 1200),
            tag: 'bouncing',
            curve: Curves.elasticOut)
        .animate(animationController);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ScaleTransition(
          scale: sequenceAnimation['scale'],
          child: RotationTransition(
            turns: sequenceAnimation['rotate'],
            child: ScaleTransition(
              scale: sequenceAnimation['bouncing'],
              child: BuildCard(onTapped: handleAnimation),
            ),
          ),
        ),
      ),
    );
  }

  void handleAnimation() {
    animationController.isCompleted
        ? animationController.reverse()
        : animationController.forward();
  }
}

class BuildCard extends StatelessWidget {
  final Function onTapped;

  const BuildCard({Key key, this.onTapped}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Transform(
        transform: Matrix4.identity()..rotateZ(-pi / 2),
        alignment: Alignment.center,
        child: Image.asset('assets/images/card.png', fit: BoxFit.fill),
      ),
      onTap: onTapped,
    );
  }
}
