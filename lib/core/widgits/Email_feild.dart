import 'package:bookia/core/functions/validations.dart';
import 'package:flutter/material.dart';

class EmailFeild extends StatelessWidget {
  // 1. خليناه يستقبل الـ controller هنا من بره الـ ويدجت
  const EmailFeild({super.key, required this.hintText, this.controller});
  
  final String hintText;
  final TextEditingController? controller; // 2. تعريف المتغير

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller, // 3. ربطناه هنا بالـ TextFormField بدل القديم
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
        if (!isEmail(input)) {
          return 'Please enter a valid Email (e.g., name@domain.com)';
        }
        return null;
      },
    );
  }
}