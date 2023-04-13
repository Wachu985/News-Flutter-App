// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(noticia) => "Selection of ${noticia} News";

  static String m1(noticia) => "${noticia} News";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "tBusiness": MessageLookupByLibrary.simpleMessage("Business"),
        "tCategoryB": MessageLookupByLibrary.simpleMessage("Categories"),
        "tEntertainment": MessageLookupByLibrary.simpleMessage("Entertainment"),
        "tGeneral": MessageLookupByLibrary.simpleMessage("General"),
        "tHealth": MessageLookupByLibrary.simpleMessage("Health"),
        "tLeer": MessageLookupByLibrary.simpleMessage("Read More"),
        "tNoticiaC": m0,
        "tNoticias": m1,
        "tScience": MessageLookupByLibrary.simpleMessage("Science"),
        "tSettingsB": MessageLookupByLibrary.simpleMessage("Settings"),
        "tSports": MessageLookupByLibrary.simpleMessage("Sports"),
        "tSubtitle": MessageLookupByLibrary.simpleMessage(
            "Select the category of your preference."),
        "tTechnology": MessageLookupByLibrary.simpleMessage("Technology"),
        "tTitle": MessageLookupByLibrary.simpleMessage("Categories of News")
      };
}
