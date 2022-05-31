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

  /// `Welcome to`
  String get welcomeTo {
    return Intl.message(
      'Welcome to',
      name: 'welcomeTo',
      desc: '',
      args: [],
    );
  }

  /// `PASS-SAVER`
  String get passSaverHyphen {
    return Intl.message(
      'PASS-SAVER',
      name: 'passSaverHyphen',
      desc: '',
      args: [],
    );
  }

  /// `A place to remember all of your Passwords for you `
  String get benefit1Part1 {
    return Intl.message(
      'A place to remember all of your Passwords for you ',
      name: 'benefit1Part1',
      desc: '',
      args: [],
    );
  }

  /// `SECURELY `
  String get benefit1Highlight1 {
    return Intl.message(
      'SECURELY ',
      name: 'benefit1Highlight1',
      desc: '',
      args: [],
    );
  }

  /// `using your device {deviceSecureStorage}`
  String benefit1Part2(Object deviceSecureStorage) {
    return Intl.message(
      'using your device $deviceSecureStorage',
      name: 'benefit1Part2',
      desc: '',
      args: [deviceSecureStorage],
    );
  }

  /// `Internet connection is `
  String get benefit2Part1 {
    return Intl.message(
      'Internet connection is ',
      name: 'benefit2Part1',
      desc: '',
      args: [],
    );
  }

  /// `NOT USED `
  String get benefit2Highlight1 {
    return Intl.message(
      'NOT USED ',
      name: 'benefit2Highlight1',
      desc: '',
      args: [],
    );
  }

  /// `so you can assure that your passwords are not sent anywhere`
  String get benefit2Part2 {
    return Intl.message(
      'so you can assure that your passwords are not sent anywhere',
      name: 'benefit2Part2',
      desc: '',
      args: [],
    );
  }

  /// `Get started`
  String get getStarted {
    return Intl.message(
      'Get started',
      name: 'getStarted',
      desc: '',
      args: [],
    );
  }

  /// `KeyStore`
  String get keyStore {
    return Intl.message(
      'KeyStore',
      name: 'keyStore',
      desc: '',
      args: [],
    );
  }

  /// `KeyChain`
  String get keyChain {
    return Intl.message(
      'KeyChain',
      name: 'keyChain',
      desc: '',
      args: [],
    );
  }

  /// `What is your name?`
  String get nameInputTitle {
    return Intl.message(
      'What is your name?',
      name: 'nameInputTitle',
      desc: '',
      args: [],
    );
  }

  /// `Enter your name`
  String get nameInputHint {
    return Intl.message(
      'Enter your name',
      name: 'nameInputHint',
      desc: '',
      args: [],
    );
  }

  /// `User name must not be empty`
  String get nameInputError {
    return Intl.message(
      'User name must not be empty',
      name: 'nameInputError',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get textContinue {
    return Intl.message(
      'Continue',
      name: 'textContinue',
      desc: '',
      args: [],
    );
  }

  /// `Congratulation`
  String get congratulation {
    return Intl.message(
      'Congratulation',
      name: 'congratulation',
      desc: '',
      args: [],
    );
  }

  /// `You are all set up!`
  String get congratulationSubtitle {
    return Intl.message(
      'You are all set up!',
      name: 'congratulationSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `If you dont answer, you cannot use forget password function`
  String get secuQuesDialogTitle {
    return Intl.message(
      'If you dont answer, you cannot use forget password function',
      name: 'secuQuesDialogTitle',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get confirm {
    return Intl.message(
      'Confirm',
      name: 'confirm',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Skip`
  String get skip {
    return Intl.message(
      'Skip',
      name: 'skip',
      desc: '',
      args: [],
    );
  }

  /// `(Optional) Answer a question to retrieve your password when you forget it.`
  String get secuQuesTitle {
    return Intl.message(
      '(Optional) Answer a question to retrieve your password when you forget it.',
      name: 'secuQuesTitle',
      desc: '',
      args: [],
    );
  }

  /// `Answer`
  String get secuQuesHint {
    return Intl.message(
      'Answer',
      name: 'secuQuesHint',
      desc: '',
      args: [],
    );
  }

  /// `Answer`
  String get answer {
    return Intl.message(
      'Answer',
      name: 'answer',
      desc: '',
      args: [],
    );
  }

  /// `Answer must not be empty`
  String get secuQuesError {
    return Intl.message(
      'Answer must not be empty',
      name: 'secuQuesError',
      desc: '',
      args: [],
    );
  }

  /// `Hi `
  String get hi {
    return Intl.message(
      'Hi ',
      name: 'hi',
      desc: '',
      args: [],
    );
  }

  /// `, please choose your password`
  String get choosePassword {
    return Intl.message(
      ', please choose your password',
      name: 'choosePassword',
      desc: '',
      args: [],
    );
  }

  /// `Some fields are empty`
  String get savePassError {
    return Intl.message(
      'Some fields are empty',
      name: 'savePassError',
      desc: '',
      args: [],
    );
  }

  /// `Enter your Password`
  String get savePassHint {
    return Intl.message(
      'Enter your Password',
      name: 'savePassHint',
      desc: '',
      args: [],
    );
  }

  /// `Confirm your Password`
  String get savePassHintConfirm {
    return Intl.message(
      'Confirm your Password',
      name: 'savePassHintConfirm',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message(
      'Search',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Save your first password`
  String get emptyPasswordHint {
    return Intl.message(
      'Save your first password',
      name: 'emptyPasswordHint',
      desc: '',
      args: [],
    );
  }

  /// `No results found`
  String get noResults {
    return Intl.message(
      'No results found',
      name: 'noResults',
      desc: '',
      args: [],
    );
  }

  /// `Preferences`
  String get preferences {
    return Intl.message(
      'Preferences',
      name: 'preferences',
      desc: '',
      args: [],
    );
  }

  /// `Delete Account`
  String get deleteAccount {
    return Intl.message(
      'Delete Account',
      name: 'deleteAccount',
      desc: '',
      args: [],
    );
  }

  /// `Require login on open app`
  String get prefRequireLogin {
    return Intl.message(
      'Require login on open app',
      name: 'prefRequireLogin',
      desc: '',
      args: [],
    );
  }

  /// `Enable dark mode`
  String get prefDarkMode {
    return Intl.message(
      'Enable dark mode',
      name: 'prefDarkMode',
      desc: '',
      args: [],
    );
  }

  /// `Save your Account and Password`
  String get savePassTitle {
    return Intl.message(
      'Save your Account and Password',
      name: 'savePassTitle',
      desc: '',
      args: [],
    );
  }

  /// `Your password is only saved locally, you can use network activity to check no Internet connection is establish`
  String get savePassSubTitle {
    return Intl.message(
      'Your password is only saved locally, you can use network activity to check no Internet connection is establish',
      name: 'savePassSubTitle',
      desc: '',
      args: [],
    );
  }

  /// `Name (Netflix account)`
  String get savePassHintName {
    return Intl.message(
      'Name (Netflix account)',
      name: 'savePassHintName',
      desc: '',
      args: [],
    );
  }

  /// `Account (abc@gmail.com)`
  String get savePassHintAccName {
    return Intl.message(
      'Account (abc@gmail.com)',
      name: 'savePassHintAccName',
      desc: '',
      args: [],
    );
  }

  /// `Password (123456)`
  String get savePassHintPasswordName {
    return Intl.message(
      'Password (123456)',
      name: 'savePassHintPasswordName',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message(
      'Save',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `Password saved successfully`
  String get sbSaveSuccess {
    return Intl.message(
      'Password saved successfully',
      name: 'sbSaveSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Username or password incorect`
  String get sbLoginError {
    return Intl.message(
      'Username or password incorect',
      name: 'sbLoginError',
      desc: '',
      args: [],
    );
  }

  /// `Too many attempts, try again in {timeLock}`
  String sbLoginErrorAttempt(Object timeLock) {
    return Intl.message(
      'Too many attempts, try again in $timeLock',
      name: 'sbLoginErrorAttempt',
      desc: '',
      args: [timeLock],
    );
  }

  /// `Account deleted`
  String get sbAccountDeleted {
    return Intl.message(
      'Account deleted',
      name: 'sbAccountDeleted',
      desc: '',
      args: [],
    );
  }

  /// `Answer not correct`
  String get sbAnswerWrong {
    return Intl.message(
      'Answer not correct',
      name: 'sbAnswerWrong',
      desc: '',
      args: [],
    );
  }

  /// `Password changed successfully`
  String get sbUpdateSuccess {
    return Intl.message(
      'Password changed successfully',
      name: 'sbUpdateSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Edit password successfully`
  String get sbEditSuccess {
    return Intl.message(
      'Edit password successfully',
      name: 'sbEditSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Deleted password for [{accountName}]`
  String sbDeletePassword(Object accountName) {
    return Intl.message(
      'Deleted password for [$accountName]',
      name: 'sbDeletePassword',
      desc: '',
      args: [accountName],
    );
  }

  /// `Copied {copiedText}`
  String copied(Object copiedText) {
    return Intl.message(
      'Copied $copiedText',
      name: 'copied',
      desc: '',
      args: [copiedText],
    );
  }

  /// `Must press eye icon to toggle visibility before copying`
  String get sbEye {
    return Intl.message(
      'Must press eye icon to toggle visibility before copying',
      name: 'sbEye',
      desc: '',
      args: [],
    );
  }

  /// `Delete successfully`
  String get sbDeleteSuccess {
    return Intl.message(
      'Delete successfully',
      name: 'sbDeleteSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Delete Failed`
  String get sbDeleteError {
    return Intl.message(
      'Delete Failed',
      name: 'sbDeleteError',
      desc: '',
      args: [],
    );
  }

  /// `Account password updated`
  String get sbUpdateAccPassSuccess {
    return Intl.message(
      'Account password updated',
      name: 'sbUpdateAccPassSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Welcome back`
  String get welcomeBack {
    return Intl.message(
      'Welcome back',
      name: 'welcomeBack',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get delete {
    return Intl.message(
      'Delete',
      name: 'delete',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Edit`
  String get edit {
    return Intl.message(
      'Edit',
      name: 'edit',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get langEn {
    return Intl.message(
      'English',
      name: 'langEn',
      desc: '',
      args: [],
    );
  }

  /// `Vietnamese`
  String get langVn {
    return Intl.message(
      'Vietnamese',
      name: 'langVn',
      desc: '',
      args: [],
    );
  }

  /// `Always show account name and password`
  String get settingsAlwaysShow {
    return Intl.message(
      'Always show account name and password',
      name: 'settingsAlwaysShow',
      desc: '',
      args: [],
    );
  }

  /// `Always require authen to see password`
  String get settingsAlwaysAuthen {
    return Intl.message(
      'Always require authen to see password',
      name: 'settingsAlwaysAuthen',
      desc: '',
      args: [],
    );
  }

  /// `Password incorrect`
  String get errorPassIncorrect {
    return Intl.message(
      'Password incorrect',
      name: 'errorPassIncorrect',
      desc: '',
      args: [],
    );
  }

  /// `undo`
  String get undo {
    return Intl.message(
      'undo',
      name: 'undo',
      desc: '',
      args: [],
    );
  }

  /// `Press this button to start create a new password`
  String get onboard_desc_create {
    return Intl.message(
      'Press this button to start create a new password',
      name: 'onboard_desc_create',
      desc: '',
      args: [],
    );
  }

  /// `Hold and drag passwords to reorder them to your liking`
  String get onboard_desc_reorder {
    return Intl.message(
      'Hold and drag passwords to reorder them to your liking',
      name: 'onboard_desc_reorder',
      desc: '',
      args: [],
    );
  }

  /// `Swipe left on passwords for more actions`
  String get onboard_desc_swipe {
    return Intl.message(
      'Swipe left on passwords for more actions',
      name: 'onboard_desc_swipe',
      desc: '',
      args: [],
    );
  }

  /// `Press this icon to open app settings`
  String get onboard_desc_settings {
    return Intl.message(
      'Press this icon to open app settings',
      name: 'onboard_desc_settings',
      desc: '',
      args: [],
    );
  }

  /// `Always show account name`
  String get prefDarkModeShowAccName {
    return Intl.message(
      'Always show account name',
      name: 'prefDarkModeShowAccName',
      desc: '',
      args: [],
    );
  }

  /// `An error has occured`
  String get errorUnknown {
    return Intl.message(
      'An error has occured',
      name: 'errorUnknown',
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
      Locale.fromSubtags(languageCode: 'vi'),
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
