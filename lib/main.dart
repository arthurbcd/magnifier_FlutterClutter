import 'package:branvier_magnifier/magnifier.dart';
import 'package:branvier_magnifier/touchBubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: SampleImage());
  }
}

class SampleImage extends StatefulWidget {
  @override
  _SampleImageState createState() => _SampleImageState();
}

class _SampleImageState extends State<SampleImage> {
  static const double touchBubbleSize = 50;

  Offset position;
  double currentBubbleSize;
  bool magnifierVisible = false;

  @override
  void initState() {
    currentBubbleSize = touchBubbleSize;
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Magnifier(
          position: position,
          visible: magnifierVisible,
          child: Image(image: AssetImage('assets/lenna.png')),
        ),
        TouchBubble(
          position: position,
          bubbleSize: currentBubbleSize,
          onStartDragging: _startDragging,
          onDrag: _drag,
          onEndDragging: _endDragging,
        ),
      ],
    );
  }
  void _startDragging(Offset newPosition) {
    setState(() {
      magnifierVisible = true;
      position = newPosition;
      currentBubbleSize = touchBubbleSize * 1.5;
    });
  }
  void _drag(Offset newPosition) {
    setState(() {
      position = newPosition;
    });
  }
  void _endDragging() {
    setState(() {
      currentBubbleSize = touchBubbleSize;
      magnifierVisible = false;
    });
  }
}
