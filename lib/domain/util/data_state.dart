abstract class DataState {}

class DSLoading extends DataState {}

class DSSuccess<T> extends DataState {
  DSSuccess(this.data);

  final T? data;
}

class DSFailure<T> extends DataState {
  DSFailure(this.e);

  final Exception e;
}
