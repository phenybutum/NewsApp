import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:newsapp/data/entities/source/source_model.dart';
import 'package:newsapp/presentation/scenes/sourse_screen/local_widgets/source_text_button.dart';

class SourcesButtonsList extends StatefulWidget {
  final List<Source> sources;

  const SourcesButtonsList({Key key, @required this.sources}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SourcesButtonsListState();
}

class _SourcesButtonsListState extends State<SourcesButtonsList> {
  @override
  Widget build(BuildContext context) {
    List<Widget> children =
        widget.sources.map((e) => SourceTextButton(source: e)).toList();
    return Container(
      color: Colors.white,
      child: Column(
        children: children,
      ),
    );
  }
}
