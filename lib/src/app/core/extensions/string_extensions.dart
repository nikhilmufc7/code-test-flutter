extension NullableStringExt on String? {
  String orEmpty() => this ?? "";
}

extension StringExt on String {
  bool equalsIgnoreCase(String target) => toLowerCase() == target.toLowerCase();
  bool containsIgnoreCase(String target) =>
      toLowerCase().contains(target.toLowerCase());
}
