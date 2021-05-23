import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/data/entities/article/article_model.dart';
import 'package:newsapp/domain/blocs/search_screen_bloc/search_bloc.dart';
import 'package:newsapp/domain/blocs/search_screen_bloc/search_event.dart';
import 'package:newsapp/domain/blocs/search_screen_bloc/search_state.dart';
import 'package:newsapp/presentation/helpers/scroll_behavior.dart';
import 'package:newsapp/presentation/scenes/main_screen/local_widgets/articles_list.dart';
import 'package:newsapp/presentation/scenes/search_screen/local_widgets/search_bar.dart';
import 'package:newsapp/presentation/shared_widgets/article_items_list.dart';
import 'package:newsapp/presentation/shared_widgets/neap_appbar.dart';
import 'package:newsapp/presentation/styles/neap_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';

class SearchScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen>
    with SingleTickerProviderStateMixin {
  _SearchScreenState();

  List<Article> searchResults = List();
  TextEditingController _searchTextController = new TextEditingController();
  FocusNode _searchFocusNode = new FocusNode();
  Animation _animation;
  AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: Duration(milliseconds: 200),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
      reverseCurve: Curves.easeInOut,
    );
    _searchFocusNode.addListener(() {
      if (!_animationController.isAnimating) {
        _animationController.forward();
      }
    });
  }

  void _cancelSearch() {
    _searchTextController.clear();
    _searchFocusNode.unfocus();
    _animationController.reverse();
  }

  void _clearSearch() {
    _searchTextController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(builder: (context, state) {
      if (state is NewsFound) {
        this.searchResults = state.articles;
      }
      if (this.searchResults.isNotEmpty) {
        return CupertinoPageScaffold(
            child: SafeArea(
                child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 15.h),
              child: appBar(),
            ),
            ArticleItemsList(articles: this.searchResults)
          ],
        )));
      } else {
        return CupertinoPageScaffold(
            child: SafeArea(
                child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 15.h),
              child: appBar(),
            ),
            Container()
          ],
        )));
      }
    });
  }

  Widget appBar() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          height: 80.h,
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Padding(
            padding: EdgeInsets.only(top: 35.h, left: 15.w),
            child: Text(
              'search'.tr(),
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35.sp),
            ),
          ),
        ),
        IOSSearchBar(
          controller: _searchTextController,
          focusNode: _searchFocusNode,
          animation: _animation,
          onCancel: _cancelSearch,
          onClear: _clearSearch,
          onSubmit: onSubmit,
        ),
      ],
    );
  }

  void onSubmit(String query) {
    BlocProvider.of<SearchBloc>(context).add(SearchNews(query));
  }
}
