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

  static String m0(deviceSecureStorage) =>
      "using your device ${deviceSecureStorage}";

  static String m1(copiedText) => "Copied ${copiedText}";

  static String m2(accountName) => "Deleted password for [${accountName}]";

  static String m3(timeLock) => "Too many attempts, try again in ${timeLock}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "answer": MessageLookupByLibrary.simpleMessage("Answer"),
        "benefit1Highlight1": MessageLookupByLibrary.simpleMessage("SECURELY "),
        "benefit1Part1": MessageLookupByLibrary.simpleMessage(
            "A place to remember all of your Passwords for you "),
        "benefit1Part2": m0,
        "benefit2Highlight1": MessageLookupByLibrary.simpleMessage("NOT USED "),
        "benefit2Part1":
            MessageLookupByLibrary.simpleMessage("Internet connection is "),
        "benefit2Part2": MessageLookupByLibrary.simpleMessage(
            "so you can assure that your passwords are not sent anywhere"),
        "cancel": MessageLookupByLibrary.simpleMessage("Cancel"),
        "choosePassword": MessageLookupByLibrary.simpleMessage(
            ", please choose your password"),
        "confirm": MessageLookupByLibrary.simpleMessage("Confirm"),
        "congratulation":
            MessageLookupByLibrary.simpleMessage("Congratulation"),
        "congratulationSubtitle":
            MessageLookupByLibrary.simpleMessage("You are all set up!"),
        "copied": m1,
        "delete": MessageLookupByLibrary.simpleMessage("Delete"),
        "deleteAccount": MessageLookupByLibrary.simpleMessage("Delete Account"),
        "edit": MessageLookupByLibrary.simpleMessage("Edit"),
        "emptyPasswordHint":
            MessageLookupByLibrary.simpleMessage("Save your first password"),
        "errorPassIncorrect":
            MessageLookupByLibrary.simpleMessage("Password incorrect"),
        "getStarted": MessageLookupByLibrary.simpleMessage("Get started"),
        "hi": MessageLookupByLibrary.simpleMessage("Hi "),
        "keyChain": MessageLookupByLibrary.simpleMessage("KeyChain"),
        "keyStore": MessageLookupByLibrary.simpleMessage("KeyStore"),
        "langEn": MessageLookupByLibrary.simpleMessage("English"),
        "langVn": MessageLookupByLibrary.simpleMessage("Vietnamese"),
        "language": MessageLookupByLibrary.simpleMessage("Language"),
        "nameInputError":
            MessageLookupByLibrary.simpleMessage("User name must not be empty"),
        "nameInputHint":
            MessageLookupByLibrary.simpleMessage("Enter your name"),
        "nameInputTitle":
            MessageLookupByLibrary.simpleMessage("What is your name?"),
        "noResults": MessageLookupByLibrary.simpleMessage("No results found"),
        "passSaverHyphen": MessageLookupByLibrary.simpleMessage("PASS-SAVER"),
        "prefDarkMode":
            MessageLookupByLibrary.simpleMessage("Enable dark mode"),
        "prefRequireLogin":
            MessageLookupByLibrary.simpleMessage("Require login on open app"),
        "preferences": MessageLookupByLibrary.simpleMessage("Preferences"),
        "save": MessageLookupByLibrary.simpleMessage("Save"),
        "savePassError":
            MessageLookupByLibrary.simpleMessage("Some fields are empty"),
        "savePassHint":
            MessageLookupByLibrary.simpleMessage("Enter your Password"),
        "savePassHintAccName":
            MessageLookupByLibrary.simpleMessage("Account (abc@gmail.com)"),
        "savePassHintConfirm":
            MessageLookupByLibrary.simpleMessage("Confirm your Password"),
        "savePassHintName":
            MessageLookupByLibrary.simpleMessage("Name (Netflix account)"),
        "savePassHintPasswordName":
            MessageLookupByLibrary.simpleMessage("Password (123456)"),
        "savePassSubTitle": MessageLookupByLibrary.simpleMessage(
            "Your password is only saved locally, you can use network activity to check no Internet connection is establish"),
        "savePassTitle": MessageLookupByLibrary.simpleMessage(
            "Save your Account and Password"),
        "sbAccountDeleted":
            MessageLookupByLibrary.simpleMessage("Account deleted"),
        "sbAnswerWrong":
            MessageLookupByLibrary.simpleMessage("Answer not correct"),
        "sbDeleteError": MessageLookupByLibrary.simpleMessage("Delete Failed"),
        "sbDeletePassword": m2,
        "sbDeleteSuccess":
            MessageLookupByLibrary.simpleMessage("Delete successfully"),
        "sbEditSuccess":
            MessageLookupByLibrary.simpleMessage("Edit password successfully"),
        "sbEye": MessageLookupByLibrary.simpleMessage(
            "Must press eye icon to toggle visibility before copying"),
        "sbLoginError": MessageLookupByLibrary.simpleMessage(
            "Username or password incorect"),
        "sbLoginErrorAttempt": m3,
        "sbSaveSuccess":
            MessageLookupByLibrary.simpleMessage("Password saved successfully"),
        "sbUpdateAccPassSuccess":
            MessageLookupByLibrary.simpleMessage("Account password updated"),
        "sbUpdateSuccess": MessageLookupByLibrary.simpleMessage(
            "Password changed successfully"),
        "search": MessageLookupByLibrary.simpleMessage("Search"),
        "secuQuesDialogTitle": MessageLookupByLibrary.simpleMessage(
            "If you dont answer, you cannot use forget password function"),
        "secuQuesError":
            MessageLookupByLibrary.simpleMessage("Answer must not be empty"),
        "secuQuesHint": MessageLookupByLibrary.simpleMessage("Answer"),
        "secuQuesTitle": MessageLookupByLibrary.simpleMessage(
            "(Optional) Answer a question to retrieve your password when you forget it."),
        "settings": MessageLookupByLibrary.simpleMessage("Settings"),
        "settingsAlwaysAuthen": MessageLookupByLibrary.simpleMessage(
            "Always require authen to see password"),
        "settingsAlwaysShow": MessageLookupByLibrary.simpleMessage(
            "Always show account name and password"),
        "skip": MessageLookupByLibrary.simpleMessage("Skip"),
        "textContinue": MessageLookupByLibrary.simpleMessage("Continue"),
        "undo": MessageLookupByLibrary.simpleMessage("undo"),
        "welcomeBack": MessageLookupByLibrary.simpleMessage("Welcome back"),
        "welcomeTo": MessageLookupByLibrary.simpleMessage("Welcome to")
      };
}
