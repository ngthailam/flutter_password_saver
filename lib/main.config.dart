// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'data/datasource/account_preference_local_data_source.dart' as _i3;
import 'data/datasource/auth_local_data_source.dart' as _i10;
import 'data/datasource/auth_login_lock_data_source.dart' as _i4;
import 'data/datasource/biometric_data_source.dart' as _i5;
import 'data/datasource/password_local_data_source.dart' as _i11;
import 'data/datasource/secure_storage.dart' as _i6;
import 'data/repository/account_pref_repo_impl.dart' as _i8;
import 'data/repository/auth_repo_impl.dart' as _i18;
import 'data/repository/password_repo_impl.dart' as _i13;
import 'domain/repository/account_pref_repo.dart' as _i7;
import 'domain/repository/auth_repo.dart' as _i17;
import 'domain/repository/password_repo.dart' as _i12;
import 'domain/usecase/auth/auth_lock_use_case.dart' as _i32;
import 'domain/usecase/auth/biometric_use_case.dart' as _i19;
import 'domain/usecase/auth/create_account_use_case.dart' as _i20;
import 'domain/usecase/auth/delete_account_use_case.dart' as _i21;
import 'domain/usecase/auth/get_current_account_use_case.dart' as _i24;
import 'domain/usecase/auth/login_use_case.dart' as _i26;
import 'domain/usecase/auth/update_account_password_use_case.dart' as _i31;
import 'domain/usecase/password/delete_password_use_case.dart' as _i22;
import 'domain/usecase/password/get_all_paswords_use_case.dart' as _i23;
import 'domain/usecase/password/get_password_by_id_use_case.dart' as _i25;
import 'domain/usecase/password/save_password_use_case.dart' as _i14;
import 'domain/usecase/password/search_password_use_case.dart' as _i15;
import 'domain/usecase/password/update_password_settings_use_case.dart' as _i16;
import 'domain/usecase/preference/account_preference_use_case.dart' as _i9;
import 'presentation/page/auth/login/bloc/login_bloc.dart' as _i35;
import 'presentation/page/auth/register/bloc/register_bloc.dart' as _i30;
import 'presentation/page/forget_password/bloc/forget_password_bloc.dart'
    as _i33;
