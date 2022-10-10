import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final void Function()? onPressed;
  final bool? loading;

  const CustomButton(
      {Key? key,
      required this.label,
      required this.onPressed,
      this.loading = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32),
          ),
          primary: const Color.fromARGB(255, 91, 205, 250)),
      onPressed: onPressed,
      child: loading!
          ? CircularProgressIndicator()
          : Text(
              label,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 18,
              ),
              textAlign: TextAlign.center,
            ),
    );
  }
}
