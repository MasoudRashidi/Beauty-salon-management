import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meta/meta.dart';
import '/core/services/color_service.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final int maxLine;
  final int maxLength;
  final double height;
  final double radius;
  final String error;
  final Widget leftIcon;
  final Widget rightIcon;
  final Function(String value) onChange;
  final Function onTap;

  MyTextField({
    @required this.controller,
    this.hint = "",
    this.height,
    this.radius = 15,
    this.error,
    this.leftIcon,
    this.rightIcon,
    this.onChange,
    this.maxLine,
    this.maxLength,
  this.onTap,
  });

  // todo: change text error handler
  Color get color => error?.length != null && error.length > 1
      ? ColorService.error
      : ColorService.secondary.shade200;

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLength: maxLength,
      controller: controller,
      onTap: onTap,
      maxLines: maxLine ?? 1,
      onChanged: onChange,
      // style: TextStyle(
      //   color: ColorService.primary.shade900
      // ),
      onEditingComplete: () => FocusScope.of(context).nextFocus(),
      // textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(
          color: ColorService.secondary.shade400,
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),
        errorText: error ?? null,
        // filled: true,
        // prefixIconConstraints: BoxConstraints.expand(height: 20.h, width: 45.w),
        prefixIcon: rightIcon,
        suffixIcon: leftIcon,
        suffixStyle: TextStyle(
            color: error?.length != null && error.length > 1
                ? ColorService.error
                : null),
        contentPadding:
            EdgeInsets.symmetric(vertical: height ?? 14.h, horizontal: 20.w),
        focusedBorder: OutlineInputBorder(
          borderSide: new BorderSide(color: color, width: 1),
          borderRadius: new BorderRadius.circular(radius),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: new BorderSide(color: color, width: 0.5),
          borderRadius: new BorderRadius.circular(radius),
        ),

        disabledBorder: OutlineInputBorder(
          borderSide: new BorderSide(color: color, width: 0.5),
          borderRadius: new BorderRadius.circular(radius),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: new BorderSide(color: color, width: 0.5),
          borderRadius: new BorderRadius.circular(radius),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: new BorderSide(color: color, width: 0.5),
          borderRadius: new BorderRadius.circular(radius),
        ),
      ),
    );
  }
}
