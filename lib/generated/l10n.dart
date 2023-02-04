// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `BASE`
  String get base {
    return Intl.message(
      'BASE',
      name: 'base',
      desc: '',
      args: [],
    );
  }

  /// `Test API call`
  String get test_api {
    return Intl.message(
      'Test API call',
      name: 'test_api',
      desc: '',
      args: [],
    );
  }

  /// `NO DATA RECEIVED`
  String get error_no_data {
    return Intl.message(
      'NO DATA RECEIVED',
      name: 'error_no_data',
      desc: '',
      args: [],
    );
  }

  /// `Error`
  String get error {
    return Intl.message(
      'Error',
      name: 'error',
      desc: '',
      args: [],
    );
  }

  /// `Error`
  String get name_empty_error {
    return Intl.message(
      'Error',
      name: 'name_empty_error',
      desc: '',
      args: [],
    );
  }

  /// `Error`
  String get mobile_empty_error {
    return Intl.message(
      'Error',
      name: 'mobile_empty_error',
      desc: '',
      args: [],
    );
  }

  /// `Error`
  String get email_empty_error {
    return Intl.message(
      'Error',
      name: 'email_empty_error',
      desc: '',
      args: [],
    );
  }

  /// `Error`
  String get email_invalid_error {
    return Intl.message(
      'Error',
      name: 'email_invalid_error',
      desc: '',
      args: [],
    );
  }

  /// `Error`
  String get password_empty_error {
    return Intl.message(
      'Error',
      name: 'password_empty_error',
      desc: '',
      args: [],
    );
  }

  /// `Error`
  String get password_short_error {
    return Intl.message(
      'Error',
      name: 'password_short_error',
      desc: '',
      args: [],
    );
  }

  /// `Error`
  String get user_not_approved_error {
    return Intl.message(
      'Error',
      name: 'user_not_approved_error',
      desc: '',
      args: [],
    );
  }

  /// `Error`
  String get user_not_existed_error {
    return Intl.message(
      'Error',
      name: 'user_not_existed_error',
      desc: '',
      args: [],
    );
  }

  /// `Error`
  String get un_authorized_error {
    return Intl.message(
      'Error',
      name: 'un_authorized_error',
      desc: '',
      args: [],
    );
  }

  /// `Error`
  String get current_password_empty_error {
    return Intl.message(
      'Error',
      name: 'current_password_empty_error',
      desc: '',
      args: [],
    );
  }

  /// `Error`
  String get new_password_empty_error {
    return Intl.message(
      'Error',
      name: 'new_password_empty_error',
      desc: '',
      args: [],
    );
  }

  /// `Error`
  String get repeat_password_empty_error {
    return Intl.message(
      'Error',
      name: 'repeat_password_empty_error',
      desc: '',
      args: [],
    );
  }

  /// `Error`
  String get password_not_match_error {
    return Intl.message(
      'Error',
      name: 'password_not_match_error',
      desc: '',
      args: [],
    );
  }

  /// `Error`
  String get not_login_error {
    return Intl.message(
      'Error',
      name: 'not_login_error',
      desc: '',
      args: [],
    );
  }

  /// `OK`
  String get ok {
    return Intl.message(
      'OK',
      name: 'ok',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
