import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/data/entities/source/source_model.dart';
import 'package:newsapp/domain/blocs/sources_screen_bloc/source_screen_bloc.dart';
import 'package:newsapp/domain/blocs/sources_screen_bloc/source_screen_state.dart';
import 'package:newsapp/presentation/helpers/scroll_behavior.dart';
import 'package:newsapp/presentation/scenes/main_screen/local_widgets/categories_list.dart';
import 'package:newsapp/presentation/scenes/source_overview_screen/source_overview_screen.dart';
import 'package:newsapp/presentation/shared_widgets/neap_appbar.dart';
import 'package:newsapp/presentation/styles/neap_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';

class SourcesScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SourcesScreenState();
}

class _SourcesScreenState extends State<SourcesScreen> {

  List<Source> sources = List();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SourcesScreenBloc, SourcesScreenState>(
        builder: (context, state) {
      if (state is SourcesLoaded) {
        this.sources = state.sourcesList;
      }

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
                              TextButtonsList(
                                labels: formLabels(),
                                onButtonTap: redirectToOverview,
                              ),
                              Container(
                                height: 40.h,
                                color: NeapColors.gray,
                              ),
                            ],
                          ),
                        )))));

    });
  }

  List<String> formLabels() {
    List<String> labels = List();
    this.sources.forEach((element) {
      labels.add(element.name);
    });
    return labels;
  }

  void redirectToOverview() => Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => SourceOverviewScreen()));
}
