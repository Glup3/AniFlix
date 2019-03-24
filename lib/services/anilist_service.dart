import 'dart:async';

import 'package:graphql_flutter/graphql_flutter.dart';

import 'package:anilife/data/queries.dart' as queries;
import 'package:anilife/util/string_helper.dart';

import 'package:anilife/enums/media_season.dart';
import 'package:anilife/enums/media_sort.dart';



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

  static Future<List<dynamic>> getAnimesOfSeason(int pageNumber, int pageSize,
      int seasonYear, MediaSeason season, MediaSort sort) async {
    QueryResult result = await client.query(
      QueryOptions(
        document: queries.getAnimesOfSeason,
        variables: {
          'page': pageNumber,
          'perPage': pageSize,
          'seasonYear': seasonYear,
          'season': StringHelper.getStringValueOfEnum(season),
          'sort': StringHelper.getStringValueOfEnum(sort),
        },
      ),
    );

    if (result.errors != null) {
      return result.errors;
    }

    await waitWhile(() => result.loading);

    return result.data['Page']['media'];
  }

  static Future<List<dynamic>> getMostPopularAnimes(int pageNumber, int pageSize) async {
    QueryResult result = await client.query(
      QueryOptions(
        document: queries.getMostPopularAnimes,
        variables: {
          'page': pageNumber,
          'perPage': pageSize,
        },
      ),
    );

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

    if (result.errors != null) {
      return result.errors;
    }

    await waitWhile(() => result.loading);

    return result.data['Page']['media'];
  }

  static Future<List<dynamic>> getMostTrendingManga(int pageNumber, int pageSize) async {
    QueryResult result = await client.query(
      QueryOptions(
        document: queries.getMostTrendingManga,
        variables: {
          'page': pageNumber,
          'perPage': pageSize,
        },
      ),
    );

    if (result.errors != null) {
      return result.errors;
    }

    await waitWhile(() => result.loading);

    return result.data['Page']['media'];
  }

  static Future<List<dynamic>> getBestScoreManga(int pageNumber, int pageSize) async {
    QueryResult result = await client.query(
      QueryOptions(
        document: queries.getBestScoreManga,
        variables: {
          'page': pageNumber,
          'perPage': pageSize,
        },
      ),
    );

    if (result.errors != null) {
      return result.errors;
    }

    await waitWhile(() => result.loading);

    return result.data['Page']['media'];
  }


}
