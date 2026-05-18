import 'package:bookia/core/functions/validations.dart';
import 'package:flutter/material.dart';

class PasswordFeild extends StatefulWidget {
  const PasswordFeild({super.key, required this.hintText});
  final String hintText;

  @override
  State<PasswordFeild> createState() => _PasswordFeildState();
}

class _PasswordFeildState extends State<PasswordFeild> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: TextEditingController(),
      keyboardType: TextInputType.visiblePassword,
      obscureText: obscureText,
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      decoration: InputDecoration(
        hintText: widget.hintText,

        suffixIcon: IconButton(
          // icon: Icon(Icons.remove_red_eye, color: AppColors.iconsColor),
          onPressed: () {
            //Handle password visibility toggle
            setState(() {
              // Toggle obscureText value
              obscureText = !obscureText;
            });
          },
          icon: obscureText
              ? const Icon(Icons.visibility_off)
              : const Icon(Icons.remove_red_eye),
        ),
      ),
      // validator: (input) {
      //   if (input == null || input.isEmpty) {
      //     return 'Please enter your password';
      //   }

      //   // هنا بنادي على الفانكشن اللي إنت عاملها في الملف الخارجي
      //   if (!isPassword(input)) {
      //     return 'يجب أن تتكون كلمة المرور من 8 أحرف على الأقل،\nوتتضمن حرفاً كبيراً، رقماً، ورمزاً خاصاً (@#!*?&)';
      //   }

      //   // مهم جداً: لو الباسورد صح لازم نرجع null عشان الـ Validation ينجح
      //   return null;
      // },
    );
  }
}
