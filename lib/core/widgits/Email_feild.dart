import 'package:bookia/core/functions/validations.dart';
import 'package:flutter/material.dart';

class EmailFeild extends StatelessWidget {
  const EmailFeild({super.key, required this.hintText});
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: TextEditingController(),
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(hintText: hintText),
      validator: (input) {
        if (input == null || input.isEmpty) {
          return 'Please enter your Email';
        }

        // استخدام الدالة اللي إنت عرفتها في ملف Validations
        if (!isEmail(input)) {
          return 'Please enter a valid Email (e.g., name@domain.com)';
        }

        // لو كل حاجة تمام بنرجع null
        return null;
      },
    );
  }
}
