import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture_tdd/domain/core/failures.dart';

import './i_number_trivia_repository.dart';
import 'number_trivia.dart';

class GetConcreteNumberTrivia {
  final INumberTriviaRepository repository;

  GetConcreteNumberTrivia(this.repository);

  Future<Either<Failures, NumberTrivia>> execute({required int number}) async {
    return await repository.getConcreteNumberTrivia(number);
  }
}
