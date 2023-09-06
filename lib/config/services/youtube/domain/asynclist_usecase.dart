import 'package:dartz/dartz.dart';

import 'package:respira_acao/config/error/failure.dart';

abstract class AsyncListUseCase<Type, Params> {
  Future<Either<Failure, List<Type>>> call(Params params);
}

class NoParams {}
