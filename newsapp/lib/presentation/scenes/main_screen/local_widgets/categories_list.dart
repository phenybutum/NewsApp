import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:newsapp/presentation/scenes/main_screen/local_widgets/category_button.dart';

class TextButtonsList extends StatefulWidget {

  final List<String> labels;

  const TextButtonsList({Key key, @required this.labels}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TextButtonsListState();
}

class _TextButtonsListState extends State<TextButtonsList> {

  @override
  Widget build(BuildContext context) {
    List<Widget> children = widget.labels.map((e) => TextedButton(label: e,)).toList();
    return Container(
      color: Colors.white,
      child: Column(
        children: children,
      ),
    );
  }


}