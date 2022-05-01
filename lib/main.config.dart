// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'data/datasource/password_local_data_source.dart' as _i3;
import 'data/repository/password_repo_impl.dart' as _i5;
import 'domain/repository/password_repo.dart' as _i4;
import 'domain/usecase/password/delete_password_use_case.dart' as _i8;
import 'domain/usecase/password/get_all_paswords_use_case.dart' as _i9;
import 'domain/usecase/password/get_password_by_id_use_case.dart' as _i10;
import 'domain/usecase/password/save_password_use_case.dart' as _i6;
import 'domain/usecase/password/search_password_use_case.dart' as _i7;
import 'presentation/page/password/create/bloc/password_save_bloc.dart' as _i12;
import 'presentation/page/password/list/bloc/password_bloc.dart'
    as _i11; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.PasswordLocalDataSource>(
      () => _i3.PasswordLocalDataSourceImpl());
  gh.factory<_i4.PasswordRepository>(
      () => _i5.PasswordRepositoryImpl(get<_i3.PasswordLocalDataSource>()));
  gh.factory<_i6.SavePasswordUsecase>(
      () => _i6.SavePasswordUsecase(get<_i4.PasswordRepository>()));
  gh.factory<_i7.SearchPasswordUseCase>(
      () => _i7.SearchPasswordUseCase(get<_i4.PasswordRepository>()));
  gh.factory<_i8.DeletePasswordUseCase>(
      () => _i8.DeletePasswordUseCase(get<_i4.PasswordRepository>()));
  gh.factory<_i9.GetAllPasswordsUseCase>(
      () => _i9.GetAllPasswordsUseCase(get<_i4.PasswordRepository>()));
  gh.factory<_i10.GetPasswordByIdUseCase>(
      () => _i10.GetPasswordByIdUseCase(get<_i4.PasswordRepository>()));
  gh.factory<_i11.PasswordBloc>(() => _i11.PasswordBloc(
      get<_i9.GetAllPasswordsUseCase>(),
      get<_i8.DeletePasswordUseCase>(),
      get<_i7.SearchPasswordUseCase>()));
  gh.factory<_i12.PasswordSaveBloc>(() => _i12.PasswordSaveBloc(
      get<_i6.SavePasswordUsecase>(), get<_i10.GetPasswordByIdUseCase>()));
  return get;
}
