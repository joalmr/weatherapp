// routes
import 'package:go_router/go_router.dart';

import 'pages.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (context, state) => const HomePage()),
    GoRoute(path: '/page', builder: (context, state) => const SearchPage()),
  ],
);
