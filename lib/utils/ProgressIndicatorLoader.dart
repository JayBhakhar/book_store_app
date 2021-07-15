import 'dart:ui';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';

class ProgressIndicatorLoader extends StatefulWidget {
  final bool isLoading;
  final Color color;

  ProgressIndicatorLoader(this.color, this.isLoading);

  @override
  _ProgressIndicatorState createState() => _ProgressIndicatorState();
}

class _ProgressIndicatorState extends State<ProgressIndicatorLoader>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );
    _controller.repeat();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: widget.isLoading
          ? new Container(
          color: Colors.black26,
          alignment: Alignment.center,
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
            child: new Center(
                child: SizedBox(
                  height: 150,
                  width: 64,
                  child: SpinKitFadingCircle(
                    color: Colors.blueAccent,
                    size: 100.0,
                  ),
                  // LoadingFlipping.square(
                  //   backgroundColor: widget.color,
                  //   borderColor: widget.color,
                  //   size: 36.0,
                  // )
                )),
          ))
          : new Container(),
    );
  }
}