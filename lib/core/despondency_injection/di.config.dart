// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:e_commerce/core/supabase/supabase_client.dart' as _i4;
import 'package:e_commerce/core/supabase/supabase_service.dart' as _i74;
import 'package:e_commerce/features/auth/data/data_sources/auth_remote_data_source.dart'
    as _i254;
import 'package:e_commerce/features/auth/data/repos/auth_repo_impl.dart'
    as _i562;
import 'package:e_commerce/features/auth/domain/repos/auth_repo.dart' as _i380;
import 'package:e_commerce/features/auth/domain/use_cases/login_use_case.dart'
    as _i785;
import 'package:e_commerce/features/auth/domain/use_cases/reset_password_use_case.dart'
    as _i817;
import 'package:e_commerce/features/auth/domain/use_cases/sign_up_use_case.dart'
    as _i691;
import 'package:e_commerce/features/auth/presentation/logic/sign_up_cubit/sign_up_cubit.dart'
    as _i387;
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
    gh.factory<_i785.LoginUseCase>(
      () => _i785.LoginUseCase(gh<_i380.AuthRepo>()),
    );
    gh.factory<_i817.ResetPasswordUseCase>(
      () => _i817.ResetPasswordUseCase(gh<_i380.AuthRepo>()),
    );
    gh.factory<_i691.SignUpUseCase>(
      () => _i691.SignUpUseCase(gh<_i380.AuthRepo>()),
    );
    gh.factory<_i387.SignUpCubit>(
      () => _i387.SignUpCubit(gh<_i691.SignUpUseCase>()),
    );
    return this;
  }
}

class _$SupabaseClientProvider extends _i4.SupabaseClientProvider {}
