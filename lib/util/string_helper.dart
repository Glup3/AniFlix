class StringHelper {
  static String getStringValueOfEnum(dynamic myEnum) {
    return myEnum.toString().split('.').last;
  }
}