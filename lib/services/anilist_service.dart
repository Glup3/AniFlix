import 'dart:async';

import 'package:graphql_flutter/graphql_flutter.dart';

import 'package:anilife/data/queries.dart' as queries;

class AniListService {

  static GraphQLClient client = GraphQLClient(
    link: HttpLink(uri: 'https://graphql.anilist.co'),
    cache: InMemoryCache(),
  );

  static Future waitWhile(bool test(), [Duration pollInterval = Duration.zero]) {
    Completer completer = Completer();
    check() {
      if (!test()) {
        completer.complete();
      } else {
        Timer(pollInterval, check);
      }
    }

    check();
    return completer.future;
  }

  static Future<List<dynamic>> getMediaQueryWithFilters(Map<String, dynamic> variables) async {
    QueryResult result = await client.query(QueryOptions(document: queries.getMediaQueryWithFilters, variables:variables));
    return _waitingForData(result);
  }

  static Future<List<dynamic>> _waitingForData(QueryResult result) async {
    if (result.errors != null) { return result.errors; }

    await waitWhile(() => result.loading);

    return result.data['Page']['media'];
  }
}
