abstract class BaseUseCase<I, O> {
  Future<O> execute(I input);
}
