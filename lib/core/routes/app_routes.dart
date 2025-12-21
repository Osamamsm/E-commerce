import 'package:e_commerce/features/auth/presentation/views/login_view.dart';
import 'package:e_commerce/features/home/presentation/views/home_view.dart';
import 'package:go_router/go_router.dart';

GoRouter router = GoRouter(
  initialLocation: '/login-view',

  routes: [
    GoRoute(
      path: '/home-view',
      builder: (context, state) => const HomeView(),
    ),
    GoRoute(
      path: '/login-view',
      builder: (context, state) => const LoginView(),
    ),
  ],
);
