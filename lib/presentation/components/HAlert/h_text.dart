import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HText extends StatelessWidget {
  final String text;
  final TextAlign? textAlign;
  final TextStyle? style;
  final TextOverflow? textOverflow;

  HText({
    Key? key,
    required this.text,
    this.textAlign,
    this.style,
    this.textOverflow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: textOverflow ?? TextOverflow.ellipsis,
      style: TextStyle(
        color: const Color(0xFFEDF2F7),
        fontSize: 14.sp,
        fontWeight: FontWeight.normal,
        fontStyle: FontStyle.normal,
      ).merge(style),
      textAlign: textAlign ?? TextAlign.left,
    );
  }
}
