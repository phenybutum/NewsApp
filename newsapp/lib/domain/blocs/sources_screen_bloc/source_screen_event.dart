import 'package:equatable/equatable.dart';

abstract class SourcesScreenEvent extends Equatable {
  const SourcesScreenEvent();

  @override
  List<Object> get props => [];
}

class LoadSources extends SourcesScreenEvent {}

