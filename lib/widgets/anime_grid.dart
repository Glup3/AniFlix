import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_pagewise/flutter_pagewise.dart';

import 'package:anilife/widgets/cover_card.dart';
import 'package:anilife/services/anilist_service.dart';

import 'package:anilife/enums/media_season.dart';
import 'package:anilife/enums/media_format.dart';

class AnimeGridView extends StatefulWidget {
  final int pageSize;
  final int seasonYear;
  final MediaSeason season;
  final MediaFormat format;

  AnimeGridView({Key key, @required this.pageSize, @required this.seasonYear, @required this.season, @required this.format}) : super(key: key);

  @override
  _AnimeGridViewState createState() => _AnimeGridViewState();
}

class _AnimeGridViewState extends State<AnimeGridView> {
  @override
  Widget build(BuildContext context) {
    return PagewiseGridView.count(
      pageSize: widget.pageSize,
      crossAxisCount: 2,
      childAspectRatio: 0.8,
      crossAxisSpacing: 8.0,
      mainAxisSpacing: 8.0,
      padding: EdgeInsets.all(5),
      itemBuilder: (BuildContext context, dynamic media, int index) =>
          CoverCard(media: media, index: index),
      pageFuture: (int pageIndex) => 
          AniListService.getMediasOfSeason(pageIndex + 1, widget.pageSize, widget.seasonYear, widget.season, widget.format),
    );
  }
}
