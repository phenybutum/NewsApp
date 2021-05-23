import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/data/entities/article/article_model.dart';

abstract class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

class SearchInitial extends SearchState {}

class NewsFound extends SearchState {
  final List<Article> articles;

  NewsFound({@required this.articles});

  NewsFound copyWith({List<Article> articles}) {
    return NewsFound(
      articles: articles ?? this.articles,
    );
  }

  @override
  List<Object> get props => [articles];
}
