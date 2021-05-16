import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/data/api/navigation/navigation_data_service.dart';

abstract class NavigationState extends Equatable {
  const NavigationState();

  @override
  List<Object> get props => [];
}

class NavigationInitial extends NavigationState {}

class ScreensLoaded extends NavigationState {
  final List<BottomBarItem> screens;

  ScreensLoaded({@required this.screens});

  ScreensLoaded copyWith({List<Widget> screens}) {
    return ScreensLoaded(
      screens: screens ?? this.screens,
    );
  }

  @override
  List<Object> get props => [screens];
}

class OpenedBottomBarItem extends NavigationState {

  final BottomBarItem item;

  OpenedBottomBarItem({@required this.item});

  OpenedBottomBarItem copyWith({BottomBarItem item}) {
    return OpenedBottomBarItem(
      item: item ?? this.item,
    );
  }

  @override
  List<Object> get props => [item];
}