import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_pagewise/flutter_pagewise.dart';

import 'package:anilife/widgets/cover_card.dart';
import 'package:anilife/widgets/cover.dart';
import 'package:anilife/services/anilist_service.dart';
import 'package:anilife/util/string_helper.dart';

import 'package:anilife/enums/media_season.dart';
import 'package:anilife/enums/media_sort.dart';

class AnimeSeasonGridView extends StatefulWidget {
  final int pageSize;
  final int seasonYear;
  final MediaSeason season;
  final MediaSort sort;

  AnimeSeasonGridView({Key key, @required this.pageSize, @required this.seasonYear, @required this.season, @required this.sort}) : super(key: key);

  @override
  _AnimeSeasonGridViewState createState() => _AnimeSeasonGridViewState();
}

class _AnimeSeasonGridViewState extends State<AnimeSeasonGridView> {
  @override
  Widget build(BuildContext context) {
    return PagewiseGridView.count(
      pageSize: widget.pageSize,
      crossAxisCount: 2,
      childAspectRatio: 0.8,
      crossAxisSpacing: 8.0,
      mainAxisSpacing: 8.0,
      padding: EdgeInsets.all(5),
      itemBuilder: (BuildContext context, dynamic media, int index) {
        Widget animeCover = ContentCover(
          imageURL: media['coverImage']['large'],
          title: media['title']['romaji'],
          subTextOne: '${media['format']} - ${media['episodes']}',
          subTextTwo: '${StringHelper.concatStringsWithCommaOfListWithMaximum(media['genres'], 3)}',
        );
        return CoverCard(content: animeCover, index: index);
      },
      pageFuture: (int pageIndex) => 
        AniListService.getAnimesOfSeason(pageIndex + 1, widget.pageSize, widget.seasonYear, widget.season, widget.sort),
    );
  }
}
