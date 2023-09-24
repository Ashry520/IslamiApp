import 'package:flutter/material.dart';
import 'package:islamic/Home/hadeth/HadethScreen.dart';
import 'package:islamic/Home/home.dart';
import 'package:islamic/Home/quran/SurahScreen.dart';
import 'package:islamic/Home/shared/constant.dart';
import 'package:islamic/Home/shared/shared_pref.dart';
import 'package:islamic/my_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamic/provider/app_config_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  appLanguage = CacheHelper.getData(key: 'lang');
  if (appLanguage == '' || appLanguage == null) {
    appLanguage = 'en';
  }

  bool? theme = CacheHelper.getData(key: 'isLight');
  if (theme == null || theme == true) {
    appTheme = ThemeMode.light;
  } else {
    appTheme = ThemeMode.dark;
  }

  runApp(ChangeNotifierProvider(
      create: (context) => AppConfigProvider(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return MaterialApp(
      title: 'Islamic',
      debugShowCheckedModeBanner: false,
      initialRoute: Home.routeName,
      routes: {
        Home.routeName: (context) => Home(),
        SurahScreen.routeName: (context) => SurahScreen(),
        HadethScreen.routeName: (context) => HadethScreen(),
      },
      locale: Locale(appLanguage!),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: MyTheme.lightMode,
      darkTheme: MyTheme.darkMode,
      themeMode: appTheme,
    );
  }
}
