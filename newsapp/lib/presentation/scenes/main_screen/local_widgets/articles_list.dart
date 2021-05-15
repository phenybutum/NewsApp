import 'package:flutter/cupertino.dart';
import 'package:newsapp/data/entities/article/article_model.dart';
import 'package:newsapp/presentation/scenes/main_screen/local_widgets/articles_list_item.dart';
import 'package:newsapp/presentation/shared_widgets/article_item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ArticlesList extends StatefulWidget {
  List<Article> articles = [
    Article(
        title: 'Hello1',
        source: 'Darkness my old friend',
        urlToImage:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTVeH1tNV_O5QLuWpO4kDZgSdLnXtYIn1DrJQ&usqp=CAU'),
    Article(title: 'Hello2',
        source: 'Darkness my old friend',
        urlToImage:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTVeH1tNV_O5QLuWpO4kDZgSdLnXtYIn1DrJQ&usqp=CAU')
  ];

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
