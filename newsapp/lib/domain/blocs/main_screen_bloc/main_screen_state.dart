import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/data/entities/article/article_model.dart';

abstract class MainScreenState extends Equatable {
  const MainScreenState();

  @override
  List<Object> get props => [];
}

class MainScreenInitial extends MainScreenState {}

class MainScreenLoaded extends MainScreenState {
  final List<String> categoriesList;
  final List<Article> headlines;

  MainScreenLoaded({@required this.categoriesList, @required this.headlines});

  MainScreenLoaded copyWith({List<String> categoriesList, List<Article> headlines}) {
    return MainScreenLoaded(
      categoriesList: categoriesList ?? this.categoriesList,
      headlines: headlines ?? this.headlines
    );
  }

  @override
  List<Object> get props => [categoriesList, headlines];
}
