import 'package:flutter/cupertino.dart';
import 'package:newsapp/presentation/helpers/scroll_behavior.dart';
import 'package:newsapp/presentation/scenes/main_screen/local_widgets/categories_list.dart';
import 'package:newsapp/presentation/shared_widgets/neap_appbar.dart';
import 'package:newsapp/presentation/styles/neap_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';

class SourcesScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SourcesScreenState();
}

class _SourcesScreenState extends State<SourcesScreen>{
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        child: SafeArea(
            child: Align(
                alignment: Alignment.center,
                child: Container(
                    color: NeapColors.gray,
                    child: ScrollConfiguration(
                      behavior: MyBehavior(),
                      child: ListView(
                        physics: BouncingScrollPhysics(
                            parent: AlwaysScrollableScrollPhysics()),
                        children: [
                          NeapAppBar(label: 'sources'.tr()),
                          TextButtonsList(labels: ['business'.tr(),
                            'entertainment'.tr(),
                            'general'.tr(),
                            'health'.tr(),
                            'science'.tr(),
                            'sports'.tr(),
                            'technology'.tr(),
                          ]),
                          Container(
                            height: 40.h,
                            color: NeapColors.gray,
                          ),
                        ],
                      ),
                    )))));
  }

}