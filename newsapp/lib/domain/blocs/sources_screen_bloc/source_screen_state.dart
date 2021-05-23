import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/data/entities/source/source_model.dart';

abstract class SourcesScreenState extends Equatable {
  const SourcesScreenState();

  @override
  List<Object> get props => [];
}

class SourcesScreenInitial extends SourcesScreenState {}

class SourcesLoaded extends SourcesScreenState {
  final List<Source> sourcesList;

  SourcesLoaded({@required this.sourcesList});

  SourcesLoaded copyWith({List<Source> sourcesList}) {
    return SourcesLoaded(
      sourcesList: sourcesList ?? this.sourcesList,
    );
  }

  @override
  List<Object> get props => [sourcesList];
}
