import 'package:dio/dio.dart';

class ResponseParser<T> {
  Future<List<T>> parseItems(Response response, Function jsonMap) async {
    if (response.statusCode == 200) {
      final responseJson = response.data;
      return List.from(responseJson.map((m) => jsonMap(m) as T));
    } else {
      return Future.error(
        "Error while fetching.",
        StackTrace.fromString(response.statusMessage),
      );
    }
  }

  List<T> parseItemsSync(Response response, Function jsonMap) {
    if (response.statusCode == 200) {
      final responseJson = response.data;
      return List.from(responseJson.map((m) => jsonMap(m) as T));
    } else {
      return List.empty();
    }
  }

  Future<T> parseItem(Response response, Function jsonMap) async {
    if (response.statusCode == 200) {
      final responseJson = response.data;
      return jsonMap(responseJson) as T;
    } else {
      return Future.error(
        "Error while fetching.",
        StackTrace.fromString(response.statusMessage),
      );
    }
  }
}
