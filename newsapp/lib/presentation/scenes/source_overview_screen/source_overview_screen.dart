import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/data/entities/article/article_model.dart';
import 'package:newsapp/data/entities/source/source_model.dart';
import 'package:newsapp/domain/blocs/main_screen_bloc/main_screen_bloc.dart';
import 'package:newsapp/domain/blocs/main_screen_bloc/main_screen_event.dart';
import 'package:newsapp/domain/blocs/main_screen_bloc/main_screen_state.dart';
import 'package:newsapp/domain/repositories/categories_repository.dart';
import 'package:newsapp/domain/repositories/news_repository.dart';
import 'package:newsapp/presentation/helpers/scroll_behavior.dart';
import 'package:newsapp/presentation/shared_widgets/article_items_list.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';

class SourceOverviewScreen extends StatefulWidget {
  final Source source;

  const SourceOverviewScreen({Key key, this.source}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SourceOverviewScreenState();
}

class _SourceOverviewScreenState extends State<SourceOverviewScreen> {
  NewsBloc _bloc;
  List<Article> articles = List();

  void initState() {
    this._bloc = NewsBloc(RepositoryProvider.of<CategoriesRepository>(context),
        RepositoryProvider.of<NewsRepository>(context))
      ..add(LoadNewsFromSource(widget.source));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsBloc, NewsState>(
        cubit: _bloc,
        builder: (context, state) {
          if (state is SourceOverviewScreenLoaded) {
            this.articles = state.headlines;
          }
          if (this.articles.isNotEmpty) {
            return Scaffold(
                appBar: CupertinoNavigationBar(
                  backgroundColor: Colors.white,
                  leading: Row(
                    children: [
                      CupertinoNavigationBarBackButton(
                        onPressed: () => Navigator.of(context).pop(),
                        color: Colors.black87,
                      ),
                      Text('sources'.tr()),
                    ],
                  ),
                  trailing: CupertinoButton(
                    padding: EdgeInsets.only(bottom: 1.h),
                    onPressed: () => print('redirect to browser here'),
                    //TODO: 14-implement-open-in-browser-feature
                    child: Icon(
                      CupertinoIcons.compass,
                      color: Colors.black87,
                      size: 30.sp,
                    ),
                  ),
                ),
                body: SafeArea(
                    child: Align(
                        alignment: Alignment.center,
                        child: Container(
                            color: Colors.white,
                            child: ScrollConfiguration(
                              behavior: MyBehavior(),
                              child: ListView(
                                physics: BouncingScrollPhysics(
                                    parent: AlwaysScrollableScrollPhysics()),
                                children: [
                                  header(),
                                  Container(
                                    height: 20.h,
                                    color: Colors.white,
                                  ),
                                  ArticleItemsList(
                                    articles: this.articles,
                                  ),
                                ],
                              ),
                            )))));
          } else {
            return Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    height: 40.sp,
                    width: 40.sp,
                    child: CircularProgressIndicator(
                      valueColor:
                          new AlwaysStoppedAnimation<Color>(Colors.black87),
                    )),
              ],
            );
          }
        });
  }

  Widget header() {
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.source.name,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35.sp)),
            SizedBox(
              height: 30.h,
            ),
            Text(widget.source.description,
                style:
                    TextStyle(fontWeight: FontWeight.normal, fontSize: 18.sp))
          ],
        ),
      ),
    );
  }
}
