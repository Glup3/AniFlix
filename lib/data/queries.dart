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
