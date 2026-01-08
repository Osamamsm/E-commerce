import 'dart:async';

import 'package:app_links/app_links.dart';
import 'package:e_commerce/core/logic/deep_link_cubit/deep_link_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class DeepLinkCubit extends Cubit<DeepLinkState> {
  final AppLinks _appLinks = AppLinks();
  StreamSubscription<Uri>? _sub;

  DeepLinkCubit() : super(DeepLinkInitial()) {
    _init();
  }

  void _init() async {
    // 1️⃣ Handle app opened from killed state
    final uri = await _appLinks.getInitialLink();
    if (uri != null) {
      _handleUri(uri);
    }

    // 2️⃣ Handle app opened while running
    _sub = _appLinks.uriLinkStream.listen(
      (uri) => _handleUri(uri),
    );
  }

  void _handleUri(Uri uri) {
    final type = uri.queryParameters['type'];

    if (type == 'recovery') {
      emit(DeepLinkResetPassword());
    }

    if (type == 'signup') {
      emit(DeepLinkEmailVerification());
    }
  }

  @override
  Future<void> close() {
    _sub?.cancel();
    return super.close();
  }
}