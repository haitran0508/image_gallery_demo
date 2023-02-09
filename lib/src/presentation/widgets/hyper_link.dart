import 'package:flutter/material.dart';

class HyperLink extends StatelessWidget {
  final String text;

  const HyperLink(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        color: Colors.blue,
        decoration: TextDecoration.underline,
      ),
    );
  }
}
