import 'package:flutter/material.dart';
import '../const/const.dart';

const gapHeight = 15.0;
const iconSizeBig = 80.0;

class BasicCardChildren extends StatelessWidget {
  BasicCardChildren({required this.icon, required this.text});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: iconSizeBig,
        ),
        const SizedBox(
          height: gapHeight,
          width: double.infinity,
        ),
        Text( text,
          style: const TextStyle(
            fontSize: 18.0,
            color: kFontColorCard,
          ),
        )
      ],
    );
  }
}
