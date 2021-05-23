import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:newsapp/data/api/rest/responses/source/source_response.dart';

class SourceListResponse extends Equatable {
  final List<SourceResponse> data;

  SourceListResponse({@required this.data});

  factory SourceListResponse.fromJSON(json) {
    final List<dynamic> data = json['sources'];
    var sources = List<SourceResponse>();

    data.forEach((element) {
      sources.add(SourceResponse.fromJSON(element));
    });

    return SourceListResponse(data: sources);
  }

  @override
  List<Object> get props => [data];
}
