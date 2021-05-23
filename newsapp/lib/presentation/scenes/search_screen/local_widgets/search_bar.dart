import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:newsapp/presentation/styles/neap_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';

class IOSSearchBar extends AnimatedWidget {
  IOSSearchBar({
    Key key,
    @required Animation<double> animation,
    @required this.controller,
    @required this.focusNode,
    this.onCancel,
    this.onClear,
    this.onSubmit,
    this.onUpdate,
  })  : assert(controller != null),
        assert(focusNode != null),
        super(key: key, listenable: animation);
  /// The text editing controller to control the search field
  final TextEditingController controller;
  /// The focus node needed to manually unfocus on clear/cancel
  final FocusNode focusNode;
  /// The function to call when the "Cancel" button is pressed
  final Function onCancel;
  /// The function to call when the "Clear" button is pressed
  final Function onClear;
  /// The function to call when the text is updated
  final Function(String) onUpdate;
  /// The function to call when the text field is submitted
  final Function(String) onSubmit;
  static final _opacityTween = new Tween(begin: 1.0, end: 0.0);
  static final _paddingTween = new Tween(begin: 0.0, end: 60.0);
  static final _kFontSize = 13.0;
  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: Material(
        color: Colors.white,
          child: Row(children: <Widget>[
            Expanded(
                child: Container(
                    padding:
                    EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
                    height: 35.h,
                    decoration: BoxDecoration(
                      color: NeapColors.searchBarGray,
                      border:
                      Border.all(width: 0.0, color: NeapColors.searchBarGray),
                      borderRadius: BorderRadius.circular(14.sp),
                    ),
                    child: Stack(alignment: Alignment.centerLeft, children: <Widget>[
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                                padding:
                                EdgeInsets.fromLTRB(0.0, 0.0, 4.0, 1.0),
                                child: Icon(
                                  CupertinoIcons.search,
                                  color: CupertinoColors.inactiveGray,
                                  size: 20.sp,
                                ))
                          ]),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(left: 15.w),
                                child: TextField(
                                  decoration: InputDecoration(
                                      contentPadding: EdgeInsets.all(10.sp),
                                      hintText: 'search'.tr(),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                        BorderSide(color: Colors.transparent),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide:
                                          BorderSide(color: Colors.transparent))),
                                  controller: controller,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15.sp,
                                  ),
                                  autocorrect: false,
                                  focusNode: focusNode,
                                  onChanged: onUpdate,
                                  onSubmitted: onSubmit,
                                  cursorColor: CupertinoColors.black,
                                ),
                              ),
                            ),
                            CupertinoButton(
                                minSize: 10.sp,
                                padding: EdgeInsets.all(1.sp),
                                child: Icon(
                                  CupertinoIcons.clear_thick_circled,
                                  size: 23.sp,
                                  color: CupertinoColors.inactiveGray,
                                ),
                                onPressed: () {
                                  if (animation.isDismissed)
                                    return;
                                  else
                                    onClear();
                                })
                          ])
                    ]))),
            SizedBox(
                width: _paddingTween.evaluate(animation),
                child: CupertinoButton(
                    padding: EdgeInsets.only(left: 8.w),
                    onPressed: onCancel,
                    child: Text('cancel'.tr(),
                        softWrap: false,
                        style: TextStyle(
                          inherit: false,
                          color: CupertinoColors.black,
                          fontSize: _kFontSize,
                        ))))
          ])),
    );
  }
}