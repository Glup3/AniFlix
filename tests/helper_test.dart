import 'package:flutter_test/flutter_test.dart';
import 'package:anilife/util/string_helper.dart';
import 'package:anilife/enums/media_format.dart';
import 'package:anilife/enums/media_season.dart';

void main() {
  group('MediaFormat', () {
    test('should be TV', () {
      expect(StringHelper.getStringValueOfEnum(MediaFormat.TV), 'TV');
    });
    test('should be TV_SHORT', () {
      expect(StringHelper.getStringValueOfEnum(MediaFormat.TV_SHORT), 'TV_SHORT');
    });
    test('should be MANGA', () {
      expect(StringHelper.getStringValueOfEnum(MediaFormat.MANGA), 'MANGA');
    });
    test('should be MOVIE', () {
      expect(StringHelper.getStringValueOfEnum(MediaFormat.MOVIE), 'MOVIE');
    });
    test('should be MUSIC', () {
      expect(StringHelper.getStringValueOfEnum(MediaFormat.MUSIC), 'MUSIC');
    });
    test('should be NOVEL', () {
      expect(StringHelper.getStringValueOfEnum(MediaFormat.NOVEL), 'NOVEL');
    });
    test('should be ONA', () {
      expect(StringHelper.getStringValueOfEnum(MediaFormat.ONA), 'ONA');
    });
    test('should be ONE_SHOT', () {
      expect(StringHelper.getStringValueOfEnum(MediaFormat.ONE_SHOT), 'ONE_SHOT');
    });
    test('should be OVA', () {
      expect(StringHelper.getStringValueOfEnum(MediaFormat.OVA), 'OVA');
    });
    test('should be SPECIAL', () {
      expect(StringHelper.getStringValueOfEnum(MediaFormat.SPECIAL), 'SPECIAL');
    });
  });

  group('MediaSeason', () {
    test('should be WINTER', () {
      expect(StringHelper.getStringValueOfEnum(MediaSeason.WINTER), 'WINTER');      
    });
    test('should be FALL', () {
      expect(StringHelper.getStringValueOfEnum(MediaSeason.FALL), 'FALL');      
    });
    test('should be SPRING', () {
      expect(StringHelper.getStringValueOfEnum(MediaSeason.SPRING), 'SPRING');      
    });
    test('should be SUMMER', () {
      expect(StringHelper.getStringValueOfEnum(MediaSeason.SUMMER), 'SUMMER');      
    });
  });
}