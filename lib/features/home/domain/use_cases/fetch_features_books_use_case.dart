import 'package:bookly/features/home/domain/repo/home_repo.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../entities/book_entity.dart';

class FetchFeaturesBooksUseCase{
  final HomeRepo homeRepo ;

  FetchFeaturesBooksUseCase(this.homeRepo);


  Future<Either<Failure,List<BookEntity>>> fetchFeaturedBooks(){
    return homeRepo.fetchFeaturedBooks();
  }

  Future<Either<Failure,List<BookEntity>> > fetchNewestBooks(){
    return homeRepo.fetchNewestBooks();
  }
}