import 'package:flutter/material.dart';

class MyPadding extends StatelessWidget {
  const MyPadding({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsetsGeometry.fromLTRB(25, 0, 25, 0),
      child: child,
    );
  }
}