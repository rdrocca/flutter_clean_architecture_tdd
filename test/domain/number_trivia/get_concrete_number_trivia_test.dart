import 'package:dartz/dartz.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_clean_architecture_tdd/domain/number_trivia/get_concrete_number_trivia.dart';
import 'package:flutter_clean_architecture_tdd/domain/number_trivia/i_number_trivia_repository.dart';
import 'package:flutter_clean_architecture_tdd/domain/number_trivia/number_trivia.dart';

class MockNumberTriviaRepository extends Mock
    implements INumberTriviaRepository {}

void main() {
  late MockNumberTriviaRepository mockNumberTriviaRepository;
  late GetConcreteNumberTrivia usecase;

  setUp(() {
    mockNumberTriviaRepository = MockNumberTriviaRepository();
    usecase = GetConcreteNumberTrivia(mockNumberTriviaRepository);
  });

  const tNumber = 1;
  const tNumberTrivia = NumberTrivia(number: 1, text: 'test');

  test(
    'should get trivia for the number from the repository',
    () async {
      // arrange
      when(() => mockNumberTriviaRepository.getConcreteNumberTrivia(any()))
          .thenAnswer((_) async => const Right(tNumberTrivia));
      // act
      final result = await usecase.execute(number: tNumber);
      // assert
      expect(result, const Right(tNumberTrivia));
      verify(() => mockNumberTriviaRepository.getConcreteNumberTrivia(tNumber));
      verifyNoMoreInteractions(mockNumberTriviaRepository);
    },
  );
}
