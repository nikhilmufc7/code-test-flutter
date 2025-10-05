import 'package:go_router/go_router.dart';

///
/// This class serves as a wrapper around the GoRouterState in order to ensure
/// rest of the app is agnostic of the nav library.
///
class RouterState {
  final GoRouterState _state;

  RouterState(this._state);

  Map<String, String> get params => _state.pathParameters;

  T data<T>() => _state.extra as T;
}
