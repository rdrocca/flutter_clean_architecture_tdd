import 'package:dartz/dartz.dart';

import '../../domain/core/failures.dart';
import '../../domain/number_trivia/number_trivia.dart';

abstract class INumberTriviaRepository {
  Future<Either<Failures, NumberTrivia>> getConcreteNumberTrivia(int number);
  Future<Either<Failures, NumberTrivia>> getRandomTrivia();
}
