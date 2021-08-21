import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '/core/services/color_service.dart';

class MyButton extends StatelessWidget {
  final String label;
  final Function onTap;
  final double width;
  final double height;
  final double fontSize;
  final bool enable;
  final bool loading;
  final bool outLine;

  MyButton(
      {@required this.label,
      @required this.onTap,
      this.loading = false,
      this.width = 220,
      this.height = 55,
      this.fontSize = 17,
      this.enable = true,
      this.outLine = false});

  Color get color => outLine
      ? ColorService.secondary
      : enable
          ? ColorService.primary
          : ColorService.secondary.shade300;

  BoxShadow get boxShadow => outLine
      ? BoxShadow(
          color: ColorService.primary.shade100,
          offset: Offset(0, 0),
          blurRadius: 2,
          spreadRadius: 0,
        )
      : enable
          ? BoxShadow(
              color: Color(0x406338a1),
              offset: Offset(0, 0),
              blurRadius: 20,
              spreadRadius: 0)
          : BoxShadow();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: enable && !loading ? onTap : null,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        width: loading ? 55.r : this.width.w,
        alignment: Alignment.center,
        height: loading ? 55.r : this.height.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            boxShadow: [boxShadow],
            color: color),
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: loading
              ? CircularProgressIndicator(
                  color:
                      outLine ? ColorService.primary : ColorService.secondary,
                )
              : Text(
                  label,
                  style: TextStyle(
                      color: loading || outLine
                          ? ColorService.primary
                          : ColorService.secondary,
                      fontWeight: FontWeight.bold,
                      fontSize: this.fontSize.sp),
                ),
        ),
      ),
    );
  }
}
