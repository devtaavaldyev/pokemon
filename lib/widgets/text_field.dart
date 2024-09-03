// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:pocemons_app/themes/app_colors.dart';

import '../themes/text_styles.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    Key? key,
    required this.onChanged,
  }) : super(key: key);

  final Function(String name) onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      cursorColor: AppColors.fieldText,
      style: AppTextStyles.poppins14w500,
      decoration: InputDecoration(
        hintText: 'Search Here...',
        hintStyle: AppTextStyles.poppins14w500,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(8),
        ),
        fillColor: AppColors.itemPoints,
        filled: true,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 0,
        ),
      ),
    );
  }
}
