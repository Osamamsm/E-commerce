import 'dart:async';

import 'package:e_commerce/core/supabase/supabase_service.dart';
import 'package:e_commerce/features/auth/presentation/logic/auth_cubit/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@injectable
class AuthCubit extends Cubit<AppAuthState> {
  final SupabaseService _service;
  late final StreamSubscription<AuthState> _authSub;
  AuthCubit(this._service) : super(const AppAuthState(AuthStatus.unknown)) {
    _init();
  }

  /// Expose stream for GoRouter refreshListenable
  Stream<AppAuthState> get authStateStream => stream;

  Future<void> _init() async {
    User? user = _service.currentUser;
    emit(
      user != null
          ? const AppAuthState(AuthStatus.authenticated)
          : const AppAuthState(AuthStatus.unauthenticated),
    );
    _authSub = _service.auth.onAuthStateChange.listen((event) {
      if (event.session != null) {
        emit(const AppAuthState(AuthStatus.authenticated));
      } else {
        emit(const AppAuthState(AuthStatus.unauthenticated));
      }
    });
  }

  @override
  Future<void> close() {
    _authSub.cancel();
    return super.close();
  }
}
