
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';

class MyTextField extends StatefulWidget {
  const MyTextField({
    super.key,
    required this.controller,

    this.height,
    this.width,
    this.child,
    this.header,
    this.hintText,

    this.headingFontSize,
    this.contentPadding,
    // this.crossAxisAlignment,

    this.validator,
    this.keyboardType,
    this.inputFormatters,
  });

  final TextEditingController controller;
  final double? height;
  final double? width;
  final Widget? child;
  final String? header;
  final String? hintText;

  final double? headingFontSize;
  final EdgeInsetsGeometry? contentPadding;
  // final CrossAxisAlignment? crossAxisAlignment;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;

  final String? Function(String?)? validator;

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: widget.controller,
        validator: widget.validator,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        keyboardType: widget.keyboardType ?? TextInputType.text,
        inputFormatters: widget.inputFormatters ?? [],



        onTapOutside: (event) {
          // print("event: #$event");
          FocusManager.instance.primaryFocus?.unfocus();
        },

        decoration: InputDecoration(
          labelText: widget.header ?? "",
          hintText: widget.hintText ?? '',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.sp),
            borderSide: BorderSide(width: 1.sp,),
          ),
          contentPadding: widget.contentPadding ?? const EdgeInsets.fromLTRB(12, 8, 12, 6),
        ),
      );
  }
}

