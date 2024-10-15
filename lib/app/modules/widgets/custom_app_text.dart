import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms_boilerplate/app/common/values/styles/text_theme_style.dart';

class MyText extends StatelessWidget {
  final String data;
  final Color? color;
  final double? size;
  final TextAlign? textAlign;
  final FontWeight? fontWeight;
  final int? maxLines;
  final TextOverflow? overFlow;
  final TextStyle? style;

  const MyText({
    required this.data,
    super.key,
    this.color,
    this.textAlign,
    this.fontWeight,
    this.maxLines,
    this.overFlow,
    this.size,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      textAlign: textAlign,
      maxLines: maxLines,
      textDirection: TextDirection.ltr,
      overflow: overFlow,
      style: style ??
          context.body1?.copyWith(
            color: color,
            fontSize: size ?? 16.sp,
            fontWeight: fontWeight,
          ),
    );
  }
}
