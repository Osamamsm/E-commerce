import 'package:e_commerce/features/auth/presentation/views/forgot_password_view.dart';
import 'package:e_commerce/features/auth/presentation/views/login_view.dart';
import 'package:e_commerce/features/auth/presentation/views/register_view.dart';
import 'package:e_commerce/features/cart/presentation/views/cart_view.dart';
import 'package:e_commerce/features/home/presentation/views/home_view.dart';
import 'package:e_commerce/features/product_details/presentation/views/product_details_view.dart';
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
    GoRoute(
      path: '/register-view',
      builder: (context, state) => const RegisterView(),
    ),
    GoRoute(
      path: '/forgot-password-view',
      builder: (context, state) => const ForgotPasswordView(),
    ),
    GoRoute(
      path: '/cart-view',
      builder: (context, state) => const CartView(),
    ),
    GoRoute(
      path: '/product-details-view',
      builder: (context, state) => const ProductDetailsView(),
    ),
  ],
);
