import 'package:bookly/core/errors/failure.dart';
import 'package:bookly/features/home/data/data_source/home_local_data_source.dart';
import 'package:bookly/features/home/data/data_source/home_remote_data_source.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:bookly/features/home/domain/repo/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:hive/hive.dart';

class HomeRepoImpl extends HomeRepo{

  final HomeRemoteDataSource homeRemoteDataSource ;
  final HomeLocalDataSource homeLocalDataSource ;

  HomeRepoImpl({required this.homeRemoteDataSource,required this.homeLocalDataSource});

  @override
  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks()async {
    try {
      var booksList = homeLocalDataSource.fetchFeaturedBooks();
      if (booksList.isNotEmpty) {
        return right(booksList.cast<BookEntity>());

      }
      var books = await homeRemoteDataSource.fetchFeaturedBooks();

      return right(books.cast<BookEntity>());
    }catch (e) {
      return left(Failure());
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> fetchNewestBooks() async {
    try {
      var booksList = homeLocalDataSource.fetchNewestBooks();
      if (booksList.isNotEmpty) {
        return right(booksList.cast<BookEntity>());

      }
      var books = await homeRemoteDataSource.fetchNewestBooks();

      return right(books.cast<BookEntity>());
    }catch (e) {
      return left(Failure());
    }
  }



}