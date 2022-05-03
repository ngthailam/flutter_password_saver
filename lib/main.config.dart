// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'data/datasource/auth_local_data_source.dart' as _i4;
import 'data/datasource/password_local_data_source.dart' as _i10;
import 'data/datasource/secure_storage.dart' as _i3;
import 'data/repository/auth_repo_impl.dart' as _i6;
import 'data/repository/password_repo_impl.dart' as _i12;
import 'domain/repository/auth_repo.dart' as _i5;
import 'domain/repository/password_repo.dart' as _i11;
import 'domain/usecase/auth/create_account_use_case.dart' as _i7;
import 'domain/usecase/auth/get_current_account_use_case.dart' as _i8;
import 'domain/usecase/auth/login_use_case.dart' as _i9;
import 'domain/usecase/password/delete_password_use_case.dart' as _i17;
import 'domain/usecase/password/get_all_paswords_use_case.dart' as _i19;
import 'domain/usecase/password/get_password_by_id_use_case.dart' as _i20;
import 'domain/usecase/password/save_password_use_case.dart' as _i14;
import 'domain/usecase/password/search_password_use_case.dart' as _i15;
import 'domain/usecase/password/update_password_settings_use_case.dart' as _i16;
import 'presentation/page/auth/login/bloc/login_bloc.dart' as _i21;
import 'presentation/page/auth/register/bloc/register_bloc.dart' as _i13;
import 'presentation/page/gateway/bloc/gateway_bloc.dart' as _i18;
import 'presentation/page/password/create/bloc/password_save_bloc.dart' as _i23;
import 'presentation/page/password/list/bloc/password_bloc.dart'
    as _i22; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.singleton<_i3.SecureStorage>(_i3.SecureStorageImpl());
  gh.factory<_i4.AuthLocalDataSource>(
      () => _i4.AuthLocalDataSourceImpl(get<_i3.SecureStorage>()));
  gh.factory<_i5.AuthRepository>(
      () => _i6.AuthRepoitoryImpl(get<_i4.AuthLocalDataSource>()));
  gh.factory<_i7.CreateAccountUseCase>(
      () => _i7.CreateAccountUseCase(get<_i5.AuthRepository>()));
  gh.factory<_i8.GetCurrentAccountUseCase>(
      () => _i8.GetCurrentAccountUseCase(get<_i5.AuthRepository>()));
  gh.factory<_i9.LoginUseCase>(
      () => _i9.LoginUseCase(get<_i5.AuthRepository>()));
  gh.factory<_i10.PasswordLocalDataSource>(
      () => _i10.PasswordLocalDataSourceImpl(get<_i3.SecureStorage>()));
  gh.factory<_i11.PasswordRepository>(
      () => _i12.PasswordRepositoryImpl(get<_i10.PasswordLocalDataSource>()));
  gh.factory<_i13.RegisterBloc>(
      () => _i13.RegisterBloc(get<_i7.CreateAccountUseCase>()));
  gh.factory<_i14.SavePasswordUsecase>(
      () => _i14.SavePasswordUsecase(get<_i11.PasswordRepository>()));
  gh.factory<_i15.SearchPasswordUseCase>(
      () => _i15.SearchPasswordUseCase(get<_i11.PasswordRepository>()));
  gh.factory<_i16.UpdatePasswordSettingsUseCase>(
      () => _i16.UpdatePasswordSettingsUseCase(get<_i11.PasswordRepository>()));
  gh.factory<_i17.DeletePasswordUseCase>(
      () => _i17.DeletePasswordUseCase(get<_i11.PasswordRepository>()));
  gh.factory<_i18.GatewayBloc>(
      () => _i18.GatewayBloc(get<_i8.GetCurrentAccountUseCase>()));
  gh.factory<_i19.GetAllPasswordsUseCase>(
      () => _i19.GetAllPasswordsUseCase(get<_i11.PasswordRepository>()));
  gh.factory<_i20.GetPasswordByIdUseCase>(
      () => _i20.GetPasswordByIdUseCase(get<_i11.PasswordRepository>()));
  gh.factory<_i21.LoginBloc>(() => _i21.LoginBloc(
      get<_i8.GetCurrentAccountUseCase>(), get<_i9.LoginUseCase>()));
  gh.factory<_i22.PasswordBloc>(() => _i22.PasswordBloc(
      get<_i19.GetAllPasswordsUseCase>(),
      get<_i17.DeletePasswordUseCase>(),
      get<_i15.SearchPasswordUseCase>(),
      get<_i8.GetCurrentAccountUseCase>(),
      get<_i16.UpdatePasswordSettingsUseCase>()));
  gh.factory<_i23.PasswordSaveBloc>(() => _i23.PasswordSaveBloc(
      get<_i14.SavePasswordUsecase>(), get<_i20.GetPasswordByIdUseCase>()));
  return get;
}
