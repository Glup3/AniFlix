import 'dart:async';

import 'package:graphql_flutter/graphql_flutter.dart';

import 'package:anilife/data/queries.dart' as queries;
import 'package:anilife/util/string_helper.dart';

import 'package:anilife/enums/media_season.dart';
import 'package:anilife/enums/media_format.dart';



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

  static Future<List<dynamic>> getMediasOfSeason(int pageNumber, int pageSize,
      int seasonYear, MediaSeason season, MediaFormat format) async {
    QueryResult result = await client.query(
      QueryOptions(
        document: queries.getMediaOfSeason,
        variables: {
          'page': pageNumber,
          'perPage': pageSize,
          'seasonYear': seasonYear,
          'season': StringHelper.getStringValueOfEnum(season),
          'format': StringHelper.getStringValueOfEnum(format),
        },
      ),
    );

    //TODO error handling
    if (result.errors != null) {
      return result.errors;
    }

    await waitWhile(() => result.loading);

    return result.data['Page']['media'];
  }

  static Future<List<dynamic>> getMostPopularManga(int pageNumber, int pageSize) async {
    QueryResult result = await client.query(
      QueryOptions(
        document: queries.getMostPopularManga,
        variables: {
          'page': pageNumber,
          'perPage': pageSize,
        },
      ),
    );

    //TODO error handling
    if (result.errors != null) {
      return result.errors;
    }

    await waitWhile(() => result.loading);

    return result.data['Page']['media'];
  }
}
