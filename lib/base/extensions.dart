extension NumberModel on int {
  int toRound(int t) {
    int s = this % t;
    int _round = ((this - s) / t).round();
    return _round + (s > 0 ? 1 : 0);
  }
}

extension NumberParsing on String {
  int parsingRound() {
    return (double.tryParse(this) ?? 0).round();
  }
}
