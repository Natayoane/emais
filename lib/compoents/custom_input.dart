import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomInput extends StatefulWidget {
  final IconData icon;
  final String label;
  final bool isSecret;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  final TextEditingController? controller;

  const CustomInput({
    Key? key,
    required this.icon,
    required this.label,
    this.isSecret = false,
    this.controller,
    this.inputFormatters,
    this.validator,
  }) : super(key: key);

  @override
  State<CustomInput> createState() => _CustomInputState();
}

class _CustomInputState extends State<CustomInput> {
  bool isObscure = false;

  @override
  void initState() {
    super.initState();
    isObscure = widget.isSecret;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextFormField(
        controller: widget.controller,
        inputFormatters: widget.inputFormatters,
        obscureText: isObscure,
        validator: widget.validator,
        decoration: InputDecoration(
          prefixIcon: Icon(widget.icon, color: Colors.white,),
          suffixIcon: widget.isSecret
              ? IconButton(
            icon:
            Icon(isObscure ? Icons.visibility : Icons.visibility_off, color: Colors.white,),
            onPressed: () {
              setState(() {
                isObscure = !isObscure;
              });
            },
          )
              : null,
          labelText: widget.label,
          labelStyle: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
            fontSize: 20,
          ),
          isDense: true,
          enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: Color.fromARGB(150, 255, 255, 255),
                width: 1,
              )),

          // border: OutlineInputBorder(
          //   borderRadius: BorderRadius.circular(18),
          // ),
        ),
        style: const TextStyle(fontSize: 20, color: Colors.white),
      ),
    );
  }
}
