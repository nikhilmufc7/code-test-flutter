abstract class ViewAction {}

class SideEffect<T> extends ViewAction {
  final T data;

  SideEffect(this.data);

  @override
  // ignore: hash_and_equals
  bool operator ==(other) {
    if (other is SideEffect) {
      return other.data == data;
    } else {
      return false;
    }
  }
}

class CloseScreen extends ViewAction {}

class Toast extends ViewAction {
  final String message;

  Toast(this.message);

  @override
  // ignore: hash_and_equals
  bool operator ==(other) {
    if (other is Toast) {
      return other.message == message;
    } else {
      return false;
    }
  }
}

class NavigateScreen<T> extends ViewAction {
  final T target;

  NavigateScreen(this.target);

  @override
  // ignore: hash_and_equals
  bool operator ==(other) {
    if (other is NavigateScreen) {
      return other.target == target;
    } else {
      return false;
    }
  }
}
