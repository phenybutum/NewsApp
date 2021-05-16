import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/presentation/styles/neap_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NeapAppBar extends StatelessWidget {

  final String label;

  const NeapAppBar({Key key, @required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
    width: double.infinity,
    height: 120.h,
    decoration: BoxDecoration(
        color: NeapColors.gray,
        border: Border(
            bottom: BorderSide(
                color: Colors.grey, width: 0.3))),
    child: Padding(
      padding: EdgeInsets.only(top: 55.h, left: 15.w),
      child: Text(
        label,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 35.sp),
      ),
    ),
  );

}