
import 'package:flutter/material.dart';
import 'package:flutter_program/common_utils/app_colors.dart';
import 'package:sizer/sizer.dart';


class ElevatedBtn extends StatefulWidget {

  final bool? circularBtn;

  final double? circularBtnRadius;
  final double? width;
  final double? height;
  final String? btnText;
  final double? borderRadius;
  final double? borderWidth;
  final double? elevation;

  final Color? bgColor;
  final Color? splashColor;
  final Color? borderColor;
  final OutlinedBorder? shape;
  final BorderRadiusGeometry? customBorderRadius;
  final Widget? btnWidget;
  final AlignmentGeometry? alignmentBtn;

  final VoidCallback? onPress;

  const ElevatedBtn({
    super.key,
    this.circularBtn,
    this.circularBtnRadius,
    this.width,
    this.height,
    this.btnText,
    this.borderRadius,
    this.borderWidth,
    this.elevation,

    this.bgColor,
    this.splashColor,
    this.borderColor,
    this.shape,
    this.customBorderRadius,
    this.btnWidget,
    this.alignmentBtn,

    this.onPress,
  });

  @override
  State<ElevatedBtn> createState() => _ElevatedBtnState();
}

class _ElevatedBtnState extends State<ElevatedBtn> {

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: ElevatedButton(
        onPressed: widget.onPress,
        style: ElevatedButton.styleFrom(
          backgroundColor: widget.bgColor,
          foregroundColor: widget.splashColor ?? (colorWhite),
          shape: widget.shape ?? RoundedRectangleBorder(
            side: BorderSide(
              width: widget.borderWidth ?? 1.sp,
              color: widget.borderColor ?? Colors.transparent
            ),
            borderRadius: widget.customBorderRadius ?? BorderRadius.circular(widget.borderRadius ?? 0.sp),
          ),
          elevation: widget.elevation ?? 1.sp,
          alignment: widget.alignmentBtn ?? Alignment.center,
        ),
        child: widget.btnWidget ?? Text(
          widget.btnText ?? "",
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

