import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_pagewise/flutter_pagewise.dart';

import 'package:anilife/widgets/cover_card.dart';
import 'package:anilife/widgets/cover.dart';
import 'package:anilife/util/string_helper.dart';
import 'package:anilife/services/anilist_service.dart';

class AnimeGrid extends StatefulWidget {
  final int pageSize;
  final Map<String, dynamic> variables;

  AnimeGrid({Key key, @required this.variables, @required this.pageSize}) : super(key: key);

  @override
  _AnimeGridState createState() => _AnimeGridState();
}

class _AnimeGridState extends State<AnimeGrid> {
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
      pageFuture: (int pageIndex) {
        widget.variables.addAll({"page": pageIndex + 1});
        return AniListService.getMediaQueryWithFilters(widget.variables);
      },
    );
  }
}
