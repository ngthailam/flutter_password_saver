// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'data/datasource/account_preference_local_data_source.dart' as _i3;
import 'data/datasource/auth_local_data_source.dart' as _i8;
import 'data/datasource/password_local_data_source.dart' as _i9;
import 'data/datasource/secure_storage.dart' as _i4;
import 'data/repository/account_pref_repo_impl.dart' as _i6;
import 'data/repository/auth_repo_impl.dart' as _i16;
import 'data/repository/password_repo_impl.dart' as _i11;
import 'domain/repository/account_pref_repo.dart' as _i5;
import 'domain/repository/auth_repo.dart' as _i15;
import 'domain/repository/password_repo.dart' as _i10;
import 'domain/usecase/auth/create_account_use_case.dart' as _i17;
import 'domain/usecase/auth/delete_account_use_case.dart' as _i18;
import 'domain/usecase/auth/get_current_account_use_case.dart' as _i21;
import 'domain/usecase/auth/login_use_case.dart' as _i23;
import 'domain/usecase/auth/update_account_password_use_case.dart' as _i28;
import 'domain/usecase/password/delete_password_use_case.dart' as _i19;
import 'domain/usecase/password/get_all_paswords_use_case.dart' as _i20;
import 'domain/usecase/password/get_password_by_id_use_case.dart' as _i22;
import 'domain/usecase/password/save_password_use_case.dart' as _i12;
import 'domain/usecase/password/search_password_use_case.dart' as _i13;
import 'domain/usecase/password/update_password_settings_use_case.dart' as _i14;
import 'domain/usecase/preference/account_preference_use_case.dart' as _i7;
import 'presentation/page/auth/login/bloc/login_bloc.dart' as _i31;
import 'presentation/page/auth/register/bloc/register_bloc.dart' as _i27;
import 'presentation/page/forget_password/bloc/forget_password_bloc.dart'
    as _i29;
import 'presentation/page/gateway/bloc/gateway_bloc.dart' as _i30;
import 'presentation/page/password/create/bloc/password_save_bloc.dart' as _i25;
import 'presentation/page/password/list/bloc/password_bloc.dart' as _i24;
import 'presentation/page/preferences/bloc/preferences_bloc.dart'
    as _i26; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.AccountPreferenceLocalDataSource>(
      () => _i3.AccountPreferenceLocalDataSourceImpl());
  gh.singleton<_i4.SecureStorage>(_i4.SecureStorageImpl());
  gh.factory<_i5.AccountPrefRepo>(() =>
      _i6.AccountPrefRepoImpl(get<_i3.AccountPreferenceLocalDataSource>()));
  gh.factory<_i7.AccountPreferenceUseCase>(
      () => _i7.AccountPreferenceUseCase(get<_i5.AccountPrefRepo>()));
  gh.factory<_i8.AuthLocalDataSource>(
      () => _i8.AuthLocalDataSourceImpl(get<_i4.SecureStorage>()));
  gh.factory<_i9.PasswordLocalDataSource>(
      () => _i9.PasswordLocalDataSourceImpl(get<_i4.SecureStorage>()));
  gh.factory<_i10.PasswordRepository>(
      () => _i11.PasswordRepositoryImpl(get<_i9.PasswordLocalDataSource>()));
  gh.factory<_i12.SavePasswordUsecase>(
      () => _i12.SavePasswordUsecase(get<_i10.PasswordRepository>()));
  gh.factory<_i13.SearchPasswordUseCase>(
      () => _i13.SearchPasswordUseCase(get<_i10.PasswordRepository>()));
  gh.factory<_i14.UpdatePasswordSettingsUseCase>(
      () => _i14.UpdatePasswordSettingsUseCase(get<_i10.PasswordRepository>()));
  gh.factory<_i15.AuthRepository>(() => _i16.AuthRepoitoryImpl(
      get<_i8.AuthLocalDataSource>(),
      get<_i9.PasswordLocalDataSource>(),
      get<_i3.AccountPreferenceLocalDataSource>()));
  gh.factory<_i17.CreateAccountUseCase>(
      () => _i17.CreateAccountUseCase(get<_i15.AuthRepository>()));
  gh.factory<_i18.DeleteAccountUseCase>(
      () => _i18.DeleteAccountUseCase(get<_i15.AuthRepository>()));
  gh.factory<_i19.DeletePasswordUseCase>(
      () => _i19.DeletePasswordUseCase(get<_i10.PasswordRepository>()));
  gh.factory<_i20.GetAllPasswordsUseCase>(
      () => _i20.GetAllPasswordsUseCase(get<_i10.PasswordRepository>()));
  gh.factory<_i21.GetCurrentAccountUseCase>(
      () => _i21.GetCurrentAccountUseCase(get<_i15.AuthRepository>()));
  gh.factory<_i22.GetPasswordByIdUseCase>(
      () => _i22.GetPasswordByIdUseCase(get<_i10.PasswordRepository>()));
  gh.factory<_i23.LoginUseCase>(
      () => _i23.LoginUseCase(get<_i15.AuthRepository>()));
  gh.factory<_i24.PasswordBloc>(() => _i24.PasswordBloc(
      get<_i20.GetAllPasswordsUseCase>(),
      get<_i19.DeletePasswordUseCase>(),
      get<_i13.SearchPasswordUseCase>(),
      get<_i21.GetCurrentAccountUseCase>(),
      get<_i14.UpdatePasswordSettingsUseCase>(),
      get<_i7.AccountPreferenceUseCase>()));
  gh.factory<_i25.PasswordSaveBloc>(() => _i25.PasswordSaveBloc(
      get<_i12.SavePasswordUsecase>(), get<_i22.GetPasswordByIdUseCase>()));
  gh.factory<_i26.PreferencesBloc>(() => _i26.PreferencesBloc(
      get<_i7.AccountPreferenceUseCase>(),
      get<_i21.GetCurrentAccountUseCase>(),
      get<_i18.DeleteAccountUseCase>()));
  gh.factory<_i27.RegisterBloc>(
      () => _i27.RegisterBloc(get<_i17.CreateAccountUseCase>()));
  gh.factory<_i28.UpdateAccountPasswordUseCase>(
      () => _i28.UpdateAccountPasswordUseCase(get<_i15.AuthRepository>()));
  gh.factory<_i29.ForgetPasswordBloc>(() => _i29.ForgetPasswordBloc(
      get<_i21.GetCurrentAccountUseCase>(),
      get<_i18.DeleteAccountUseCase>(),
      get<_i28.UpdateAccountPasswordUseCase>()));
  gh.factory<_i30.GatewayBloc>(() => _i30.GatewayBloc(
      get<_i21.GetCurrentAccountUseCase>(),
      get<_i7.AccountPreferenceUseCase>()));
  gh.factory<_i31.LoginBloc>(() => _i31.LoginBloc(
      get<_i21.GetCurrentAccountUseCase>(), get<_i23.LoginUseCase>()));
  return get;
}
