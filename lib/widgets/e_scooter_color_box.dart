import 'package:flutter/material.dart';

class EScooterColoredBox extends StatelessWidget {
  final Color color;
  final double width;
  final double height;
  final BorderRadius borderRadius;
  final BoxShadow boxShadow;

  const EScooterColoredBox({
    Key? key,
    required this.color,
    this.width = 35,
    this.height = 35,
    this.borderRadius = const BorderRadius.all(Radius.circular(8.0)),
    this.boxShadow = const BoxShadow(
      color: Colors.black26,
      offset: Offset(0, 2),
      blurRadius: 6.0,
    ),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: borderRadius,
        boxShadow: [boxShadow],
      ),
    );
  }
}
