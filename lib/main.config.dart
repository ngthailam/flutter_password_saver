// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'data/datasource/account_preference_local_data_source.dart' as _i3;
import 'data/datasource/auth_login_lock_data_source.dart' as _i5;
import 'data/datasource/biometric_data_source.dart' as _i6;
import 'data/datasource/info_local_data_source.dart' as _i13;
import 'data/datasource/password_local_data_source.dart' as _i16;
import 'data/datasource/secure_storage.dart' as _i7;
import 'data/repository/account_pref_repo_impl.dart' as _i10;
import 'data/repository/info_repo_impl.dart' as _i15;
import 'data/repository/password_repo_impl.dart' as _i18;
import 'domain/repository/account_pref_repo.dart' as _i9;
import 'domain/repository/info_repo.dart' as _i14;
import 'domain/repository/password_repo.dart' as _i17;
import 'domain/usecase/info/delete_info_use_case.dart' as _i30;
import 'domain/usecase/info/get_all_info_use_case.dart' as _i32;
import 'domain/usecase/info/get_info_by_id_use_case.dart' as _i35;
import 'domain/usecase/info/save_info_use_case.dart' as _i20;
import 'domain/usecase/info/search_info_use_case.dart' as _i22;
import 'domain/usecase/password/delete_password_use_case.dart' as _i31;
import 'domain/usecase/password/get_all_paswords_use_case.dart' as _i33;
import 'domain/usecase/password/get_password_by_id_use_case.dart' as _i36;
import 'domain/usecase/password/reorder_password_use_case.dart' as _i19;
import 'domain/usecase/password/save_password_use_case.dart' as _i21;
import 'domain/usecase/password/search_password_use_case.dart' as _i23;
import 'domain/usecase/password/update_password_settings_use_case.dart' as _i24;
import 'domain/usecase/preference/account_preference_use_case.dart' as _i11;
import 'domain/usecase/user/show_onboard_use_case.dart' as _i44;
import 'initializer/app_short_cut_manager.dart' as _i4;
import 'initializer/uri_handler.dart' as _i8;
import 'modules/auth/data/datasource/auth_local_data_source.dart' as _i12;
import 'modules/auth/data/repo/auth_repo_impl.dart' as _i26;
import 'modules/auth/domain/repo/auth_repo.dart' as _i25;
import 'modules/auth/domain/usecase/auth_lock_use_case.dart' as _i47;
import 'modules/auth/domain/usecase/biometric_use_case.dart' as _i27;
import 'modules/auth/domain/usecase/create_account_use_case.dart' as _i28;
import 'modules/auth/domain/usecase/delete_account_use_case.dart' as _i29;
import 'modules/auth/domain/usecase/get_current_account_use_case.dart' as _i34;
import 'modules/auth/domain/usecase/is_need_log_in_use_case.dart' as _i38;
import 'modules/auth/domain/usecase/login_use_case.dart' as _i39;
import 'modules/auth/domain/usecase/update_account_password_use_case.dart'
    as _i45;
import 'modules/auth/presentation/auth/authen/bloc/authen_bloc.dart' as _i48;
import 'modules/auth/presentation/auth/login/bloc/login_bloc.dart' as _i51;
import 'modules/auth/presentation/auth/register/bloc/register_bloc.dart'
    as _i42;
import 'presentation/page/forget_password/bloc/forget_password_bloc.dart'
    as _i49;
