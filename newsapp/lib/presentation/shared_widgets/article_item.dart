import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsapp/data/entities/article/article_model.dart';

class ArticleItem extends StatefulWidget {
  final Article article;

  const ArticleItem({Key key, this.article}) : super(key: key);

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
            BoxShadow(
              color: Colors.black45,
              blurRadius: 10,
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
                child: widget.article.urlToImage != null
                    ? Image.network(
                        widget.article.urlToImage,
                        fit: BoxFit.fitWidth,
                      )
                    : FittedBox(
                        child:
                            Image.asset('assets/images/news-default-image.png'),
                        fit: BoxFit.fitWidth,
                      )),
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
                      widget.article.source,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w300),
                    ),
                    Text(
                      widget.article.title,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
