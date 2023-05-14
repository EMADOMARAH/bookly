import 'package:bookly/features/home/presentation/views/book_detailes_view.dart';
import 'package:bookly/features/home/presentation/views/home_viewe.dart';
import 'package:go_router/go_router.dart';

import '../../features/splash/presentation/views/splash_view.dart';

abstract class AppRouter{

  static const kHomeView = '/homeView' ;
  static const kBookDetailesView = '/bookDetailesView' ;

  static final router = GoRouter(
    routes: [
      GoRoute(path: '/' , builder: (context , state)=>const SplashView()),
      GoRoute(path: kHomeView , builder: (context , state)=>const HomeView()),
      GoRoute(path: kBookDetailesView , builder: (context , state)=>const BookDetailesView()),

    ],
  );

}