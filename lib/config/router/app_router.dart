import 'package:go_router/go_router.dart';

import 'package:flutter_forms_app/presentation/presentation.dart';

final appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: '/cubits',
      builder: (context, state) => const CubitCounterPage(),
    ),
    GoRoute(
      path: '/bloc',
      builder: (context, state) => const BlocCounterPage(),
    ),
    GoRoute(
      path: '/forms',
      builder: (context, state) => const FormsPage(),
    ),
  ],
);
