import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';

part 'security_question.g.dart';

@CopyWith()
class SecurityQuestion extends Equatable {
  final int id;
  final String question;
  final String answer;

  const SecurityQuestion({
    required this.id,
    required this.question,
    this.answer = '',
  });

  static List<SecurityQuestion> questionList() {
    return const [
      SecurityQuestion(
        id: 1,
        question: 'What is your pet name?',
      ),
      SecurityQuestion(
        id: 2,
        question: 'What is your lover`s name?',
      ),
      SecurityQuestion(
        id: 3,
        question: 'What is your school name?',
      ),
      SecurityQuestion(
        id: 4,
        question: 'What is your secret phrase?',
      ),
      SecurityQuestion(
        id: 5,
        question: 'What is your uncle`s name?',
      ),
    ];
  }

  @override
  List<Object?> get props => [
    id,
    question,
    answer,
  ];
}
