import 'package:flutter/material.dart';

Checkbox customCheckBox(
    {required void Function(bool?)? onChanged, required bool value}) {
  return Checkbox(
    activeColor: Colors.blue,
    value: value,
    onChanged: onChanged,
    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    visualDensity: VisualDensity.compact,
    side: const BorderSide(color: Color(0xff808194)),
  );
}