import 'presentation/page/gateway/bloc/gateway_bloc.dart' as _i34;
import 'presentation/page/password/create/bloc/password_save_bloc.dart' as _i28;
import 'presentation/page/password/list/bloc/password_bloc.dart' as _i27;
import 'presentation/page/preferences/bloc/preferences_bloc.dart'
    as _i29; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.AccountPreferenceLocalDataSource>(
      () => _i3.AccountPreferenceLocalDataSourceImpl());
  gh.factory<_i4.AuthLoginLockDataSource>(
      () => _i4.AuthLoginLockDataSourceImpl());
  gh.factory<_i5.BiometricsDataSource>(() => _i5.BiometricsDataSourceImpl());
  gh.singleton<_i6.SecureStorage>(_i6.SecureStorageImpl());
  gh.factory<_i7.AccountPrefRepo>(() =>
      _i8.AccountPrefRepoImpl(get<_i3.AccountPreferenceLocalDataSource>()));
  gh.factory<_i9.AccountPreferenceUseCase>(
      () => _i9.AccountPreferenceUseCase(get<_i7.AccountPrefRepo>()));
  gh.factory<_i10.AuthLocalDataSource>(() => _i10.AuthLocalDataSourceImpl(
      get<_i6.SecureStorage>(), get<_i4.AuthLoginLockDataSource>()));
  gh.factory<_i11.PasswordLocalDataSource>(
      () => _i11.PasswordLocalDataSourceImpl(get<_i6.SecureStorage>()));
  gh.factory<_i12.PasswordRepository>(
      () => _i13.PasswordRepositoryImpl(get<_i11.PasswordLocalDataSource>()));
  gh.factory<_i14.SavePasswordUsecase>(
      () => _i14.SavePasswordUsecase(get<_i12.PasswordRepository>()));
  gh.factory<_i15.SearchPasswordUseCase>(
      () => _i15.SearchPasswordUseCase(get<_i12.PasswordRepository>()));
  gh.factory<_i16.UpdatePasswordSettingsUseCase>(
      () => _i16.UpdatePasswordSettingsUseCase(get<_i12.PasswordRepository>()));
  gh.factory<_i17.AuthRepository>(() => _i18.AuthRepoitoryImpl(
      get<_i10.AuthLocalDataSource>(),
      get<_i11.PasswordLocalDataSource>(),
      get<_i3.AccountPreferenceLocalDataSource>(),
      get<_i4.AuthLoginLockDataSource>(),
      get<_i5.BiometricsDataSource>()));
  gh.factory<_i19.BiometricsUseCase>(
      () => _i19.BiometricsUseCase(get<_i17.AuthRepository>()));
  gh.factory<_i20.CreateAccountUseCase>(
      () => _i20.CreateAccountUseCase(get<_i17.AuthRepository>()));
  gh.factory<_i21.DeleteAccountUseCase>(
      () => _i21.DeleteAccountUseCase(get<_i17.AuthRepository>()));
  gh.factory<_i22.DeletePasswordUseCase>(
      () => _i22.DeletePasswordUseCase(get<_i12.PasswordRepository>()));
  gh.factory<_i23.GetAllPasswordsUseCase>(
      () => _i23.GetAllPasswordsUseCase(get<_i12.PasswordRepository>()));
  gh.factory<_i24.GetCurrentAccountUseCase>(
      () => _i24.GetCurrentAccountUseCase(get<_i17.AuthRepository>()));
  gh.factory<_i25.GetPasswordByIdUseCase>(
      () => _i25.GetPasswordByIdUseCase(get<_i12.PasswordRepository>()));
  gh.factory<_i26.LoginUseCase>(
      () => _i26.LoginUseCase(get<_i17.AuthRepository>()));
  gh.factory<_i27.PasswordBloc>(() => _i27.PasswordBloc(
      get<_i23.GetAllPasswordsUseCase>(),
      get<_i22.DeletePasswordUseCase>(),
      get<_i15.SearchPasswordUseCase>(),
      get<_i24.GetCurrentAccountUseCase>(),
      get<_i16.UpdatePasswordSettingsUseCase>(),
      get<_i9.AccountPreferenceUseCase>()));
  gh.factory<_i28.PasswordSaveBloc>(() => _i28.PasswordSaveBloc(
      get<_i14.SavePasswordUsecase>(), get<_i25.GetPasswordByIdUseCase>()));
  gh.factory<_i29.PreferencesBloc>(() => _i29.PreferencesBloc(
      get<_i9.AccountPreferenceUseCase>(),
      get<_i24.GetCurrentAccountUseCase>(),
      get<_i21.DeleteAccountUseCase>()));
  gh.factory<_i30.RegisterBloc>(
      () => _i30.RegisterBloc(get<_i20.CreateAccountUseCase>()));
  gh.factory<_i31.UpdateAccountPasswordUseCase>(
      () => _i31.UpdateAccountPasswordUseCase(get<_i17.AuthRepository>()));
  gh.factory<_i32.AuthLockUseCase>(
      () => _i32.AuthLockUseCase(get<_i17.AuthRepository>()));
  gh.factory<_i33.ForgetPasswordBloc>(() => _i33.ForgetPasswordBloc(
      get<_i24.GetCurrentAccountUseCase>(),
      get<_i21.DeleteAccountUseCase>(),
      get<_i31.UpdateAccountPasswordUseCase>()));
  gh.factory<_i34.GatewayBloc>(() => _i34.GatewayBloc(
      get<_i24.GetCurrentAccountUseCase>(),
      get<_i9.AccountPreferenceUseCase>()));
  gh.factory<_i35.LoginBloc>(() => _i35.LoginBloc(
      get<_i24.GetCurrentAccountUseCase>(),
      get<_i26.LoginUseCase>(),
      get<_i32.AuthLockUseCase>(),
      get<_i19.BiometricsUseCase>()));
  return get;
}
