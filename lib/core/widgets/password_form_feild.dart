import 'package:bookia/core/styles/colors.dart';
import 'package:flutter/material.dart';

class PasswordFormFeild extends StatefulWidget {
  const PasswordFormFeild({
    super.key,

    this.validator,
    required this.hintText,
    this.keyboardType,
    this.onTap,
  });
  final String hintText;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final Function()? onTap;

  @override
  State<PasswordFormFeild> createState() => _PasswordFormFeildState();
}

class _PasswordFormFeildState extends State<PasswordFormFeild> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      keyboardType: widget.keyboardType,
      validator: widget.validator,
      onChanged: (value) {},
      onTap: widget.onTap,

      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      decoration: InputDecoration(
        suffixIcon: IconButton(
          color: AppColors.greyColor,
          onPressed: () {
            setState(() {
              obscureText = !obscureText;
            });
          },
          icon: Icon(obscureText ? Icons.visibility_off : Icons.remove_red_eye),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: AppColors.primaryColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColors.borderColor),
        ),
        hintText: widget.hintText,
        hintStyle: TextStyle(color: AppColors.darkGreyColor),
        fillColor: AppColors.borderColor,
        filled: true,
      ),
    );
  }
}
