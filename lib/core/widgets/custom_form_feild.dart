import 'package:bookia/core/styles/colors.dart';
import 'package:flutter/material.dart';

class CustomFormFeild extends StatelessWidget {
  const CustomFormFeild({
    super.key,
    this.textInputType,
    this.validator,
    this.onTap,
    required this.hintText,
  });
  final TextInputType? textInputType;
  final String? Function(String?)? validator;
  final Function()? onTap;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // textInputAction: TextInputAction.search,
      keyboardType: textInputType,
      validator: validator,

      onChanged: (value) {},
      onTap: onTap,

      // readOnly: BrowserContextMenu.enabled,
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: AppColors.primaryColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColors.borderColor),
        ),
        hintText: hintText,
        hintStyle: TextStyle(color: AppColors.darkGreyColor),
        fillColor: AppColors.borderColor,
        filled: true,
      ),
    );
  }
}
