import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/data/entities/article/article_model.dart';
import 'package:newsapp/presentation/scenes/main_screen/local_widgets/articles_list_item.dart';
import 'package:newsapp/presentation/shared_widgets/article_item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ArticleItemsList extends StatefulWidget {
  final List<Article> articles;

  const ArticleItemsList({Key key, this.articles}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ArticleItemsListState();
}

class _ArticleItemsListState extends State<ArticleItemsList> {
  PageController _controller;

  void initState() {
    this._controller = PageController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.articles.isNotEmpty) {
      return Expanded(
        child: ListView.builder(
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          itemCount: widget.articles.length,
          itemBuilder: (BuildContext context, int index) => Column(
            children: [
              SizedBox(height: 15.h,),
              Padding(
                padding: EdgeInsets.only(left: 20.w, right:  20.w,),
                child: ArticleItem(
                  article: widget.articles[index],
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      return Container();
    }
  }
}
