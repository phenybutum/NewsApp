import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/data/entities/article/article_model.dart';

abstract class NewsState extends Equatable {
  const NewsState();

  @override
  List<Object> get props => [];
}

class MainScreenInitial extends NewsState {}

class MainScreenLoaded extends NewsState {
  final List<String> categoriesList;
  final List<Article> headlines;

  MainScreenLoaded({@required this.categoriesList, @required this.headlines});

  MainScreenLoaded copyWith(
      {List<String> categoriesList, List<Article> headlines}) {
    return MainScreenLoaded(
        categoriesList: categoriesList ?? this.categoriesList,
        headlines: headlines ?? this.headlines);
  }

  @override
  List<Object> get props => [categoriesList, headlines];
}

class SourceOverviewScreenLoaded extends NewsState {
  final List<Article> headlines;

  SourceOverviewScreenLoaded({@required this.headlines});

  SourceOverviewScreenLoaded copyWith(
      {List<Article> headlines}) {
    return SourceOverviewScreenLoaded(headlines: headlines ?? this.headlines);
  }

  @override
  List<Object> get props => [headlines];
}
