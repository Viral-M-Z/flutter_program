
import 'package:flutter/material.dart';
import 'package:flutter_program/common_utils/app_colors.dart';
import 'package:sizer/sizer.dart';

class Utils {

  static ScaffoldFeatureController message(String body, BuildContext context, {bool? error = false}) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        body,
        style: TextStyle(
          fontSize: 16.sp,
        ),
      ),
      backgroundColor: error == true ? colorError : colorSuccess,
    ));
  }

}
