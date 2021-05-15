import 'package:flutter/cupertino.dart';
import 'package:newsapp/presentation/scenes/main_screen/local_widgets/category_button.dart';
import 'package:easy_localization/easy_localization.dart';

class CategoriesList extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _CategoriesListState();
}

class _CategoriesListState extends State<CategoriesList> {

  List<String> labels = ['business'.tr(),
    'entertainment'.tr(),
    'general'.tr(),
    'health'.tr(),
    'science'.tr(),
    'sports'.tr(),
    'technology'.tr(),
  ];

  @override
  Widget build(BuildContext context) {
    List<Widget> children = labels.map((e) => CategoryButton(label: e,)).toList();
    return Column(
      children: children,
    );
  }


}