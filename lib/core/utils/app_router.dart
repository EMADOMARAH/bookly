import 'package:bookly/features/home/presentation/views/book_detailes_view.dart';
import 'package:bookly/features/home/presentation/views/home_viewe.dart';
import 'package:bookly/features/search/presentation/views/search_view.dart';
import 'package:go_router/go_router.dart';

import '../../features/splash/presentation/views/splash_view.dart';

abstract class AppRouter{

  static const kHomeView = '/homeView' ;
  static const kBookDetailesView = '/bookDetailesView' ;
  static const kSearchView = '/searchView' ;

  static final router = GoRouter(
    routes: [
      GoRoute(path: '/' , builder: (context , state)=>const SplashView()),
      GoRoute(path: kHomeView , builder: (context , state)=>const HomeView()),
      GoRoute(path: kBookDetailesView , builder: (context , state)=>const BookDetailesView()),
      GoRoute(path: kSearchView , builder: (context , state)=>const SearchView()),

    ],
  );

}