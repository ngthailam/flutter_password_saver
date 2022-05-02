// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'data/datasource/auth_local_data_source.dart' as _i3;
import 'data/datasource/password_local_data_source.dart' as _i9;
import 'data/repository/auth_repo_impl.dart' as _i5;
import 'data/repository/password_repo_impl.dart' as _i11;
import 'domain/repository/auth_repo.dart' as _i4;
import 'domain/repository/password_repo.dart' as _i10;
import 'domain/usecase/auth/create_account_use_case.dart' as _i6;
import 'domain/usecase/auth/get_current_account_use_case.dart' as _i7;
import 'domain/usecase/auth/login_use_case.dart' as _i8;
import 'domain/usecase/password/delete_password_use_case.dart' as _i15;
import 'domain/usecase/password/get_all_paswords_use_case.dart' as _i17;
import 'domain/usecase/password/get_password_by_id_use_case.dart' as _i18;
import 'domain/usecase/password/save_password_use_case.dart' as _i13;
import 'domain/usecase/password/search_password_use_case.dart' as _i14;
import 'presentation/page/auth/login/bloc/login_bloc.dart' as _i19;
import 'presentation/page/auth/register/bloc/register_bloc.dart' as _i12;
import 'presentation/page/gateway/bloc/gateway_bloc.dart' as _i16;
import 'presentation/page/password/create/bloc/password_save_bloc.dart' as _i21;
import 'presentation/page/password/list/bloc/password_bloc.dart'
    as _i20; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.AuthLocalDataSource>(() => _i3.AuthLocalDataSourceImpl());
  gh.factory<_i4.AuthRepository>(
      () => _i5.AuthRepoitoryImpl(get<_i3.AuthLocalDataSource>()));
  gh.factory<_i6.CreateAccountUseCase>(
      () => _i6.CreateAccountUseCase(get<_i4.AuthRepository>()));
  gh.factory<_i7.GetCurrentAccountUseCase>(
      () => _i7.GetCurrentAccountUseCase(get<_i4.AuthRepository>()));
  gh.factory<_i8.LoginUseCase>(
      () => _i8.LoginUseCase(get<_i4.AuthRepository>()));
  gh.factory<_i9.PasswordLocalDataSource>(
      () => _i9.PasswordLocalDataSourceImpl());
  gh.factory<_i10.PasswordRepository>(
      () => _i11.PasswordRepositoryImpl(get<_i9.PasswordLocalDataSource>()));
  gh.factory<_i12.RegisterBloc>(
      () => _i12.RegisterBloc(get<_i6.CreateAccountUseCase>()));
  gh.factory<_i13.SavePasswordUsecase>(
      () => _i13.SavePasswordUsecase(get<_i10.PasswordRepository>()));
  gh.factory<_i14.SearchPasswordUseCase>(
      () => _i14.SearchPasswordUseCase(get<_i10.PasswordRepository>()));
  gh.factory<_i15.DeletePasswordUseCase>(
      () => _i15.DeletePasswordUseCase(get<_i10.PasswordRepository>()));
  gh.factory<_i16.GatewayBloc>(
      () => _i16.GatewayBloc(get<_i7.GetCurrentAccountUseCase>()));
  gh.factory<_i17.GetAllPasswordsUseCase>(
      () => _i17.GetAllPasswordsUseCase(get<_i10.PasswordRepository>()));
  gh.factory<_i18.GetPasswordByIdUseCase>(
      () => _i18.GetPasswordByIdUseCase(get<_i10.PasswordRepository>()));
  gh.factory<_i19.LoginBloc>(() => _i19.LoginBloc(
      get<_i7.GetCurrentAccountUseCase>(), get<_i8.LoginUseCase>()));
  gh.factory<_i20.PasswordBloc>(() => _i20.PasswordBloc(
      get<_i17.GetAllPasswordsUseCase>(),
      get<_i15.DeletePasswordUseCase>(),
      get<_i14.SearchPasswordUseCase>(),
      get<_i7.GetCurrentAccountUseCase>()));
  gh.factory<_i21.PasswordSaveBloc>(() => _i21.PasswordSaveBloc(
      get<_i13.SavePasswordUsecase>(), get<_i18.GetPasswordByIdUseCase>()));
  return get;
}
