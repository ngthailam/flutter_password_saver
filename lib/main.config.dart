// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'data/datasource/account_preference_local_data_source.dart' as _i3;
import 'data/datasource/auth_local_data_source.dart' as _i8;
import 'data/datasource/password_local_data_source.dart' as _i14;
import 'data/datasource/secure_storage.dart' as _i4;
import 'data/repository/account_pref_repo_impl.dart' as _i6;
import 'data/repository/auth_repo_impl.dart' as _i10;
import 'data/repository/password_repo_impl.dart' as _i16;
import 'domain/repository/account_pref_repo.dart' as _i5;
import 'domain/repository/auth_repo.dart' as _i9;
import 'domain/repository/password_repo.dart' as _i15;
import 'domain/usecase/auth/create_account_use_case.dart' as _i11;
import 'domain/usecase/auth/get_current_account_use_case.dart' as _i12;
import 'domain/usecase/auth/login_use_case.dart' as _i13;
import 'domain/usecase/password/delete_password_use_case.dart' as _i22;
import 'domain/usecase/password/get_all_paswords_use_case.dart' as _i24;
import 'domain/usecase/password/get_password_by_id_use_case.dart' as _i25;
import 'domain/usecase/password/save_password_use_case.dart' as _i19;
import 'domain/usecase/password/search_password_use_case.dart' as _i20;
import 'domain/usecase/password/update_password_settings_use_case.dart' as _i21;
import 'domain/usecase/preference/account_preference_use_case.dart' as _i7;
import 'presentation/page/auth/login/bloc/login_bloc.dart' as _i26;
import 'presentation/page/auth/register/bloc/register_bloc.dart' as _i18;
import 'presentation/page/gateway/bloc/gateway_bloc.dart' as _i23;
import 'presentation/page/password/create/bloc/password_save_bloc.dart' as _i28;
import 'presentation/page/password/list/bloc/password_bloc.dart' as _i27;
import 'presentation/page/preferences/bloc/preferences_bloc.dart'
    as _i17; // ignore_for_file: unnecessary_lambdas

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
  gh.factory<_i9.AuthRepository>(
      () => _i10.AuthRepoitoryImpl(get<_i8.AuthLocalDataSource>()));
  gh.factory<_i11.CreateAccountUseCase>(
      () => _i11.CreateAccountUseCase(get<_i9.AuthRepository>()));
  gh.factory<_i12.GetCurrentAccountUseCase>(
      () => _i12.GetCurrentAccountUseCase(get<_i9.AuthRepository>()));
  gh.factory<_i13.LoginUseCase>(
      () => _i13.LoginUseCase(get<_i9.AuthRepository>()));
  gh.factory<_i14.PasswordLocalDataSource>(
      () => _i14.PasswordLocalDataSourceImpl(get<_i4.SecureStorage>()));
  gh.factory<_i15.PasswordRepository>(
      () => _i16.PasswordRepositoryImpl(get<_i14.PasswordLocalDataSource>()));
  gh.factory<_i17.PreferencesBloc>(() => _i17.PreferencesBloc(
      get<_i7.AccountPreferenceUseCase>(),
      get<_i12.GetCurrentAccountUseCase>()));
  gh.factory<_i18.RegisterBloc>(
      () => _i18.RegisterBloc(get<_i11.CreateAccountUseCase>()));
  gh.factory<_i19.SavePasswordUsecase>(
      () => _i19.SavePasswordUsecase(get<_i15.PasswordRepository>()));
  gh.factory<_i20.SearchPasswordUseCase>(
      () => _i20.SearchPasswordUseCase(get<_i15.PasswordRepository>()));
  gh.factory<_i21.UpdatePasswordSettingsUseCase>(
      () => _i21.UpdatePasswordSettingsUseCase(get<_i15.PasswordRepository>()));
  gh.factory<_i22.DeletePasswordUseCase>(
      () => _i22.DeletePasswordUseCase(get<_i15.PasswordRepository>()));
  gh.factory<_i23.GatewayBloc>(() => _i23.GatewayBloc(
      get<_i12.GetCurrentAccountUseCase>(),
      get<_i7.AccountPreferenceUseCase>()));
  gh.factory<_i24.GetAllPasswordsUseCase>(
      () => _i24.GetAllPasswordsUseCase(get<_i15.PasswordRepository>()));
  gh.factory<_i25.GetPasswordByIdUseCase>(
      () => _i25.GetPasswordByIdUseCase(get<_i15.PasswordRepository>()));
  gh.factory<_i26.LoginBloc>(() => _i26.LoginBloc(
      get<_i12.GetCurrentAccountUseCase>(), get<_i13.LoginUseCase>()));
  gh.factory<_i27.PasswordBloc>(() => _i27.PasswordBloc(
      get<_i24.GetAllPasswordsUseCase>(),
      get<_i22.DeletePasswordUseCase>(),
      get<_i20.SearchPasswordUseCase>(),
      get<_i12.GetCurrentAccountUseCase>(),
      get<_i21.UpdatePasswordSettingsUseCase>(),
      get<_i7.AccountPreferenceUseCase>()));
  gh.factory<_i28.PasswordSaveBloc>(() => _i28.PasswordSaveBloc(
      get<_i19.SavePasswordUsecase>(), get<_i25.GetPasswordByIdUseCase>()));
  return get;
}
