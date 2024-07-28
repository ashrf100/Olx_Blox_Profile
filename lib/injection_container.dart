import 'package:olx_bloc/core/services/geocoding_service.dart';
import 'package:olx_bloc/core/services/geolocator_service.dart';
import 'package:olx_bloc/core/services/google_maps_servive.dart';
import 'package:olx_bloc/core/services/network_info.dart';
import 'package:olx_bloc/features/auth/data/datasources/Auth_local_data_source.dart';
import 'package:olx_bloc/features/auth/data/datasources/auth_Remote_data_source.dart';
import 'package:olx_bloc/features/auth/data/repositories/auth_repository_imp.dart';
import 'package:olx_bloc/features/auth/domain/repositories/auth_repository.dart';
import 'package:olx_bloc/features/auth/domain/usecase/auth_usecases.dart';
import 'package:olx_bloc/features/auth/presentation/bloc/auth/auth_bloc.dart';
import 'package:olx_bloc/features/auth/presentation/bloc/auth_control/auth_control_cubit.dart';
import 'package:olx_bloc/features/cart/data/datasources/cart_remote_data_source.dart';
import 'package:olx_bloc/features/cart/data/repositories/cart_repository_imp.dart';
import 'package:olx_bloc/features/cart/domain/repositories/cart_repostiory.dart';
import 'package:olx_bloc/features/cart/domain/usecase/cart_usecases.dart';
import 'package:olx_bloc/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:olx_bloc/features/localizations/data/datasources/localizations_local_data_source.dart';
import 'package:olx_bloc/features/localizations/data/repositories/localization_repository_imp.dart';
import 'package:olx_bloc/features/localizations/domain/repository/localization_repository.dart';
import 'package:olx_bloc/features/localizations/domain/usecase/localization_usecases.dart';
import 'package:olx_bloc/features/localizations/presentation/cubit/local_cubit.dart';
import 'package:olx_bloc/features/main/presentation/cubit/main_cubit.dart';
import 'package:olx_bloc/features/maps/data/datasources/local_data_source.dart';
import 'package:olx_bloc/features/maps/data/datasources/remote_data_source.dart';
import 'package:olx_bloc/features/maps/data/repositories/maps_repository_impl.dart';
import 'package:olx_bloc/features/maps/domain/repositories/maps_repository.dart';
import 'package:olx_bloc/features/maps/domain/usecases/get_current_location.dart';
import 'package:olx_bloc/features/maps/domain/usecases/save_location.dart';
import 'package:olx_bloc/features/maps/presentation/bloc/location/location_bloc.dart';
import 'package:olx_bloc/features/maps/presentation/bloc/maps/maps_bloc.dart';
import 'package:olx_bloc/features/products/data/datasources/Products_local_data_source.dart';
import 'package:olx_bloc/features/products/data/datasources/products_remote_data_source.dart';
import 'package:olx_bloc/features/products/data/repositories/products_repository_imp.dart';
import 'package:olx_bloc/features/products/domain/repositories/products_repository.dart';
import 'package:olx_bloc/features/products/domain/usecase/products_usecase.dart';
import 'package:olx_bloc/features/products/presentation/bloc/category/category_bloc.dart';
import 'package:olx_bloc/features/products/presentation/bloc/home/home_bloc.dart';
import 'package:olx_bloc/features/products/presentation/bloc/product_info/product_info_cubit.dart';
import 'package:olx_bloc/features/products/presentation/bloc/products/products_bloc.dart';

