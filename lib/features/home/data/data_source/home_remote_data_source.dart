import 'package:bookly/core/constants.dart';
import 'package:bookly/core/utils/api_service.dart';
import 'package:bookly/core/utils/functions/save_books.dart';
import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:hive/hive.dart';

import 'package:bookly/Features/home/domain/entities/book_entity.dart';

abstract class HomeRemoteDataSource{
  Future<List<BookEntity>> fetchFeaturedBooks();

  Future<List<BookEntity>> fetchNewestBooks();

}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource{
  final ApiService apiService ;

  HomeRemoteDataSourceImpl(this.apiService);
  
  
  @override
  Future<List<BookEntity>> fetchFeaturedBooks() async{
    var data = await apiService.get(endPoint: 'volumes?Filtering=free-ebooks&q=computer science');
    
    List<BookEntity> booksList = getBooksList(data);

    saveBooksData(booksList, KFeaturedBox);

    return booksList;
  }



  List<BookEntity> getBooksList(Map<String, dynamic> data) {
    List<BookEntity> booksList = [] ;
    for(var bookMap in data['items']){
      booksList.add(BookModel.fromJson(bookMap));
    }
    return booksList;
  }

  @override
  Future<List<BookEntity>> fetchNewestBooks() async{
    var data = await apiService.get(endPoint: 'volumes?Filtering=free-ebooks&Sorting=newest&q=computer science');

    List<BookEntity> booksList = getBooksList(data);

    return booksList;
  }

}