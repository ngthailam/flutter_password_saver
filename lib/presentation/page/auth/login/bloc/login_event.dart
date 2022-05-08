abstract class LoginEvent {}

class LoginInitializeEvent extends LoginEvent {}
class ConfirmLoginEvent extends LoginEvent {}
class LoginBiometricsEvent extends LoginEvent {}