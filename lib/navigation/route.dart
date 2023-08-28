import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';

import '../screen/main/main_screen.dart';

enum RoutePath {
  main('/main', 'main');

  const RoutePath(this.path, this.name);

  final String path;
  final String name;
}

@Singleton()
class AppRouter {
  GoRouter router([String? initialLocation]) => GoRouter(
        initialLocation: initialLocation ?? RoutePath.main.path,
        routes: <GoRoute>[
          GoRoute(
            name: RoutePath.main.name,
            path: RoutePath.main.path,
            builder: (_, __) => const MainScreen(),
          ),
        ],
      );
}
