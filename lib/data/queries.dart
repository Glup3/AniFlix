String getMediaOfSeason = """
  query(\$page: Int, \$perPage: Int, \$seasonYear: Int, \$season: MediaSeason, \$format: MediaFormat){
    Page(page: \$page, perPage: \$perPage){
      media(seasonYear: \$seasonYear, season: \$season, format: \$format) {
        id
        format
        episodes
        genres
        title{
          romaji
        }
        coverImage {
          large
        }
      }
    }
  }
""".replaceAll('\n', ' ');

String getMostPopularManga = """
  query(\$page: Int, \$perPage: Int){
    Page(page: \$page, perPage: \$perPage){
      media(format: MANGA, sort: POPULARITY_DESC) {
        id
        popularity
        format
        chapters
        genres
        title {
          romaji
        }
        coverImage {
          large
        }
      }
    }
  }
""".replaceAll('\n', ' ');

String getMostTrendingManga = """
  query(\$page: Int, \$perPage: Int, \$format: MediaFormat){
    Page(page: \$page, perPage: \$perPage){
      media(format: \$format, sort: TRENDING_DESC) {
        id
        popularity
        format
        chapters
        genres
        title{
          romaji
        }
        coverImage {
          large
        }
      }
    }
  }
""".replaceAll('\n', ' ');