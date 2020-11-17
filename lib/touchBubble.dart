import 'package:flutter/material.dart';

class TouchBubble extends StatelessWidget {
  TouchBubble({
    @required this.position,
    @required this.onStartDragging, //novo
    @required this.onDrag,          //novo
    @required this.onEndDragging,   //novo
    @required this.bubbleSize,      //novo
  })  : assert(onStartDragging != null),              //novo
        assert(onDrag != null),                       //novo
        assert(onEndDragging != null),                //novo
        assert(bubbleSize != null && bubbleSize > 0); //novo

  final Offset position;
  final double bubbleSize;
  final Function onStartDragging; //novo
  final Function onDrag;          //novo
  final Function onEndDragging;   //novo

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: position == null ? 0 : position.dy - bubbleSize / 2,
        left: position == null ? 0 : position.dx - bubbleSize / 2,
        child: GestureDetector(
            onPanStart: (details) => onStartDragging(details.globalPosition), //novo
            onPanUpdate: (details) => onDrag(details.globalPosition),         //novo
            onPanEnd: (_) => onEndDragging(),                                 //novo
            child: Container(
              width: bubbleSize,
              height: bubbleSize,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).accentColor.withOpacity(0.5)),
            )));
  }
}
