abstract class PasswordEvent {}

class GetPasswordEvent extends PasswordEvent {}

class DeletePasswordEvent extends PasswordEvent {
  DeletePasswordEvent({required this.id});

  final String id;
}

class SearchPasswordEvent extends PasswordEvent {
  SearchPasswordEvent({this.keyword = ''});

  final String keyword;
}
