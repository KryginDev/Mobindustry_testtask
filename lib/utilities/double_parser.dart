class DoubleParser {
  static parse(dynamic number) {
    if (number is double) {
      return number;
    } else if (number is int) {
      return number.toDouble();
    }
  }
}
