import 'package:flutter/material.dart';

import '../fun/build_border.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      this.maxLines = 1,
      this.hintN,
      this.suffixIcon,
      this.onSaved,
      this.onChange,
      this.controller,
      this.keyboardType,
      this.enabled,
      this.isPassword,
      this.validator});

  final int maxLines;
  final String? hintN;
  final IconButton? suffixIcon;
  final void Function(String?)? onSaved;
  final void Function(String?)? onChange;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool? enabled;
  final bool? isPassword;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      obscureText: isPassword ?? false,
      enabled: enabled ?? true,
      keyboardType: keyboardType,
      onChanged: onChange,
      maxLines: maxLines,
      cursorColor: Colors.grey,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        contentPadding: const EdgeInsets.only(left: 10),
        hintText: hintN,
        hintStyle: const TextStyle(color: Colors.black, fontSize: 18),
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(),
        border: buildBorder(),
      ),
      onSaved: onSaved,
      controller: controller,
    );
  }
}
