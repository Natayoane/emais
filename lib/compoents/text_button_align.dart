import 'package:flutter/material.dart';

class TextButtonAlign extends StatelessWidget {
  final String label;
  final void Function()? onPressed;

  const TextButtonAlign({Key? key, required this.label, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.centerRight,
        child: TextButton(
        onPressed: onPressed,
        child: Text(
          label,
        style: const TextStyle(
        color: Colors.white,
        fontSize: 14,
        decoration: TextDecoration.underline,
    ),
      textAlign: TextAlign.end,
    )
    ));
  }
}
