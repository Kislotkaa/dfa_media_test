extension Separated<T> on List<T> {
  List<T> separatedBy(T separator) {
    if (length < 2) return this;
    return [
      for (int i = 0; i < length; i++) ...[
        this[i],
        if (i != length - 1) separator,
      ]
    ];
  }
}
