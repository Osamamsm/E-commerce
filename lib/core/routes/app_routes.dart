import 'package:e_commerce/features/home/presentation/views/home_view.dart';
import 'package:go_router/go_router.dart';

GoRouter router = GoRouter(
  initialLocation: '/home-view',

  routes: [
    GoRoute(path: '/home-view', builder: (context, state) => const HomeView()),
  ],
);
