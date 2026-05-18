import 'package:flutter/material.dart';

class MyPadding extends StatelessWidget {
  const MyPadding({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: child,
    );
  }
}
