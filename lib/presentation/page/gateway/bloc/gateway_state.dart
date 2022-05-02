import 'package:copy_with_extension/copy_with_extension.dart';

part 'gateway_state.g.dart';

enum UserStatus { unregistered, registered }

@CopyWith()
class GatewayState {
  GatewayState({this.userStatus});

  final UserStatus? userStatus;
}
