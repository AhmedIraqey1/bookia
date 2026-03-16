import 'package:bookia/core/styles/colors.dart';
import 'package:flutter/material.dart';

class CustomFormFeild extends StatefulWidget {
  const CustomFormFeild({
    super.key,
    this.textInputType,
    this.validator,
    this.onTap,
    required this.hintText,
    TextEditingController? controller,
  }) : _controller = controller;
  final TextInputType? textInputType;
  final String? Function(String?)? validator;
  final Function()? onTap;
  final String hintText;
  final TextEditingController? _controller;

  @override
  State<CustomFormFeild> createState() => _CustomFormFeildState();
}

class _CustomFormFeildState extends State<CustomFormFeild> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget._controller,
      // textInputAction: TextInputAction.search,
      keyboardType: widget.textInputType,
      validator: widget.validator,

      onChanged: (value) {},
      onTap: widget.onTap,

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
        hintText: widget.hintText,
        hintStyle: TextStyle(color: AppColors.darkGreyColor),
        fillColor: AppColors.borderColor,
        filled: true,
      ),
    );
  }
}
