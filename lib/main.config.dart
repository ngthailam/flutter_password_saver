// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'data/datasource/account_preference_local_data_source.dart' as _i3;
import 'data/datasource/auth_login_lock_data_source.dart' as _i5;
import 'data/datasource/biometric_data_source.dart' as _i6;
import 'data/datasource/password_local_data_source.dart' as _i13;
import 'data/datasource/secure_storage.dart' as _i7;
import 'data/repository/account_pref_repo_impl.dart' as _i10;
import 'data/repository/password_repo_impl.dart' as _i15;
import 'domain/repository/account_pref_repo.dart' as _i9;
import 'domain/repository/password_repo.dart' as _i14;
import 'domain/usecase/password/delete_password_use_case.dart' as _i25;
import 'domain/usecase/password/get_all_paswords_use_case.dart' as _i26;
import 'domain/usecase/password/get_password_by_id_use_case.dart' as _i28;
import 'domain/usecase/password/reorder_password_use_case.dart' as _i16;
import 'domain/usecase/password/save_password_use_case.dart' as _i17;
import 'domain/usecase/password/search_password_use_case.dart' as _i18;
import 'domain/usecase/password/update_password_settings_use_case.dart' as _i19;
import 'domain/usecase/preference/account_preference_use_case.dart' as _i11;
import 'domain/usecase/user/show_onboard_use_case.dart' as _i34;
import 'initializer/app_short_cut_manager.dart' as _i4;
import 'initializer/uri_handler.dart' as _i8;
import 'modules/auth/data/datasource/auth_local_data_source.dart' as _i12;
import 'modules/auth/data/repo/auth_repo_impl.dart' as _i21;
import 'modules/auth/domain/repo/auth_repo.dart' as _i20;
import 'modules/auth/domain/usecase/auth_lock_use_case.dart' as _i37;
import 'modules/auth/domain/usecase/biometric_use_case.dart' as _i22;
import 'modules/auth/domain/usecase/create_account_use_case.dart' as _i23;
import 'modules/auth/domain/usecase/delete_account_use_case.dart' as _i24;
import 'modules/auth/domain/usecase/get_current_account_use_case.dart' as _i27;
import 'modules/auth/domain/usecase/is_need_log_in_use_case.dart' as _i29;
import 'modules/auth/domain/usecase/login_use_case.dart' as _i30;
import 'modules/auth/domain/usecase/update_account_password_use_case.dart'
    as _i35;
import 'modules/auth/presentation/auth/authen/bloc/authen_bloc.dart' as _i38;
import 'modules/auth/presentation/auth/login/bloc/login_bloc.dart' as _i41;
import 'modules/auth/presentation/auth/register/bloc/register_bloc.dart'
    as _i33;
import 'presentation/page/forget_password/bloc/forget_password_bloc.dart'
    as _i39;
