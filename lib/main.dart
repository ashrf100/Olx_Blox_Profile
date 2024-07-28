import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:olx_bloc/core/const/app_routes.dart';
import 'package:olx_bloc/core/const/colors.dart';
import 'package:olx_bloc/core/helper/route_generator.dart';
import 'package:olx_bloc/core/themes/themes.dart';
import 'package:olx_bloc/generated/l10n.dart';

import 'package:olx_bloc/features/auth/presentation/bloc/auth/auth_bloc.dart';
import 'package:olx_bloc/features/auth/presentation/bloc/auth_control/auth_control_cubit.dart';
import 'package:olx_bloc/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:olx_bloc/features/localizations/presentation/cubit/local_cubit.dart';
import 'package:olx_bloc/features/main/presentation/cubit/main_cubit.dart';
import 'package:olx_bloc/features/maps/presentation/bloc/location/location_bloc.dart';
import 'package:olx_bloc/features/maps/presentation/bloc/maps/maps_bloc.dart';
import 'package:olx_bloc/features/products/presentation/bloc/category/category_bloc.dart';
import 'package:olx_bloc/features/products/presentation/bloc/home/home_bloc.dart';
import 'package:olx_bloc/features/products/presentation/bloc/product_info/product_info_cubit.dart';
import 'package:olx_bloc/features/products/presentation/bloc/products/products_bloc.dart';
import 'package:olx_bloc/features/products/presentation/bloc/search/search_bloc.dart';

import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  configureSystemUI();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      designSize: const Size(360, 690),
      builder: (context, child) => const AppBlocProviders(
        child: AppLocalizationsBuilder(),
      ),
    );
  }
}

class AppBlocProviders extends StatelessWidget {
  final Widget child;

  const AppBlocProviders({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (_) => di.sl<AuthBloc>()..add(GetCachedUserEvent())),
        BlocProvider(create: (_) => di.sl<AuthControlCubit>()),
        BlocProvider(create: (_) => di.sl<CartBloc>()),
        BlocProvider(create: (_) => di.sl<CategoryBloc>()),
        BlocProvider(create: (_) => di.sl<HomeBloc>()),
        BlocProvider(create: (_) => di.sl<LocationBloc>()),
        BlocProvider(create: (_) => di.sl<MainCubit>()),
        BlocProvider(create: (_) => di.sl<MapsBloc>()),
        BlocProvider(create: (_) => di.sl<ProductInfoCubit>()),
        BlocProvider(create: (_) => di.sl<ProductsBloc>()),
        BlocProvider(create: (_) => di.sl<SearchBloc>()),
        BlocProvider(
          lazy: false,
          create: (_) => di.sl<LocalCubit>()..getSavedLanguage(),
        ),
      ],
      child: child,
    );
  }
}

class AppLocalizationsBuilder extends StatelessWidget {
  const AppLocalizationsBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocalCubit, ChangeLocaleState>(
      builder: (context, state) {
        return MaterialApp(
          initialRoute: AppRoutes.splash,
          onGenerateRoute: RouteGenerator.generateRoute,
          locale: Locale(state.localization.languageCode),
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          debugShowCheckedModeBanner: false,
          theme: state.localization.languageCode == "en"                                                                                                                                                                                                  
              ? AppTheme.themeData()
              : AppTheme.themeDataAR(),
        );
      },
    );
  }
}

void configureSystemUI() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: AppColors.primaryDark,
      systemNavigationBarColor: AppColors.primaryDark,
      systemNavigationBarDividerColor: AppColors.primaryDark,
    ),
  );
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);
}
