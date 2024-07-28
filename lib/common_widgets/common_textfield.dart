import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants/app_colors.dart';

class CommonTextField extends StatelessWidget {
  final String? labelText;
  final Widget? suffix;
  final TextEditingController? controller;
  void Function(String)? onChanged;
  String? Function(String?)? validator;
  final bool? readOnly;
  final IconData? prefixIcon;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final String? prefixText;
  final int? maxLength;
  CommonTextField(
      {super.key,
      this.onChanged,
  required this.prefixIcon,    this.readOnly,
      this.validator,
      this.keyboardType,
      this.inputFormatters,
      required this.labelText,
      this.suffix,
      this.prefixText,
        this.maxLength,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: TextFormField(
        keyboardType: keyboardType,
        controller: controller,
        inputFormatters: inputFormatters,
        readOnly: readOnly ?? false,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: validator,
        maxLength: maxLength,
        onChanged: onChanged,
        decoration: InputDecoration(
          focusColor: Colors.white,
          prefixText: prefixText,
          counterText: '',
          prefixIcon:  Icon(
            prefixIcon,
            color: Colors.blueGrey,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.blue, width: 1.0),
            borderRadius: BorderRadius.circular(10.0),
          ),
          suffix: suffix,
          fillColor: AppColors.grey,
          labelText: labelText,
          labelStyle: const TextStyle(
            color: Colors.blueGrey,
            fontSize: 16,
            fontFamily: "verdana_regular",
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
