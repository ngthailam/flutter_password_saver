abstract class InfoEvent {}

class InfoInitializeEvent extends InfoEvent {}

class SearchInfoEvent extends InfoEvent {
  final String keyword;

  SearchInfoEvent({required this.keyword});
}

class InfoRefreshDataEvent extends InfoEvent {}

class DeleteInfoEvent extends InfoEvent {
  final String infoId;

  DeleteInfoEvent({required this.infoId});
}

class UndoDeleteInfoEvent extends InfoEvent {}
