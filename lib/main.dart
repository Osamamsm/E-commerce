import 'package:e_commerce/core/dependency_injection/di.dart';
import 'package:e_commerce/core/routes/app_routes.dart';
import 'package:e_commerce/core/supabase/supabase_config.dart';
import 'package:e_commerce/core/theme/app_theme.dart';
import 'package:e_commerce/features/auth/presentation/logic/auth_cubit/auth_cubit.dart';
import 'package:e_commerce/features/auth/presentation/logic/auth_cubit/auth_state.dart';
import 'package:e_commerce/features/auth/presentation/logic/sign_out_cubit/sign_out_cubit.dart';
import 'package:e_commerce/features/profile/presentation/logic/cubit/get_profile_cubit.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: SupabaseConfig.supabaseUrl,
    anonKey: SupabaseConfig.anonKey,
    authOptions: FlutterAuthClientOptions(authFlowType: AuthFlowType.pkce),
  );
  await setupDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    final authCubit = getIt<AuthCubit>();
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => authCubit),
        BlocProvider(create: (context) => getIt<SignOutCubit>()),
        BlocProvider(create: (context) => getIt<GetProfileCubit>()..getProfile()),
      ],
      child: BlocListener<AuthCubit, AppAuthState>(
        listener: (context, state) {
          if (state.status == AuthStatus.cleared) {
            context.read<SignOutCubit>().signOut();
          }
        },
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
