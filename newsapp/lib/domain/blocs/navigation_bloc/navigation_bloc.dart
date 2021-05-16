import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/domain/repositories/navigation_repository.dart';
import 'navigation_event.dart';
import 'navigation_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  final NavigationRepository _repository;

  NavigationBloc(this._repository) : super(NavigationInitial());

  @override
  Stream<NavigationState> mapEventToState(NavigationEvent event) async* {
    if (event is LoadScreens) {
      yield* _mapLoadTabs(event);
    }
    if (event is OpenBottomBarItem) {
      yield* _mapOpenBottomBarItem(event);
    }
  }

  Stream<NavigationState> _mapLoadTabs(LoadScreens event) async* {
    final screens = _repository.itemsList();
    yield ScreensLoaded(screens: screens);
  }

  Stream<NavigationState> _mapOpenBottomBarItem(OpenBottomBarItem event) async* {
    yield OpenedBottomBarItem(item: event.item);
  }
}
