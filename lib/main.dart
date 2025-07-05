import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';
import 'package:oktoast/oktoast.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'core/constants/app_config.dart';
import 'core/constants/local/app_local.dart';
import 'core/utils/getStorage.dart';
import 'core/utils/navigationService.dart';
import 'domain/repositories/product.dart';
import 'presentation/bloc/dashboard/bloc.dart';
import 'presentation/bloc/languages/bloc.dart';
import 'presentation/bloc/languages/event.dart';
import 'presentation/bloc/languages/state.dart';
import 'presentation/bloc/product/bloc.dart';
import 'presentation/bloc/productDetails/bloc.dart';
import 'presentation/bloc/theme/bloc.dart';
import 'presentation/bloc/wishList/bloc.dart';
import 'routes/appRoutes.dart';
import 'test_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
   _init();
  await GetStorage.init();
  runApp(const MyApp());
}



void _init()async{
  PackageInfo packageInfo = await PackageInfo.fromPlatform();
}

/// Main App
class MyApp extends StatelessWidget {
  /// constructor
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    final List<Locale> languages =
        kAppLanguages.map((lang) => lang.locale).toList();
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      child: OKToast(
        child: EasyLocalization(
          path: AppConfig.languageAssetPath,
          supportedLocales: languages,
          fallbackLocale: enLocale,
          startLocale: enLocale,
          child: MultiBlocProvider(
            providers: [
              BlocProvider(
                  create: (context) => ThemeBloc()..add(GetThemeEvent())),
             BlocProvider(create: (context) => LanguagesBloc()..add(ChangeLanguageEvent(locale: enLocale))),
              BlocProvider(create: (context) => DashBoardBloc()),
              BlocProvider(
                  create: (context) => ProductBloc(ProductRepository.instance)),
              BlocProvider(
                  create: (context) => ProductDetailsBloc(
                      repository: ProductRepository.instance)),
              BlocProvider(
                  create: (context) =>
                      WishlistBloc(appGetXStorage: AppGetXStorage.instance)),
             
            ],
            child: BlocBuilder<LanguagesBloc, LanguagesState>(
              builder: (context, localeState) {
                return BlocBuilder<ThemeBloc, ThemeState>(
                  builder: (context, state) {
                    return MaterialApp(
                      key: Key('${localeState.locale}'),
                      navigatorKey: NavigatorService.navigatorKey,
                      debugShowCheckedModeBanner: false,
                      theme: state.themeData,
                      // themeMode: ThemeMode.light,
                      localizationsDelegates: context.localizationDelegates,
                      supportedLocales: context.supportedLocales,
                      locale: localeState.locale,

                      onGenerateRoute: AppRoutes.generateRoute,
                      // initialRoute: AppRoutes.initialRoute,
                      home: TestPage(),
                    );
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