import 'presentation/page/gateway/bloc/gateway_bloc.dart' as _i50;
import 'presentation/page/info/list/bloc/info_bloc.dart' as _i37;
import 'presentation/page/info/save/bloc/save_info_bloc.dart' as _i43;
import 'presentation/page/password/create/bloc/password_save_bloc.dart' as _i40;
import 'presentation/page/password/list/bloc/password_bloc.dart' as _i52;
import 'presentation/page/preferences/bloc/preferences_bloc.dart' as _i41;
import 'presentation/page/update_password/bloc/update_password_bloc.dart'
    as _i46; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  gh.factory<_i3.AccountPreferenceLocalDataSource>(
      () => _i3.AccountPreferenceLocalDataSourceImpl());
  gh.factory<_i4.AppShortcutManager>(() => _i4.AppShortcutManagerImpl());
  gh.factory<_i5.AuthLoginLockDataSource>(
      () => _i5.AuthLoginLockDataSourceImpl());
  gh.factory<_i6.BiometricsDataSource>(() => _i6.BiometricsDataSourceImpl());
  gh.singleton<_i7.SecureStorage>(_i7.SecureStorageImpl());
  gh.singleton<_i8.UriHandler>(_i8.UriHandlerImpl());
  gh.factory<_i9.AccountPrefRepo>(() =>
      _i10.AccountPrefRepoImpl(get<_i3.AccountPreferenceLocalDataSource>()));
  gh.factory<_i11.AccountPreferenceUseCase>(
      () => _i11.AccountPreferenceUseCase(get<_i9.AccountPrefRepo>()));
  gh.factory<_i12.AuthLocalDataSource>(() => _i12.AuthLocalDataSourceImpl(
        get<_i7.SecureStorage>(),
        get<_i5.AuthLoginLockDataSource>(),
      ));
  gh.factory<_i13.InfoLocalDataSource>(
      () => _i13.InfoLocalDataSourceImpl(get<_i7.SecureStorage>()));
  gh.factory<_i14.InfoRepository>(
      () => _i15.InfoRepositoryImpl(get<_i13.InfoLocalDataSource>()));
  gh.factory<_i16.PasswordLocalDataSource>(
      () => _i16.PasswordLocalDataSourceImpl(
            get<_i7.SecureStorage>(),
            get<_i3.AccountPreferenceLocalDataSource>(),
          ));
  gh.factory<_i17.PasswordRepository>(
      () => _i18.PasswordRepositoryImpl(get<_i16.PasswordLocalDataSource>()));
  gh.factory<_i19.ReOrderPasswordUseCase>(
      () => _i19.ReOrderPasswordUseCase(get<_i17.PasswordRepository>()));
  gh.factory<_i20.SaveInfoUsecase>(
      () => _i20.SaveInfoUsecase(get<_i14.InfoRepository>()));
  gh.factory<_i21.SavePasswordUsecase>(
      () => _i21.SavePasswordUsecase(get<_i17.PasswordRepository>()));
  gh.factory<_i22.SearchInfoUseCase>(
      () => _i22.SearchInfoUseCase(get<_i14.InfoRepository>()));
  gh.factory<_i23.SearchPasswordUseCase>(
      () => _i23.SearchPasswordUseCase(get<_i17.PasswordRepository>()));
  gh.factory<_i24.UpdatePasswordSettingsUseCase>(
      () => _i24.UpdatePasswordSettingsUseCase(get<_i17.PasswordRepository>()));
  gh.factory<_i25.AuthRepository>(() => _i26.AuthRepoitoryImpl(
        get<_i12.AuthLocalDataSource>(),
        get<_i16.PasswordLocalDataSource>(),
        get<_i3.AccountPreferenceLocalDataSource>(),
        get<_i5.AuthLoginLockDataSource>(),
        get<_i6.BiometricsDataSource>(),
      ));
  gh.factory<_i27.BiometricsUseCase>(
      () => _i27.BiometricsUseCase(get<_i25.AuthRepository>()));
  gh.factory<_i28.CreateAccountUseCase>(
      () => _i28.CreateAccountUseCase(get<_i25.AuthRepository>()));
  gh.factory<_i29.DeleteAccountUseCase>(() => _i29.DeleteAccountUseCase(
        get<_i25.AuthRepository>(),
        get<_i4.AppShortcutManager>(),
      ));
  gh.factory<_i30.DeleteInfoUseCase>(
      () => _i30.DeleteInfoUseCase(get<_i14.InfoRepository>()));
  gh.factory<_i31.DeletePasswordUseCase>(
      () => _i31.DeletePasswordUseCase(get<_i17.PasswordRepository>()));
  gh.factory<_i32.GetAllInfosUseCase>(
      () => _i32.GetAllInfosUseCase(get<_i14.InfoRepository>()));
  gh.factory<_i33.GetAllPasswordsUseCase>(
      () => _i33.GetAllPasswordsUseCase(get<_i17.PasswordRepository>()));
  gh.factory<_i34.GetCurrentAccountUseCase>(
      () => _i34.GetCurrentAccountUseCase(get<_i25.AuthRepository>()));
  gh.factory<_i35.GetInfoByIdUseCase>(
      () => _i35.GetInfoByIdUseCase(get<_i14.InfoRepository>()));
  gh.factory<_i36.GetPasswordByIdUseCase>(
      () => _i36.GetPasswordByIdUseCase(get<_i17.PasswordRepository>()));
  gh.factory<_i37.InfoBloc>(() => _i37.InfoBloc(
        get<_i32.GetAllInfosUseCase>(),
        get<_i34.GetCurrentAccountUseCase>(),
        get<_i11.AccountPreferenceUseCase>(),
        get<_i30.DeleteInfoUseCase>(),
        get<_i22.SearchInfoUseCase>(),
        get<_i20.SaveInfoUsecase>(),
      ));
  gh.factory<_i38.IsNeedLogInUseCase>(
      () => _i38.IsNeedLogInUseCase(get<_i25.AuthRepository>()));
  gh.factory<_i39.LoginUseCase>(
      () => _i39.LoginUseCase(get<_i25.AuthRepository>()));
  gh.factory<_i40.PasswordSaveBloc>(() => _i40.PasswordSaveBloc(
        get<_i21.SavePasswordUsecase>(),
        get<_i36.GetPasswordByIdUseCase>(),
      ));
  gh.factory<_i41.PreferencesBloc>(() => _i41.PreferencesBloc(
        get<_i11.AccountPreferenceUseCase>(),
        get<_i34.GetCurrentAccountUseCase>(),
        get<_i29.DeleteAccountUseCase>(),
      ));
  gh.factory<_i42.RegisterBloc>(
      () => _i42.RegisterBloc(get<_i28.CreateAccountUseCase>()));
  gh.factory<_i43.SaveInfoBloc>(() => _i43.SaveInfoBloc(
        get<_i20.SaveInfoUsecase>(),
        get<_i35.GetInfoByIdUseCase>(),
      ));
  gh.factory<_i44.ShowOnboardUseCase>(
      () => _i44.ShowOnboardUseCase(get<_i25.AuthRepository>()));
  gh.factory<_i45.UpdateAccountPasswordUseCase>(
      () => _i45.UpdateAccountPasswordUseCase(get<_i25.AuthRepository>()));
  gh.factory<_i46.UpdatePasswordBloc>(() => _i46.UpdatePasswordBloc(
        get<_i34.GetCurrentAccountUseCase>(),
        get<_i45.UpdateAccountPasswordUseCase>(),
      ));
  gh.factory<_i47.AuthLockUseCase>(
      () => _i47.AuthLockUseCase(get<_i25.AuthRepository>()));
  gh.factory<_i48.AuthenCubit>(() => _i48.AuthenCubit(
        get<_i39.LoginUseCase>(),
        get<_i47.AuthLockUseCase>(),
        get<_i27.BiometricsUseCase>(),
        get<_i34.GetCurrentAccountUseCase>(),
      ));
  gh.factory<_i49.ForgetPasswordBloc>(() => _i49.ForgetPasswordBloc(
        get<_i34.GetCurrentAccountUseCase>(),
        get<_i29.DeleteAccountUseCase>(),
        get<_i45.UpdateAccountPasswordUseCase>(),
      ));
  gh.factory<_i50.GatewayBloc>(() => _i50.GatewayBloc(
        get<_i34.GetCurrentAccountUseCase>(),
        get<_i11.AccountPreferenceUseCase>(),
      ));
  gh.factory<_i51.LoginBloc>(() => _i51.LoginBloc(
        get<_i34.GetCurrentAccountUseCase>(),
        get<_i39.LoginUseCase>(),
        get<_i47.AuthLockUseCase>(),
        get<_i27.BiometricsUseCase>(),
      ));
  gh.factory<_i52.PasswordBloc>(() => _i52.PasswordBloc(
        get<_i33.GetAllPasswordsUseCase>(),
        get<_i31.DeletePasswordUseCase>(),
        get<_i23.SearchPasswordUseCase>(),
        get<_i34.GetCurrentAccountUseCase>(),
        get<_i24.UpdatePasswordSettingsUseCase>(),
        get<_i11.AccountPreferenceUseCase>(),
        get<_i44.ShowOnboardUseCase>(),
        get<_i19.ReOrderPasswordUseCase>(),
        get<_i21.SavePasswordUsecase>(),
      ));
  return get;
}