import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:olx_bloc/features/products/presentation/bloc/search/search_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Bloc
  sl.registerFactory(() => ProductsBloc(
        getHomeDataUseCase: sl(),
        getAppCategoriesUseCase: sl(),
        getAppProductsUseCase: sl(),
      ));
  sl.registerFactory(() => HomeBloc(getHomeDataUseCase: sl()));
  sl.registerFactory(() => MapsBloc());
  sl.registerFactory(() => LocationBloc(
        getCurrentLocation: sl(),
        saveLocation: sl(),
        geocodingService: sl(),
      ));

  sl.registerFactory(() => SearchBloc(
      getAppSearchProductsUseCase: sl(), getCachedRecentSearch: sl()));

  sl.registerFactory(() => CategoryBloc(getAppProductsUseCase: sl()));
  sl.registerFactory(() => CartBloc(
        getCartUseCase: sl(),
        addToCartUseCase: sl(),
      ));
  sl.registerFactory(() => ProductInfoCubit());
  sl.registerFactory(() => MainCubit());
  sl.registerFactory(() => AuthControlCubit());

  sl.registerFactory(() => LocalCubit(
      getLocalizationUseCase: sl(), changeLocalizationUseCase: sl()));

  sl.registerFactory(() => AuthBloc(
      logInUseCase: sl(), getCachedUserUseCase: sl(), logoutUseCase: sl()));

  // Usecases
  sl.registerLazySingleton(() => GetCurrentLocation(repository: sl()));
  sl.registerLazySingleton(() => SaveLocation(repository: sl()));

  sl.registerLazySingleton(() => GetLocalizationUseCase(repository: sl()));
  sl.registerLazySingleton(() => ChangeLocalizationUseCase(repository: sl()));

  sl.registerLazySingleton(() => GetHomeDataUseCase(repostiory: sl()));
  sl.registerLazySingleton(() => GetAppProductsUseCase(repostiory: sl()));
  sl.registerLazySingleton(() => GetAppCategoriesUseCase(repostiory: sl()));
  sl.registerLazySingleton(() => GetCartUseCase(repostiory: sl()));
  sl.registerLazySingleton(() => AddToCartUseCase(repostiory: sl()));
  sl.registerLazySingleton(() => LogInUseCase(repostiory: sl()));
  sl.registerLazySingleton(() => GetCachedUserUseCase(repostiory: sl()));
  sl.registerLazySingleton(() => LogoutUseCase(repostiory: sl()));
  sl.registerLazySingleton(() => GetAppSearchProductsUseCase(repostiory: sl()));
  sl.registerLazySingleton(
      () => GetCachedRecentSearchUseCase(repostiory: sl()));

  // Repository
  sl.registerLazySingleton<ProductsRepostiory>(() => ProductsRepositoryImpl(
        networkInfo: sl(),
        productsRemoteDataSource: sl(),
        productsLocalDataSource: sl(),
      ));

  sl.registerLazySingleton<MapsRepository>(() => MapsRepositoryImpl(
        networkInfo: sl(),
        localDataSource: sl(),
        remoteDataSource: sl(),
      ));
  sl.registerLazySingleton<CartRepository>(
      () => CartRepositoryImpl(networkInfo: sl(), cartRemoteDataSource: sl()));
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(
      networkInfo: sl(),
      authRemoteDataSource: sl(),
      authlocalDataSource: sl()));

  sl.registerLazySingleton<LocalizationRepository>(
      () => LocalizationRepositoryImpl(localizationDataSource: sl()));

  sl.registerLazySingleton<MapsLocalDataSource>(
      () => LocalDataSourceImpl(sharedPreferences: sl()));

  sl.registerLazySingleton<MapsRemoteDataSource>(() => RemoteDataSourceImpl());

  // Datasources ProductsLocalDataSource
  sl.registerLazySingleton<ProductsRemoteDataSource>(
      () => ProductsRemoteDataSourceHttp(client: sl()));

  sl.registerLazySingleton<LocalizationDataSource>(
      () => LocalizationDataSourceImpl(sharedPreferences: sl()));

  sl.registerLazySingleton<CartRemoteDataSource>(
      () => CartRemoteDataSourceHttp(client: sl()));
  sl.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceHttp(client: sl()));
  sl.registerLazySingleton<AuthLocalDataSource>(
      () => AuthLocalDataSourceImpl(sharedPreferences: sl()));
  sl.registerLazySingleton<ProductsLocalDataSource>(
      () => ProductsLocalDataSourceImpl(sharedPreferences: sl()));

  // Core
  sl.registerLazySingleton<GoogleMapsService>(() => GoogleMapsServiceImpl());
  sl.registerLazySingleton<GeocodingService>(() => GeocodingService());

  sl.registerLazySingleton<GeolocatorService>(() => GeolocatorServiceImpl());
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(
        internetConnectionChecker: sl(),
      ));

  // External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
