String getMediaQueryWithFilters = """
  query (
    \$page: Int,
    \$perPage: Int,
    \$status: MediaStatus,
    \$seasonYear: Int,
    \$season: MediaSeason
    \$format: MediaFormat,
    \$genres: [String],
    \$tags: [String],
    \$sort: [MediaSort],
    \$search: String
  ) {
    Page(page: \$page, perPage: \$perPage) {
      media (
        status: \$status,
        seasonYear: \$seasonYear,
        format: \$format,
        genre_in: \$genres,
        tag_in: \$tags,
        search: \$search,
        sort: \$sort,
        season: \$season
      ) {
        id
        episodes
        chapters
        genres
        format
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


String getAnimesOfSeason = """
  query(\$page: Int, \$perPage: Int, \$seasonYear: Int, \$season: MediaSeason, \$sort: [MediaSort]){
    Page(page: \$page, perPage: \$perPage){
      media(seasonYear: \$seasonYear, season: \$season, format: TV, sort: \$sort) {
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

String getMostPopularAnimes = """
  query(\$page: Int, \$perPage: Int){
    Page(page: \$page, perPage: \$perPage){
      media(format: TV, sort: POPULARITY_DESC) {
        id
        format
        episodes
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

String getBestScoreManga = """
  query(\$page: Int, \$perPage: Int){
    Page(page: \$page, perPage: \$perPage){
      media(format: MANGA, sort: SCORE_DESC) {
        id
        format
        chapters
        popularity
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