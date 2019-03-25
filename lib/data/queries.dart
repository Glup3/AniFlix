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