String getAnimeIdAndTitle = """
  query (\$id: Int) {
    Media (id: \$id) {
      id
      title {
        romaji
        english
        native
        userPreferred
      }
    }
  }
"""
    .replaceAll('\n', ' ');

String getAnimesIdAndTitle = """
  query (\$id: Int, \$page: Int, \$perPage: Int, \$search: String) {
    Page (page: \$page, perPage: \$perPage) {
      pageInfo {
        total
        currentPage
        lastPage
        hasNextPage
        perPage
      }
      media (id: \$id, search: \$search) {
        id
        title {
          romaji
        }
        coverImage {
          extraLarge
          large
          medium
        }
      }
    }
  }
"""
    .replaceAll('\n', ' ');


String getAnimesOfSeasonAndYear = """
  query(\$page: Int, \$perPage: Int, \$seasonYear: Int, \$season: MediaSeason){
    Page(page:\$page, perPage: \$perPage){
      pageInfo {
        total
        perPage
        currentPage
        lastPage
        hasNextPage
      }
      media(seasonYear: \$seasonYear, season: \$season, format: TV) {
        id
        format
        title{
          romaji
        }
        coverImage {
          extraLarge
          large
          medium
        }
        startDate {
          year
          month
          day
        }
        endDate {
          year
          month
          day
        }
      }
    }
  }
""";