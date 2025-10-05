extension NullableExt<R> on R? {
  void let(void Function(R) map) {
    if (this != null) {
      map(this as R);
    }
  }
}
