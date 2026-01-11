// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:e_commerce/core/logic/deep_link_cubit/deep_link_cubit.dart'
    as _i457;
import 'package:e_commerce/core/supabase/supabase_client.dart' as _i4;
import 'package:e_commerce/core/supabase/supabase_service.dart' as _i74;
import 'package:e_commerce/features/auth/data/data_sources/auth_remote_data_source.dart'
    as _i254;
import 'package:e_commerce/features/auth/data/repos/auth_repo_impl.dart'
    as _i562;
import 'package:e_commerce/features/auth/domain/repos/auth_repo.dart' as _i380;
import 'package:e_commerce/features/auth/domain/use_cases/forgot_password_use_case.dart'
    as _i841;
import 'package:e_commerce/features/auth/domain/use_cases/login_use_case.dart'
    as _i785;
import 'package:e_commerce/features/auth/domain/use_cases/reset_password_use_case.dart'
    as _i817;
import 'package:e_commerce/features/auth/domain/use_cases/sign_out_use_case.dart'
    as _i956;
import 'package:e_commerce/features/auth/domain/use_cases/sign_up_use_case.dart'
    as _i691;
import 'package:e_commerce/features/auth/presentation/logic/auth_cubit/auth_cubit.dart'
    as _i756;
import 'package:e_commerce/features/auth/presentation/logic/forgot_password_cubit/forgot_password_cubit.dart'
    as _i567;
import 'package:e_commerce/features/auth/presentation/logic/log_in_cubit/log_in_cubit.dart'
    as _i635;
import 'package:e_commerce/features/auth/presentation/logic/reset_password_cubit/reset_password_cubit.dart'
    as _i330;
import 'package:e_commerce/features/auth/presentation/logic/sign_out_cubit/sign_out_cubit.dart'
    as _i167;
import 'package:e_commerce/features/auth/presentation/logic/sign_up_cubit/sign_up_cubit.dart'
    as _i927;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:supabase_flutter/supabase_flutter.dart' as _i454;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final supabaseClientProvider = _$SupabaseClientProvider();
    gh.lazySingleton<_i457.DeepLinkCubit>(() => _i457.DeepLinkCubit());
    gh.lazySingleton<_i454.SupabaseClient>(() => supabaseClientProvider.client);
    gh.lazySingleton<_i74.SupabaseService>(
      () => _i74.SupabaseService(gh<_i454.SupabaseClient>()),
    );
    gh.lazySingleton<_i254.AuthRemoteDataSource>(
      () => _i254.AuthRemoteDataSourceImpl(gh<_i74.SupabaseService>()),
    );
    gh.lazySingleton<_i380.AuthRepo>(
      () => _i562.AuthRepoImpl(gh<_i254.AuthRemoteDataSource>()),
    );
    gh.lazySingleton<_i756.AuthCubit>(
      () => _i756.AuthCubit(gh<_i74.SupabaseService>()),
    );
    gh.factory<_i817.ResetPasswordUseCase>(
      () => _i817.ResetPasswordUseCase(gh<_i380.AuthRepo>()),
    );
    gh.factory<_i841.ForgotPasswordUseCase>(
      () => _i841.ForgotPasswordUseCase(gh<_i380.AuthRepo>()),
    );
    gh.factory<_i785.LoginUseCase>(
      () => _i785.LoginUseCase(gh<_i380.AuthRepo>()),
    );
    gh.factory<_i956.SignOutUseCase>(
      () => _i956.SignOutUseCase(gh<_i380.AuthRepo>()),
    );
    gh.factory<_i691.SignUpUseCase>(
      () => _i691.SignUpUseCase(gh<_i380.AuthRepo>()),
    );
    gh.factory<_i330.ResetPasswordCubit>(
      () => _i330.ResetPasswordCubit(gh<_i817.ResetPasswordUseCase>()),
    );
    gh.factory<_i167.SignOutCubit>(
      () => _i167.SignOutCubit(gh<_i956.SignOutUseCase>()),
    );
    gh.factory<_i567.ForgotPasswordCubit>(
      () => _i567.ForgotPasswordCubit(gh<_i841.ForgotPasswordUseCase>()),
    );
    gh.factory<_i927.SignUpCubit>(
      () => _i927.SignUpCubit(gh<_i691.SignUpUseCase>()),
    );
    gh.factory<_i635.LogInCubit>(
      () => _i635.LogInCubit(gh<_i785.LoginUseCase>()),
    );
    return this;
  }
}

class _$SupabaseClientProvider extends _i4.SupabaseClientProvider {}
