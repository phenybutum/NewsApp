//import 'package:flutter/cupertino.dart';
//import 'package:flutter/material.dart';
//import 'package:flutter_screenutil/flutter_screenutil.dart';
//import 'package:newsapp/presentation/scenes/source_overview_screen/source_overview_screen.dart';
//import 'package:newsapp/presentation/styles/neap_colors.dart';
//
//class SourceTextButton extends StatelessWidget {
//  final String label;
//  final Function() onTap;
//
//  const SourceTextButton({Key key, this.label, this.onTap}) : super(key: key);
//
//  @override
//  Widget build(BuildContext context) {
//    return InkWell(
//      onTap: () => Navigator.of(context)
//          .push(MaterialPageRoute(builder: (context) => SourceOverviewScreen(sourceTitle: this.label,))),
//      splashColor: Colors.black26.withOpacity(0.3),
//      child: Padding(
//        padding: EdgeInsets.only(left: 15.w),
//        child: Container(
//          height: 40.h,
//          decoration: BoxDecoration(
//              color: Colors.white,
//              border: Border(bottom: BorderSide(color: Colors.grey, width: 0.2))),
//          child: Row(
//            mainAxisAlignment: MainAxisAlignment.spaceBetween,
//            crossAxisAlignment: CrossAxisAlignment.center,
//            children: [
//              Text(label, style: TextStyle()),
//              Padding(
//                padding: EdgeInsets.only(right: 20.w),
//                child: Icon(
//                  Icons.arrow_forward_ios,
//                  color: Colors.black26,
//                  size: 16.sp,
//                ),
//              ),
//            ],
//          ),
//        ),
//      ),
//    );
//  }
//}
