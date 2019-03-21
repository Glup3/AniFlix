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
      }
    }
  }
"""
    .replaceAll('\n', ' ');