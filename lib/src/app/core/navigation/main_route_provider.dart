import 'package:code_test_flutter/src/app/core/navigation/route_provider.dart';
import 'package:code_test_flutter/src/app/core/navigation/routes.dart';
import 'package:code_test_flutter/src/features/photos/domain/entity/photo.dart';
import 'package:code_test_flutter/src/features/photos/presentation/view/screens/detail_screen.dart';
import 'package:code_test_flutter/src/features/photos/presentation/view/screens/home_screen.dart';

class MainRouteProvider extends RouteProvider {
  @override
  Iterable<(String, RouteBuilder)> routes() {
    return [
      (Routes.home, (context, params) => HomeScreen()),
      (
        Routes.photoDetailScreen,
        (context, state) {
          final photo = state.data<Photo>();
          return DetailScreen(photo: photo);
        }
      ),
    ];
  }
}
