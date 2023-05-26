import 'package:bookly/core/use_case/use_case.dart';
import 'package:bookly/features/home/domain/repo/home_repo.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../entities/book_entity.dart';

class FetchFeaturesBooksUseCase extends UseCase<List<BookEntity> , NoParam>{
  final HomeRepo homeRepo ;

  FetchFeaturesBooksUseCase(this.homeRepo);

  @override
  Future<Either<Failure, List<BookEntity>>> call([NoParam? param]) async {
    return await homeRepo.fetchFeaturedBooks();
  }
}