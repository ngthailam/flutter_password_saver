import 'package:copy_with_extension/copy_with_extension.dart';

part 'gateway_state.g.dart';

@CopyWith()
class GatewayState {
  GatewayState({this.destinationRouteName});

  final String? destinationRouteName;
}
