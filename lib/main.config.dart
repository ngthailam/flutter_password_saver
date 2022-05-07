// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'data/datasource/account_preference_local_data_source.dart' as _i3;
import 'data/datasource/auth_local_data_source.dart' as _i9;
import 'data/datasource/auth_login_lock_data_source.dart' as _i4;
import 'data/datasource/password_local_data_source.dart' as _i10;
import 'data/datasource/secure_storage.dart' as _i5;
import 'data/repository/account_pref_repo_impl.dart' as _i7;
import 'data/repository/auth_repo_impl.dart' as _i17;
import 'data/repository/password_repo_impl.dart' as _i12;
import 'domain/repository/account_pref_repo.dart' as _i6;
import 'domain/repository/auth_repo.dart' as _i16;
import 'domain/repository/password_repo.dart' as _i11;
import 'domain/usecase/auth/auth_lock_use_case.dart' as _i30;
import 'domain/usecase/auth/create_account_use_case.dart' as _i18;
import 'domain/usecase/auth/delete_account_use_case.dart' as _i19;
import 'domain/usecase/auth/get_current_account_use_case.dart' as _i22;
import 'domain/usecase/auth/login_use_case.dart' as _i24;
import 'domain/usecase/auth/update_account_password_use_case.dart' as _i29;
import 'domain/usecase/password/delete_password_use_case.dart' as _i20;
import 'domain/usecase/password/get_all_paswords_use_case.dart' as _i21;
import 'domain/usecase/password/get_password_by_id_use_case.dart' as _i23;
import 'domain/usecase/password/save_password_use_case.dart' as _i13;
import 'domain/usecase/password/search_password_use_case.dart' as _i14;
import 'domain/usecase/password/update_password_settings_use_case.dart' as _i15;
import 'domain/usecase/preference/account_preference_use_case.dart' as _i8;
import 'presentation/page/auth/login/bloc/login_bloc.dart' as _i33;
import 'presentation/page/auth/register/bloc/register_bloc.dart' as _i28;
import 'presentation/page/forget_password/bloc/forget_password_bloc.dart'
    as _i31;
import 'presentation/page/gateway/bloc/gateway_bloc.dart' as _i32;
import 'presentation/page/password/create/bloc/password_save_bloc.dart' as _i26;
import 'presentation/page/password/list/bloc/password_bloc.dart' as _i25;
import 'presentation/page/preferences/bloc/preferences_bloc.dart'
    as _i27; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.AccountPreferenceLocalDataSource>(
      () => _i3.AccountPreferenceLocalDataSourceImpl());
  gh.factory<_i4.AuthLoginLockDataSource>(
      () => _i4.AuthLoginLockDataSourceImpl());
  gh.singleton<_i5.SecureStorage>(_i5.SecureStorageImpl());
  gh.factory<_i6.AccountPrefRepo>(() =>
      _i7.AccountPrefRepoImpl(get<_i3.AccountPreferenceLocalDataSource>()));
  gh.factory<_i8.AccountPreferenceUseCase>(
      () => _i8.AccountPreferenceUseCase(get<_i6.AccountPrefRepo>()));
  gh.factory<_i9.AuthLocalDataSource>(() => _i9.AuthLocalDataSourceImpl(
      get<_i5.SecureStorage>(), get<_i4.AuthLoginLockDataSource>()));
  gh.factory<_i10.PasswordLocalDataSource>(
      () => _i10.PasswordLocalDataSourceImpl(get<_i5.SecureStorage>()));
  gh.factory<_i11.PasswordRepository>(
      () => _i12.PasswordRepositoryImpl(get<_i10.PasswordLocalDataSource>()));
  gh.factory<_i13.SavePasswordUsecase>(
      () => _i13.SavePasswordUsecase(get<_i11.PasswordRepository>()));
  gh.factory<_i14.SearchPasswordUseCase>(
      () => _i14.SearchPasswordUseCase(get<_i11.PasswordRepository>()));
  gh.factory<_i15.UpdatePasswordSettingsUseCase>(
      () => _i15.UpdatePasswordSettingsUseCase(get<_i11.PasswordRepository>()));
  gh.factory<_i16.AuthRepository>(() => _i17.AuthRepoitoryImpl(
      get<_i9.AuthLocalDataSource>(),
      get<_i10.PasswordLocalDataSource>(),
      get<_i3.AccountPreferenceLocalDataSource>(),
      get<_i4.AuthLoginLockDataSource>()));
  gh.factory<_i18.CreateAccountUseCase>(
      () => _i18.CreateAccountUseCase(get<_i16.AuthRepository>()));
  gh.factory<_i19.DeleteAccountUseCase>(
      () => _i19.DeleteAccountUseCase(get<_i16.AuthRepository>()));
  gh.factory<_i20.DeletePasswordUseCase>(
      () => _i20.DeletePasswordUseCase(get<_i11.PasswordRepository>()));
  gh.factory<_i21.GetAllPasswordsUseCase>(
      () => _i21.GetAllPasswordsUseCase(get<_i11.PasswordRepository>()));
  gh.factory<_i22.GetCurrentAccountUseCase>(
      () => _i22.GetCurrentAccountUseCase(get<_i16.AuthRepository>()));
  gh.factory<_i23.GetPasswordByIdUseCase>(
      () => _i23.GetPasswordByIdUseCase(get<_i11.PasswordRepository>()));
  gh.factory<_i24.LoginUseCase>(
      () => _i24.LoginUseCase(get<_i16.AuthRepository>()));
  gh.factory<_i25.PasswordBloc>(() => _i25.PasswordBloc(
      get<_i21.GetAllPasswordsUseCase>(),
      get<_i20.DeletePasswordUseCase>(),
      get<_i14.SearchPasswordUseCase>(),
      get<_i22.GetCurrentAccountUseCase>(),
      get<_i15.UpdatePasswordSettingsUseCase>(),
      get<_i8.AccountPreferenceUseCase>()));
  gh.factory<_i26.PasswordSaveBloc>(() => _i26.PasswordSaveBloc(
      get<_i13.SavePasswordUsecase>(), get<_i23.GetPasswordByIdUseCase>()));
  gh.factory<_i27.PreferencesBloc>(() => _i27.PreferencesBloc(
      get<_i8.AccountPreferenceUseCase>(),
      get<_i22.GetCurrentAccountUseCase>(),
      get<_i19.DeleteAccountUseCase>()));
  gh.factory<_i28.RegisterBloc>(
      () => _i28.RegisterBloc(get<_i18.CreateAccountUseCase>()));
  gh.factory<_i29.UpdateAccountPasswordUseCase>(
      () => _i29.UpdateAccountPasswordUseCase(get<_i16.AuthRepository>()));
  gh.factory<_i30.AuthLockUseCase>(
      () => _i30.AuthLockUseCase(get<_i16.AuthRepository>()));
  gh.factory<_i31.ForgetPasswordBloc>(() => _i31.ForgetPasswordBloc(
      get<_i22.GetCurrentAccountUseCase>(),
      get<_i19.DeleteAccountUseCase>(),
      get<_i29.UpdateAccountPasswordUseCase>()));
  gh.factory<_i32.GatewayBloc>(() => _i32.GatewayBloc(
      get<_i22.GetCurrentAccountUseCase>(),
      get<_i8.AccountPreferenceUseCase>()));
  gh.factory<_i33.LoginBloc>(() => _i33.LoginBloc(
      get<_i22.GetCurrentAccountUseCase>(),
      get<_i24.LoginUseCase>(),
      get<_i30.AuthLockUseCase>()));
  return get;
}
