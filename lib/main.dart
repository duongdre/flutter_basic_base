import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_basic_base/utils/pref_util.dart';
import 'package:flutter_basic_base/viewmodels/authentication_viewmodel.dart';
import 'package:flutter_basic_base/views/home.dart';

import 'consts/colors/Colors.dart';
import 'consts/strings/str_const.dart';
import 'consts/urls/URLConst.dart';
import 'generated/l10n.dart';
import 'package:provider/provider.dart';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'localization/language_constants.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

Future<void> main() async {
  await S.load(const Locale.fromSubtags(languageCode: 'en')); // mimic localization delegate init

  runZonedGuarded<Future<void>>(() async {
    WidgetsFlutterBinding.ensureInitialized();

    await PrefUtil.init();

    if (PrefUtil.preferences.getBool(StrConst.isDarkMode) == null) {
      var brightness = SchedulerBinding.instance.window.platformBrightness;
      bool isDarkMode = brightness == Brightness.dark;
      PrefUtil.setValue(StrConst.isDarkMode, isDarkMode);
    }
    // if (kDebugMode) {
    //   await _connectToFirebaseEmulator();
    // }

    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.transparent));
      runApp(MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => AuthenticationViewModel(),
          ),
        ],
        child: Builder(builder: (context) {
          return const MyApp();
        }),
      ));
    });
  }, (error, stackTrace) => print(error.toString() + stackTrace.toString()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  static void setLocale(BuildContext context, Locale newLocale) {
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    state?.setLocale(newLocale);
  }

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale _locale = const Locale(StrConst.englishLanguageCode);

  setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    getLocale().then((locale) {
      setState(() {
        _locale = locale;
      });
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    // Provider.of<AuthenticationViewModel>(context, listen: true);
    if (_locale == null) {
      return const Center(child: CircularProgressIndicator());
    } else {
      return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => AuthenticationViewModel()),
        ],
        child: MaterialApp(
          theme: ThemeData(
            highlightColor: Colors.transparent,
            textSelectionTheme: TextSelectionThemeData(
              cursorColor: ColorStyle.getDarkLabel(),
              selectionColor: ColorStyle.getDarkLabel(),
              selectionHandleColor: ColorStyle.getDarkLabel(),
            ),
          ),
          // theme: FlexThemeData.dark(scheme: FlexScheme.mandyRed),
          // // The Mandy red, dark theme.
          // darkTheme: FlexThemeData.light(scheme: FlexScheme.mandyRed),
          // // Use dark or light theme based on system setting.
          // themeMode: ThemeMode.system,
          debugShowCheckedModeBanner: false,
          locale: _locale,
          supportedLocales: const [
            Locale(StrConst.englishLanguageCode, StrConst.englishCountryCode),
          ],
          localizationsDelegates: const [
            // AppLocalization.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          localeResolutionCallback: (locale, supportedLocales) {
            for (var supportedLocale in supportedLocales) {
              if (supportedLocale.languageCode == locale?.languageCode &&
                  supportedLocale.countryCode == locale?.countryCode) {
                return supportedLocale;
              }
            }
            return supportedLocales.first;
          },
          routes: {
            URLConsts.login: (context) => const HomeView(),
          },
          home: _endpoint(),
        ),
      );
    }
  }

  Widget _endpoint() {
    return FutureBuilder(
      future: SharedPreferences.getInstance(),
      builder: (BuildContext context, snapshot) {
        if (true) { ///Nothing here, this is just a logic for learning Builder Design Pattern
          return const HomeView();
        } else {
          return const HomeView();
        }
      },
    );
  }
}

