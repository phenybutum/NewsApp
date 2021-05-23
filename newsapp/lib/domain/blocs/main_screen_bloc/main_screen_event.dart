import 'package:equatable/equatable.dart';
import 'package:newsapp/data/entities/source/source_model.dart';

abstract class NewsEvent extends Equatable {
  const NewsEvent();

  @override
  List<Object> get props => [];
}

class LoadCategories extends NewsEvent {}

class LoadNewsFromSource extends NewsEvent {
  final Source source;

  LoadNewsFromSource(this.source);

  @override
  List<Object> get props => [source];
}
