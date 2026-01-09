import 'package:e_commerce/core/despondency_injection/di.dart';
import 'package:e_commerce/core/logic/deep_link_cubit/deep_link_cubit.dart';
import 'package:e_commerce/core/logic/deep_link_cubit/deep_link_state.dart';
import 'package:e_commerce/core/routes/app_routes.dart';
import 'package:e_commerce/core/supabase/supabase_config.dart';
import 'package:e_commerce/core/theme/app_theme.dart';
import 'package:e_commerce/features/auth/presentation/logic/auth_cubit/auth_cubit.dart';
import 'package:e_commerce/features/auth/presentation/views/reset_password_view.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: SupabaseConfig.supabaseUrl,
    anonKey: SupabaseConfig.anonKey,
    authOptions: FlutterAuthClientOptions(authFlowType: AuthFlowType.pkce),
  );
  await setupDependencies();
  runApp(
    BlocProvider(
      create: (context) => getIt<DeepLinkCubit>(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    final authCubit = getIt<AuthCubit>();
    return BlocListener<DeepLinkCubit, DeepLinkState>(
      listener: (context, state) {
        if (state is DeepLinkResetPassword) {
          GoRouter.of(context).push(ResetPasswordView.routeName);
        }
      },
      child: BlocProvider(
        create: (context) => authCubit,
        child: ScreenUtilInit(
          child: MaterialApp.router(
            theme: AppTheme.dark,
            routerConfig: createRouter(authCubit),
            debugShowCheckedModeBanner: false,
            localizationsDelegates: [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
          ),
        ),
      ),
    );
  }
}
