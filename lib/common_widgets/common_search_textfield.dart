import 'package:flutter/material.dart';
import 'package:pixelapp/constants/app_colors.dart';
import 'package:textfield_search/textfield_search.dart';

class CommonSearchTextField extends StatelessWidget {
  final String? labelText;
  final TextEditingController controller;
  final List<String>? initialList;
  final IconData? prefixIcon;
  const CommonSearchTextField({super.key,required this.prefixIcon, required this.labelText, required this.controller, required this.initialList});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: TextFieldSearch(
        label: labelText ?? '',
        controller: controller,
        decoration: InputDecoration(
          focusColor: Colors.white,
          counterText: '',
          prefixIcon: Icon(
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
          fillColor: AppColors.grey,
          labelText: labelText ?? '',
          labelStyle: const TextStyle(
            color: Colors.blueGrey,
            fontSize: 16,
            fontFamily: "verdana_regular",
            fontWeight: FontWeight.w400,
          ),
        ),
        initialList: initialList,
      ),
    );
  }
}
