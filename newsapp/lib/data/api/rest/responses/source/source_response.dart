import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class SourceResponse extends Equatable {
  final String id;
  final String name;
  final String description;
  final String url;

  SourceResponse({
    @required this.id,
    @required this.name,
    @required this.description,
    @required this.url,
  });

  factory SourceResponse.fromJSON(json) {
    if (json == null) {return null;}
    final source = SourceResponse(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      url: json['url'],
    );
    return source;
  }

  @override
  List<Object> get props => [name, id, description, url];
}
