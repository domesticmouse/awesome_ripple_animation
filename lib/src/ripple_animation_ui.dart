import 'dart:async';

import 'package:awesome_ripple_animation/src/ripple_model.dart';
import 'package:flutter/material.dart';
class RippleAnimation extends StatefulWidget {
   RippleAnimation({
    Key? key,
   required this.child,
   required this.minRadius,
    this.color= Colors.teal,
    this.repeat=false,
    this.delay=const Duration(milliseconds: 0),
    this.duration=const Duration(milliseconds: 2300),
    this.ripplesCount=60,

  }) : super(key: key);
  final Widget child;
   Duration delay;
  final double minRadius;
  Color color;
  final int ripplesCount;
  final Duration duration;
  final bool repeat;

  @override
  State<RippleAnimation> createState() => _RippleAnimationState();
}

class _RippleAnimationState extends State<RippleAnimation> with TickerProviderStateMixin {
  Widget get child=>widget.child;
  double get radius=>widget.minRadius;
  Duration get delay =>widget.delay;
  Duration get duration =>widget.duration;
  bool get repeat =>widget.repeat;
  Color get color=> widget.color;
  int get rippleCount=> widget.ripplesCount;
  AnimationController ? animationController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomPaint(
        painter: AnimatedCircle(
          animationController,
          minRadius: radius,
          wavesCount: rippleCount +2 ,
          color: color,
          key: UniqueKey()
        ),
        child: child,
      )
    );
  }

  @override
  void initState() {
    animationController=AnimationController(vsync: this, duration:duration);
    // TODO: implement initState
    Timer(delay, (){
      repeat?animationController!.repeat(): animationController!.forward();
    });
    super.initState();
  }

  @override
  void dispose() {
    animationController!.dispose();
    // TODO: implement dispose
    super.dispose();
  }
}
