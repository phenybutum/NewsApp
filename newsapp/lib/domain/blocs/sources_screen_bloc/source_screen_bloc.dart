import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/domain/blocs/sources_screen_bloc/source_screen_event.dart';
import 'package:newsapp/domain/blocs/sources_screen_bloc/source_screen_state.dart';
import 'package:newsapp/domain/repositories/sources_repository.dart';

class SourcesScreenBloc extends Bloc<SourcesScreenEvent, SourcesScreenState> {
  final SourcesRepository _sourcesRepository;

  SourcesScreenBloc(this._sourcesRepository) : super(SourcesScreenInitial());

  @override
  Stream<SourcesScreenState> mapEventToState(SourcesScreenEvent event) async* {
    if (event is LoadSources) {
      yield* _mapLoadSources(event);
    }
  }

  Stream<SourcesScreenState> _mapLoadSources(LoadSources event) async* {
    final sourcesList = await _sourcesRepository.getSources();
    yield SourcesLoaded(sourcesList: sourcesList);
  }
}