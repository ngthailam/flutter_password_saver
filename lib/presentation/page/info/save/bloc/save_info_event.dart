abstract class SaveInfoEvent {}

class ConfirmSaveInfoEvent extends SaveInfoEvent {}

class PrefetchInfoEvent extends SaveInfoEvent {
  final String? infoId;

  PrefetchInfoEvent({required this.infoId});
}
