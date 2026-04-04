import 'package:drilling_app/core/navigation/main_page.dart';
import 'package:drilling_app/features/drilling/presentation/drilling_activity.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        name: 'home',
        builder: (context, state) => MainPage(),
      ),

       GoRoute(
        path: '/drilling',
        name: 'drilling',
        builder: (context, state) => DrillingPage(),
      ),
    ],
  );
}
