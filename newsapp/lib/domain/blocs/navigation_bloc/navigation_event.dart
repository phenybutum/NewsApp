import 'package:equatable/equatable.dart';
import 'package:newsapp/data/api/navigation/navigation_data_service.dart';

abstract class NavigationEvent extends Equatable {
  const NavigationEvent();

  @override
  List<Object> get props => [];
}

class LoadScreens extends NavigationEvent {}

class OpenBottomBarItem extends NavigationEvent {
  final BottomBarItem item;

  OpenBottomBarItem(this.item);
}