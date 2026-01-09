import 'dart:async';
import 'package:e_commerce/core/despondency_injection/di.dart';
import 'package:e_commerce/features/auth/presentation/logic/auth_cubit/auth_cubit.dart';
import 'package:e_commerce/features/auth/presentation/logic/auth_cubit/auth_state.dart';
import 'package:e_commerce/features/auth/presentation/logic/log_in_cubit/log_in_cubit.dart';
import 'package:e_commerce/features/auth/presentation/logic/sign_up_cubit/sign_up_cubit.dart';
import 'package:e_commerce/features/auth/presentation/views/forgot_password_view.dart';
import 'package:e_commerce/features/auth/presentation/views/login_view.dart';
import 'package:e_commerce/features/auth/presentation/views/register_view.dart';
import 'package:e_commerce/features/auth/presentation/views/reset_password_view.dart';
import 'package:e_commerce/features/cart/presentation/views/cart_view.dart';
import 'package:e_commerce/features/home/presentation/views/home_view.dart';
import 'package:e_commerce/features/product_details/presentation/views/product_details_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

GoRouter createRouter(AuthCubit authCubit) {
  return GoRouter(
    initialLocation: LoginView.routeName,
    refreshListenable: GoRouterRefreshStream(authCubit.stream),
    redirect: (context, state) {
      final authStatus = authCubit.state.status;
      final isOnAuthPage =
          state.matchedLocation == LoginView.routeName ||
          state.matchedLocation == RegisterView.routeName ||
          state.matchedLocation == ForgotPasswordView.routeName;

      final isResetPasswordPage =
          state.matchedLocation == ResetPasswordView.routeName;

      // Still loading auth state
      if (authStatus == AuthStatus.unknown) {
        //TODO : show splash screen when added to the project
        return null; // Don't redirect while checking auth
      }

      // User is authenticated
      if (authStatus == AuthStatus.authenticated) {
        // Redirect away from auth pages if already logged in
        if (isOnAuthPage) {
          return HomeView.routeName;
        }
        if (isResetPasswordPage) {
          return null;
        }
        return null; // Allow access to requested page
      }

      // User is unauthenticated
      if (authStatus == AuthStatus.unauthenticated) {
        // Allow access to auth pages
        if (isOnAuthPage) {
          return null;
        }
        // Redirect to login for protected pages
        return LoginView.routeName;
      }

      return null;
    },
    routes: [
      GoRoute(
        path: HomeView.routeName,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: LoginView.routeName,
        builder: (context, state) => BlocProvider(
          create: (context) => getIt<LogInCubit>(),
          child: const LoginView(),
        ),
      ),
      GoRoute(
        path: RegisterView.routeName,
        builder: (context, state) => BlocProvider(
          create: (context) => getIt<SignUpCubit>(),
          child: const RegisterView(),
        ),
      ),
      GoRoute(
        path: ForgotPasswordView.routeName,
        builder: (context, state) => const ForgotPasswordView(),
      ),
      GoRoute(
        path: ResetPasswordView.routeName,
        builder: (context, state) => const ResetPasswordView(),
      ),
      GoRoute(
        path: CartView.routeName,
        builder: (context, state) => const CartView(),
      ),
      GoRoute(
        path: ProductDetailsView.routeName,
        builder: (context, state) => const ProductDetailsView(),
      ),
    ],
  );
}

class GoRouterRefreshStream extends ChangeNotifier {
  GoRouterRefreshStream(Stream<dynamic> stream) {
    _subscription = stream.listen((_) {
      notifyListeners();
    });
  }

  late final StreamSubscription _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
