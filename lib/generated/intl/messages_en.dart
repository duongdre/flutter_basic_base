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

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "base": MessageLookupByLibrary.simpleMessage("BASE"),
        "current_password_empty_error":
            MessageLookupByLibrary.simpleMessage("Error"),
        "email_empty_error": MessageLookupByLibrary.simpleMessage("Error"),
        "email_invalid_error": MessageLookupByLibrary.simpleMessage("Error"),
        "error": MessageLookupByLibrary.simpleMessage("Error"),
        "error_no_data":
            MessageLookupByLibrary.simpleMessage("NO DATA RECEIVED"),
        "mobile_empty_error": MessageLookupByLibrary.simpleMessage("Error"),
        "name_empty_error": MessageLookupByLibrary.simpleMessage("Error"),
        "new_password_empty_error":
            MessageLookupByLibrary.simpleMessage("Error"),
        "not_login_error": MessageLookupByLibrary.simpleMessage("Error"),
        "ok": MessageLookupByLibrary.simpleMessage("OK"),
        "password_empty_error": MessageLookupByLibrary.simpleMessage("Error"),
        "password_not_match_error":
            MessageLookupByLibrary.simpleMessage("Error"),
        "password_short_error": MessageLookupByLibrary.simpleMessage("Error"),
        "repeat_password_empty_error":
            MessageLookupByLibrary.simpleMessage("Error"),
        "test_api": MessageLookupByLibrary.simpleMessage("Test API call"),
        "un_authorized_error": MessageLookupByLibrary.simpleMessage("Error"),
        "user_not_approved_error":
            MessageLookupByLibrary.simpleMessage("Error"),
        "user_not_existed_error": MessageLookupByLibrary.simpleMessage("Error")
      };
}
