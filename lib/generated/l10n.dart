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

  /// `General`
  String get tGeneral {
    return Intl.message(
      'General',
      name: 'tGeneral',
      desc: '',
      args: [],
    );
  }

  /// `Business`
  String get tBusiness {
    return Intl.message(
      'Business',
      name: 'tBusiness',
      desc: '',
      args: [],
    );
  }

  /// `Entertainment`
  String get tEntertainment {
    return Intl.message(
      'Entertainment',
      name: 'tEntertainment',
      desc: '',
      args: [],
    );
  }

  /// `Health`
  String get tHealth {
    return Intl.message(
      'Health',
      name: 'tHealth',
      desc: '',
      args: [],
    );
  }

  /// `Science`
  String get tScience {
    return Intl.message(
      'Science',
      name: 'tScience',
      desc: '',
      args: [],
    );
  }

  /// `Sports`
  String get tSports {
    return Intl.message(
      'Sports',
      name: 'tSports',
      desc: '',
      args: [],
    );
  }

  /// `Technology`
  String get tTechnology {
    return Intl.message(
      'Technology',
      name: 'tTechnology',
      desc: '',
      args: [],
    );
  }

  /// `Categories of News`
  String get tTitle {
    return Intl.message(
      'Categories of News',
      name: 'tTitle',
      desc: '',
      args: [],
    );
  }

  /// `Select the category of your preference.`
  String get tSubtitle {
    return Intl.message(
      'Select the category of your preference.',
      name: 'tSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `{noticia} News`
  String tNoticias(Object noticia) {
    return Intl.message(
      '$noticia News',
      name: 'tNoticias',
      desc: '',
      args: [noticia],
    );
  }

  /// `Selection of {noticia} News`
  String tNoticiaC(Object noticia) {
    return Intl.message(
      'Selection of $noticia News',
      name: 'tNoticiaC',
      desc: '',
      args: [noticia],
    );
  }

  /// `Categories`
  String get tCategoryB {
    return Intl.message(
      'Categories',
      name: 'tCategoryB',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get tSettingsB {
    return Intl.message(
      'Settings',
      name: 'tSettingsB',
      desc: '',
      args: [],
    );
  }

  /// `Read More`
  String get tLeer {
    return Intl.message(
      'Read More',
      name: 'tLeer',
      desc: '',
      args: [],
    );
  }

  /// `en`
  String get languaje {
    return Intl.message(
      'en',
      name: 'languaje',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get tSettings {
    return Intl.message(
      'Settings',
      name: 'tSettings',
      desc: '',
      args: [],
    );
  }

  /// `System settings`
  String get tSubSettings {
    return Intl.message(
      'System settings',
      name: 'tSubSettings',
      desc: '',
      args: [],
    );
  }

  /// `Change Language:`
  String get tCambiarIdioma {
    return Intl.message(
      'Change Language:',
      name: 'tCambiarIdioma',
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
      Locale.fromSubtags(languageCode: 'es'),
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
