import 'package:flutter/material.dart';
import '../const/const.dart';

class ReusableWidget extends StatelessWidget {
  ReusableWidget({required this.colour, required this.child, });

  final Color colour;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(kBasicMargin),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(kBasicRadius),
        color: colour,
        border: Border.all(width: 1.0, color: Colors.white),
      ),
      child: child,
    );
  }
}