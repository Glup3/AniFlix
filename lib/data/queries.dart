String getMediaOfSeason = """
  query(\$page: Int, \$perPage: Int, \$seasonYear: Int, \$season: MediaSeason, \$format: MediaFormat){
    Page(page: \$page, perPage: \$perPage){
      pageInfo {
        total
        perPage
        currentPage
        lastPage
        hasNextPage
      }
      media(seasonYear: \$seasonYear, season: \$season, format: \$format) {
        id
        format
        episodes
        title{
          romaji
        }
        coverImage {
          extraLarge
          large
          medium
          color
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
""".replaceAll('\n', ' ');
