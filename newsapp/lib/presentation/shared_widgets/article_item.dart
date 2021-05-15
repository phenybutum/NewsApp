import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ArticleItem extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ArticleItemState();
}

class _ArticleItemState extends State<ArticleItem> {

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 250.h,
        width: 382.w,
        decoration: new BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
//            color: Colors.black,
            BoxShadow(
              color: Colors.black45,
              blurRadius: 10, // soften the shadow
              spreadRadius: 5.0,
            )
          ],
        ),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(10),
              ),
              height: 250.h,
              width: 382.w,
              child: Image.network(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTVeH1tNV_O5QLuWpO4kDZgSdLnXtYIn1DrJQ&usqp=CAU',
                fit: BoxFit.fitWidth,
              ),
            ),
            Container(
              height: 250.h,
              width: 382.w,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.3),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 15.h),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hello world but smaller',
                      style: TextStyle(color: Colors.white, fontSize: 15.sp, fontWeight: FontWeight.w300),
                    ),
                    Text(
                      'Hello world!',
                      style: TextStyle(color: Colors.white, fontSize: 20.sp, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
