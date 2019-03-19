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