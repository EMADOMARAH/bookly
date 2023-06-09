

import 'package:bookly/features/home/data/data_source/home_local_data_source.dart';
import 'package:bookly/features/home/data/data_source/home_remote_data_source.dart';
import 'package:bookly/features/home/data/repo/home_repo_impl.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../api_service.dart';

final getIt = GetIt.instance;


void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(ApiService(Dio()));

  getIt.registerSingleton<HomeRepoImpl>(HomeRepoImpl(
    homeLocalDataSource: HomeLocalDataSourceImpl(),
    homeRemoteDataSource: HomeRemoteDataSourceImpl(getIt.get<ApiService>()),
  ));
}