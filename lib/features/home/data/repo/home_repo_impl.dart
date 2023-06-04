import 'package:bookly/core/errors/failure.dart';
import 'package:bookly/features/home/data/data_source/home_local_data_source.dart';
import 'package:bookly/features/home/data/data_source/home_remote_data_source.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:bookly/features/home/domain/repo/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl extends HomeRepo {
  final HomeRemoteDataSource homeRemoteDataSource;

  final HomeLocalDataSource homeLocalDataSource;

  HomeRepoImpl({required this.homeRemoteDataSource, required this.homeLocalDataSource});

  @override
  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks() async {
    try {
      List<BookEntity> booksList;
      booksList = homeLocalDataSource.fetchFeaturedBooks().cast<BookEntity>();
      if (booksList.isNotEmpty) {
        return right(booksList.cast<BookEntity>());
      }
      booksList = (await homeRemoteDataSource.fetchFeaturedBooks()).cast<BookEntity>();

      return right(booksList.cast<BookEntity>());
    } catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }else{
        return left(ServerFailure(e.toString()));
      }

    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> fetchNewestBooks() async {
    try {
      List<BookEntity> books;
      books = homeLocalDataSource.fetchNewestBooks().cast<BookEntity>();
      if (books.isNotEmpty) {
        return right(books.cast<BookEntity>());
      }
      books = (await homeRemoteDataSource.fetchNewestBooks()).cast<BookEntity>();

      return right(books.cast<BookEntity>());
    } catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }else{
        return left(ServerFailure(e.toString()));
      }

    }
  }
}
