import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_pagewise/flutter_pagewise.dart';

import 'package:anilife/widgets/cover_card.dart';
import 'package:anilife/widgets/cover.dart';
import 'package:anilife/services/anilist_service.dart';
import 'package:anilife/util/string_helper.dart';

class MangaGrid extends StatefulWidget {
  final int pageSize;
  final Map<String, dynamic> variables;

  MangaGrid({Key key, @required this.pageSize, @required this.variables}) : super(key: key);

  @override
  _MangaGridState createState() => _MangaGridState();
}

class _MangaGridState extends State<MangaGrid> {
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
        Widget mangaCover = ContentCover(
          imageURL: media['coverImage']['large'],
          title: media['title']['romaji'],
          subTextOne: '${media['format']} - ${media['popularity']}',
          subTextTwo: '${StringHelper.concatStringsWithCommaOfListWithMaximum(media['genres'], 3)}',
        );
        return CoverCard(content: mangaCover, index: index);
      },
      pageFuture: (int pageIndex) {
        widget.variables.addAll({"page": pageIndex + 1});
        return AniListService.getMediaQueryWithFilters(widget.variables);
      }
    );
  }
}
