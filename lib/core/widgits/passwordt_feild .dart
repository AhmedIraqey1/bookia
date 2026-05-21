import 'package:flutter/material.dart';

class PasswordFeild extends StatefulWidget {
  // 1. خليناه يستقبل الـ controller من بره
  const PasswordFeild({super.key, required this.hintText, this.controller});
  
  final String hintText;
  final TextEditingController? controller; // 2. تعريف المتغير

  @override
  State<PasswordFeild> createState() => _PasswordFeildState();
}

class _PasswordFeildState extends State<PasswordFeild> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller, // 3. ربطناه بالـ controller المبعوت من بره
      keyboardType: TextInputType.visiblePassword,
      obscureText: obscureText,
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      decoration: InputDecoration(
        hintText: widget.hintText,
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              obscureText = !obscureText; // 4. هنا الـ setState بتغير العين بس بدون ما تمسح النص
            });
          },
          icon: obscureText
              ? const Icon(Icons.visibility_off)
              : const Icon(Icons.remove_red_eye),
        ),
      ),
    );
  }
}