// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'data/datasource/account_preference_local_data_source.dart' as _i3;
import 'data/datasource/auth_local_data_source.dart' as _i5;
import 'data/datasource/password_local_data_source.dart' as _i11;
import 'data/datasource/secure_storage.dart' as _i4;
import 'data/repository/account_pref_repo_impl.dart' as _i19;
import 'data/repository/auth_repo_impl.dart' as _i7;
import 'data/repository/password_repo_impl.dart' as _i13;
import 'domain/repository/account_pref_repo.dart' as _i18;
import 'domain/repository/auth_repo.dart' as _i6;
import 'domain/repository/password_repo.dart' as _i12;
import 'domain/usecase/auth/create_account_use_case.dart' as _i8;
import 'domain/usecase/auth/get_current_account_use_case.dart' as _i9;
import 'domain/usecase/auth/login_use_case.dart' as _i10;
import 'domain/usecase/password/delete_password_use_case.dart' as _i21;
import 'domain/usecase/password/get_all_paswords_use_case.dart' as _i23;
import 'domain/usecase/password/get_password_by_id_use_case.dart' as _i24;
import 'domain/usecase/password/save_password_use_case.dart' as _i15;
import 'domain/usecase/password/search_password_use_case.dart' as _i16;
import 'domain/usecase/password/update_password_settings_use_case.dart' as _i17;
import 'domain/usecase/preference/account_preference_use_case.dart' as _i20;
import 'presentation/page/auth/login/bloc/login_bloc.dart' as _i25;
import 'presentation/page/auth/register/bloc/register_bloc.dart' as _i14;
import 'presentation/page/gateway/bloc/gateway_bloc.dart' as _i22;
import 'presentation/page/password/create/bloc/password_save_bloc.dart' as _i27;
import 'presentation/page/password/list/bloc/password_bloc.dart' as _i26;
import 'presentation/page/preferences/bloc/preferences_bloc.dart'
    as _i28; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.AccountPreferenceLocalDataSource>(
      () => _i3.AccountPreferenceLocalDataSourceImpl());
  gh.singleton<_i4.SecureStorage>(_i4.SecureStorageImpl());
  gh.factory<_i5.AuthLocalDataSource>(
      () => _i5.AuthLocalDataSourceImpl(get<_i4.SecureStorage>()));
  gh.factory<_i6.AuthRepository>(
      () => _i7.AuthRepoitoryImpl(get<_i5.AuthLocalDataSource>()));
  gh.factory<_i8.CreateAccountUseCase>(
      () => _i8.CreateAccountUseCase(get<_i6.AuthRepository>()));
  gh.factory<_i9.GetCurrentAccountUseCase>(
      () => _i9.GetCurrentAccountUseCase(get<_i6.AuthRepository>()));
  gh.factory<_i10.LoginUseCase>(
      () => _i10.LoginUseCase(get<_i6.AuthRepository>()));
  gh.factory<_i11.PasswordLocalDataSource>(
      () => _i11.PasswordLocalDataSourceImpl(get<_i4.SecureStorage>()));
  gh.factory<_i12.PasswordRepository>(
      () => _i13.PasswordRepositoryImpl(get<_i11.PasswordLocalDataSource>()));
  gh.factory<_i14.RegisterBloc>(
      () => _i14.RegisterBloc(get<_i8.CreateAccountUseCase>()));
  gh.factory<_i15.SavePasswordUsecase>(
      () => _i15.SavePasswordUsecase(get<_i12.PasswordRepository>()));
  gh.factory<_i16.SearchPasswordUseCase>(
      () => _i16.SearchPasswordUseCase(get<_i12.PasswordRepository>()));
  gh.factory<_i17.UpdatePasswordSettingsUseCase>(
      () => _i17.UpdatePasswordSettingsUseCase(get<_i12.PasswordRepository>()));
  gh.factory<_i18.AccountPrefRepo>(() => _i19.AccountPrefRepoImpl(
      get<_i3.AccountPreferenceLocalDataSource>(),
      get<_i11.PasswordLocalDataSource>(),
      get<_i5.AuthLocalDataSource>(),
      get<_i4.SecureStorage>()));
  gh.factory<_i20.AccountPreferenceUseCase>(
      () => _i20.AccountPreferenceUseCase(get<_i18.AccountPrefRepo>()));
  gh.factory<_i21.DeletePasswordUseCase>(
      () => _i21.DeletePasswordUseCase(get<_i12.PasswordRepository>()));
  gh.factory<_i22.GatewayBloc>(() => _i22.GatewayBloc(
      get<_i9.GetCurrentAccountUseCase>(),
      get<_i20.AccountPreferenceUseCase>()));
  gh.factory<_i23.GetAllPasswordsUseCase>(
      () => _i23.GetAllPasswordsUseCase(get<_i12.PasswordRepository>()));
  gh.factory<_i24.GetPasswordByIdUseCase>(
      () => _i24.GetPasswordByIdUseCase(get<_i12.PasswordRepository>()));
  gh.factory<_i25.LoginBloc>(() => _i25.LoginBloc(
      get<_i9.GetCurrentAccountUseCase>(), get<_i10.LoginUseCase>()));
  gh.factory<_i26.PasswordBloc>(() => _i26.PasswordBloc(
      get<_i23.GetAllPasswordsUseCase>(),
      get<_i21.DeletePasswordUseCase>(),
      get<_i16.SearchPasswordUseCase>(),
      get<_i9.GetCurrentAccountUseCase>(),
      get<_i17.UpdatePasswordSettingsUseCase>(),
      get<_i20.AccountPreferenceUseCase>()));
  gh.factory<_i27.PasswordSaveBloc>(() => _i27.PasswordSaveBloc(
      get<_i15.SavePasswordUsecase>(), get<_i24.GetPasswordByIdUseCase>()));
  gh.factory<_i28.PreferencesBloc>(() => _i28.PreferencesBloc(
      get<_i20.AccountPreferenceUseCase>(),
      get<_i9.GetCurrentAccountUseCase>()));
  return get;
}
