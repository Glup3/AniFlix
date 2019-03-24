class StringHelper {
  static String getStringValueOfEnum(dynamic myEnum) {
    return myEnum.toString().split('.').last;
  }

  static String concatStringsWithCommaOfListWithMaximum(List<dynamic> items, int maximum) {
    String result = '';
    int length = items.length <= maximum ? items.length : maximum;

    for (int index = 0; index < length; index++) {
      result += items[index];
      if (index != length - 1) {
        result += ', ';
      }
    }

    return result;
  }
}