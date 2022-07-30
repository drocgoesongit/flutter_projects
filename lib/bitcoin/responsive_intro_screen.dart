import 'package:flutter/material.dart';

class ResponsiveIntroScreen extends StatelessWidget {
  
  ResponsiveIntroScreen({required this.MobileLayout, required this.WebLayout,});
  
  final Widget MobileLayout;
  final Widget WebLayout;
  
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context, constraints) {
          if(constraints.maxWidth < 650){
            return  MobileLayout;
          } else {
            return WebLayout;
          }
        }
    );
  }
}
