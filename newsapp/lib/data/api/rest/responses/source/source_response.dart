import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class SourceResponse extends Equatable {
  final String id;
  final String name;

  SourceResponse({
    @required this.id,
    @required this.name,
  });

  factory SourceResponse.fromJSON(json) {
    if (json == null) {return null;}
    final source = SourceResponse(
      id: json['id'],
      name: json['name'],
    );
    return source;
  }

  @override
  List<Object> get props => [name, id];
}
