import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsapp/data/entities/article/article_model.dart';

class ArticlesListItem extends StatefulWidget {
  final Article article;

  const ArticlesListItem({Key key, this.article}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ArticlesListItemState();
}

class _ArticlesListItemState extends State<ArticlesListItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async => await _launchURL(widget.article.url),
      child: Container(
          height: 300.h,
          width: 382.w,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                ),
                height: 300.h,
                width: 382.w,
                child: Image.network(
                  widget.article.urlToImage,
                  fit: BoxFit.fitWidth,
                ),
              ),
              Container(
                height: 300.h,
                width: 382.w,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.6),
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
                        widget.article.source ?? ' ',
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
          )),
    );
  }

  _launchURL(String url) async => await canLaunch(url)
      ? await launch(url, forceWebView: true)
      : throw 'Could not launch $url';
}
