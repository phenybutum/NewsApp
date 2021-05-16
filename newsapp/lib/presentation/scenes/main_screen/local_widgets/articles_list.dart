import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/data/entities/article/article_model.dart';
import 'package:newsapp/presentation/scenes/main_screen/local_widgets/articles_list_item.dart';
import 'package:newsapp/presentation/shared_widgets/article_item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ArticlesList extends StatefulWidget {
  final List<Article> articles;

  const ArticlesList({Key key, this.articles}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ArticlesListState();
}

class _ArticlesListState extends State<ArticlesList> {
  PageController _controller;

  void initState() {
    this._controller = PageController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.h,
      width: 414.w,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: PageView.builder(
                itemCount: widget.articles.length,
                controller: _controller,
                itemBuilder: (context, index) {
                  var article = widget.articles[index];
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    child: ArticlesListItem(article: article,),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