import 'presentation/page/gateway/bloc/gateway_bloc.dart' as _i40;
import 'presentation/page/password/create/bloc/password_save_bloc.dart' as _i31;
import 'presentation/page/password/list/bloc/password_bloc.dart' as _i42;
import 'presentation/page/preferences/bloc/preferences_bloc.dart' as _i32;
import 'presentation/page/update_password/bloc/update_password_bloc.dart'
    as _i36; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
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
      get<_i7.SecureStorage>(), get<_i5.AuthLoginLockDataSource>()));
  gh.factory<_i13.PasswordLocalDataSource>(() =>
      _i13.PasswordLocalDataSourceImpl(get<_i7.SecureStorage>(),
          get<_i3.AccountPreferenceLocalDataSource>()));
  gh.factory<_i14.PasswordRepository>(
      () => _i15.PasswordRepositoryImpl(get<_i13.PasswordLocalDataSource>()));
  gh.factory<_i16.ReOrderPasswordUseCase>(
      () => _i16.ReOrderPasswordUseCase(get<_i14.PasswordRepository>()));
  gh.factory<_i17.SavePasswordUsecase>(
      () => _i17.SavePasswordUsecase(get<_i14.PasswordRepository>()));
  gh.factory<_i18.SearchPasswordUseCase>(
      () => _i18.SearchPasswordUseCase(get<_i14.PasswordRepository>()));
  gh.factory<_i19.UpdatePasswordSettingsUseCase>(
      () => _i19.UpdatePasswordSettingsUseCase(get<_i14.PasswordRepository>()));
  gh.factory<_i20.AuthRepository>(() => _i21.AuthRepoitoryImpl(
      get<_i12.AuthLocalDataSource>(),
      get<_i13.PasswordLocalDataSource>(),
      get<_i3.AccountPreferenceLocalDataSource>(),
      get<_i5.AuthLoginLockDataSource>(),
      get<_i6.BiometricsDataSource>()));
  gh.factory<_i22.BiometricsUseCase>(
      () => _i22.BiometricsUseCase(get<_i20.AuthRepository>()));
  gh.factory<_i23.CreateAccountUseCase>(
      () => _i23.CreateAccountUseCase(get<_i20.AuthRepository>()));
  gh.factory<_i24.DeleteAccountUseCase>(() => _i24.DeleteAccountUseCase(
      get<_i20.AuthRepository>(), get<_i4.AppShortcutManager>()));
  gh.factory<_i25.DeletePasswordUseCase>(
      () => _i25.DeletePasswordUseCase(get<_i14.PasswordRepository>()));
  gh.factory<_i26.GetAllPasswordsUseCase>(
      () => _i26.GetAllPasswordsUseCase(get<_i14.PasswordRepository>()));
  gh.factory<_i27.GetCurrentAccountUseCase>(
      () => _i27.GetCurrentAccountUseCase(get<_i20.AuthRepository>()));
  gh.factory<_i28.GetPasswordByIdUseCase>(
      () => _i28.GetPasswordByIdUseCase(get<_i14.PasswordRepository>()));
  gh.factory<_i29.IsNeedLogInUseCase>(
      () => _i29.IsNeedLogInUseCase(get<_i20.AuthRepository>()));
  gh.factory<_i30.LoginUseCase>(
      () => _i30.LoginUseCase(get<_i20.AuthRepository>()));
  gh.factory<_i31.PasswordSaveBloc>(() => _i31.PasswordSaveBloc(
      get<_i17.SavePasswordUsecase>(), get<_i28.GetPasswordByIdUseCase>()));
  gh.factory<_i32.PreferencesBloc>(() => _i32.PreferencesBloc(
      get<_i11.AccountPreferenceUseCase>(),
      get<_i27.GetCurrentAccountUseCase>(),
      get<_i24.DeleteAccountUseCase>()));
  gh.factory<_i33.RegisterBloc>(
      () => _i33.RegisterBloc(get<_i23.CreateAccountUseCase>()));
  gh.factory<_i34.ShowOnboardUseCase>(
      () => _i34.ShowOnboardUseCase(get<_i20.AuthRepository>()));
  gh.factory<_i35.UpdateAccountPasswordUseCase>(
      () => _i35.UpdateAccountPasswordUseCase(get<_i20.AuthRepository>()));
  gh.factory<_i36.UpdatePasswordBloc>(() => _i36.UpdatePasswordBloc(
      get<_i27.GetCurrentAccountUseCase>(),
      get<_i35.UpdateAccountPasswordUseCase>()));
  gh.factory<_i37.AuthLockUseCase>(
      () => _i37.AuthLockUseCase(get<_i20.AuthRepository>()));
  gh.factory<_i38.AuthenCubit>(() => _i38.AuthenCubit(
      get<_i30.LoginUseCase>(),
      get<_i37.AuthLockUseCase>(),
      get<_i22.BiometricsUseCase>(),
      get<_i27.GetCurrentAccountUseCase>()));
  gh.factory<_i39.ForgetPasswordBloc>(() => _i39.ForgetPasswordBloc(
      get<_i27.GetCurrentAccountUseCase>(),
      get<_i24.DeleteAccountUseCase>(),
      get<_i35.UpdateAccountPasswordUseCase>()));
  gh.factory<_i40.GatewayBloc>(() => _i40.GatewayBloc(
      get<_i27.GetCurrentAccountUseCase>(),
      get<_i11.AccountPreferenceUseCase>()));
  gh.factory<_i41.LoginBloc>(() => _i41.LoginBloc(
      get<_i27.GetCurrentAccountUseCase>(),
      get<_i30.LoginUseCase>(),
      get<_i37.AuthLockUseCase>(),
      get<_i22.BiometricsUseCase>()));
  gh.factory<_i42.PasswordBloc>(() => _i42.PasswordBloc(
      get<_i26.GetAllPasswordsUseCase>(),
      get<_i25.DeletePasswordUseCase>(),
      get<_i18.SearchPasswordUseCase>(),
      get<_i27.GetCurrentAccountUseCase>(),
      get<_i19.UpdatePasswordSettingsUseCase>(),
      get<_i11.AccountPreferenceUseCase>(),
      get<_i34.ShowOnboardUseCase>(),
      get<_i16.ReOrderPasswordUseCase>(),
      get<_i17.SavePasswordUsecase>()));
  return get;
}
