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

  /// `Home`
  String get Home {
    return Intl.message(
      'Home',
      name: 'Home',
      desc: '',
      args: [],
    );
  }

  /// `Products`
  String get Products {
    return Intl.message(
      'Products',
      name: 'Products',
      desc: '',
      args: [],
    );
  }

  /// `User`
  String get User {
    return Intl.message(
      'User',
      name: 'User',
      desc: '',
      args: [],
    );
  }

  /// `Cart`
  String get Cart {
    return Intl.message(
      'Cart',
      name: 'Cart',
      desc: '',
      args: [],
    );
  }

  /// `Deliver to`
  String get Deliverto {
    return Intl.message(
      'Deliver to',
      name: 'Deliverto',
      desc: '',
      args: [],
    );
  }

  /// `login`
  String get login {
    return Intl.message(
      'login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `username`
  String get username {
    return Intl.message(
      'username',
      name: 'username',
      desc: '',
      args: [],
    );
  }

  /// `password`
  String get password {
    return Intl.message(
      'password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password `
  String get confirmpassword {
    return Intl.message(
      'Confirm Password ',
      name: 'confirmpassword',
      desc: '',
      args: [],
    );
  }

  /// `confirm new password`
  String get confirmnewpassword {
    return Intl.message(
      'confirm new password',
      name: 'confirmnewpassword',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// ` Save New Password`
  String get SaveNewPassword {
    return Intl.message(
      ' Save New Password',
      name: 'SaveNewPassword',
      desc: '',
      args: [],
    );
  }

  /// `All Categories`
  String get AllCategories {
    return Intl.message(
      'All Categories',
      name: 'AllCategories',
      desc: '',
      args: [],
    );
  }

  /// `Next `
  String get next {
    return Intl.message(
      'Next ',
      name: 'next',
      desc: '',
      args: [],
    );
  }

  /// `Back `
  String get back {
    return Intl.message(
      'Back ',
      name: 'back',
      desc: '',
      args: [],
    );
  }

  /// `Email is required`
  String get emailIsRequired {
    return Intl.message(
      'Email is required',
      name: 'emailIsRequired',
      desc: '',
      args: [],
    );
  }

  /// `OTP code is required`
  String get otpCodeIsRequired {
    return Intl.message(
      'OTP code is required',
      name: 'otpCodeIsRequired',
      desc: '',
      args: [],
    );
  }

  /// `New password is required`
  String get newPasswordIsRequired {
    return Intl.message(
      'New password is required',
      name: 'newPasswordIsRequired',
      desc: '',
      args: [],
    );
  }

  /// `Confirm new password is required`
  String get confirmNewPasswordIsRequired {
    return Intl.message(
      'Confirm new password is required',
      name: 'confirmNewPasswordIsRequired',
      desc: '',
      args: [],
    );
  }

  /// `Passwords do not match`
  String get passwordsDoNotMatch {
    return Intl.message(
      'Passwords do not match',
      name: 'passwordsDoNotMatch',
      desc: '',
      args: [],
    );
  }

  /// `Tap on the map to select your delivery location`
  String get TapOnTheMapToSelectYourDeliveryLocation {
    return Intl.message(
      'Tap on the map to select your delivery location',
      name: 'TapOnTheMapToSelectYourDeliveryLocation',
      desc: '',
      args: [],
    );
  }

  /// `You Delivery Location Saved Successfully`
  String get YouDeliveryLocationSavedSuccessfully {
    return Intl.message(
      'You Delivery Location Saved Successfully',
      name: 'YouDeliveryLocationSavedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Username or Password Not Correct`
  String get UsernameorPasswordNotCorrect {
    return Intl.message(
      'Username or Password Not Correct',
      name: 'UsernameorPasswordNotCorrect',
      desc: '',
      args: [],
    );
  }

  /// `Please Check your Internet Connection`
  String get PleaseCheckyourInternetConnection {
    return Intl.message(
      'Please Check your Internet Connection',
      name: 'PleaseCheckyourInternetConnection',
      desc: '',
      args: [],
    );
  }

  /// `We apologize, but this feature is currently disabled.`
  String get WeApologizeSignupisCurrentlyDisabled {
    return Intl.message(
      'We apologize, but this feature is currently disabled.',
      name: 'WeApologizeSignupisCurrentlyDisabled',
      desc: '',
      args: [],
    );
  }

  /// `Please try again later`
  String get Pleasetryagainlater {
    return Intl.message(
      'Please try again later',
      name: 'Pleasetryagainlater',
      desc: '',
      args: [],
    );
  }

  /// `Submit`
  String get Submit {
    return Intl.message(
      'Submit',
      name: 'Submit',
      desc: '',
      args: [],
    );
  }

  /// `Are you Sure to Logout ?? `
  String get AreyouSuretoLogout {
    return Intl.message(
      'Are you Sure to Logout ?? ',
      name: 'AreyouSuretoLogout',
      desc: '',
      args: [],
    );
  }

  /// `OLX is an agile e-commerce app built with Dart and Flutter, featuring Bloc for smooth navigation and Google Maps for an enhanced experience. It utilizes DummyJSON.com's data for a lifelike user platform.`
  String get onboarding1 {
    return Intl.message(
      'OLX is an agile e-commerce app built with Dart and Flutter, featuring Bloc for smooth navigation and Google Maps for an enhanced experience. It utilizes DummyJSON.com\'s data for a lifelike user platform.',
      name: 'onboarding1',
      desc: '',
      args: [],
    );
  }

  /// `OLX offers a smooth user experience with a simple login process, including a '?' icon for quick access or a selection of user profiles from https://dummyjson.com/users for personalized entry.`
  String get onboarding2 {
    return Intl.message(
      'OLX offers a smooth user experience with a simple login process, including a \'?\' icon for quick access or a selection of user profiles from https://dummyjson.com/users for personalized entry.',
      name: 'onboarding2',
      desc: '',
      args: [],
    );
  }

  /// `The app boasts a friendly home screen, diverse categories, smart search, and an easy cart system. With integrated maps and customizable settings, OLX makes shopping and delivery straightforward.`
  String get onboarding3 {
    return Intl.message(
      'The app boasts a friendly home screen, diverse categories, smart search, and an easy cart system. With integrated maps and customizable settings, OLX makes shopping and delivery straightforward.',
      name: 'onboarding3',
      desc: '',
      args: [],
    );
  }

  /// `yes`
  String get yes {
    return Intl.message(
      'yes',
      name: 'yes',
      desc: '',
      args: [],
    );
  }

  /// `no`
  String get no {
    return Intl.message(
      'no',
      name: 'no',
      desc: '',
      args: [],
    );
  }

  /// `Get Started`
  String get GetStarted {
    return Intl.message(
      'Get Started',
      name: 'GetStarted',
      desc: '',
      args: [],
    );
  }

  /// `Enter your User Name`
  String get EnteryourUserName {
    return Intl.message(
      'Enter your User Name',
      name: 'EnteryourUserName',
      desc: '',
      args: [],
    );
  }

  /// `Enter the OTP code`
  String get EntertheOTPcode {
    return Intl.message(
      'Enter the OTP code',
      name: 'EntertheOTPcode',
      desc: '',
      args: [],
    );
  }

  /// `New Password`
  String get newpassword {
    return Intl.message(
      'New Password',
      name: 'newpassword',
      desc: '',
      args: [],
    );
  }

  /// `Password Has Changed `
  String get PasswordHasChanged {
    return Intl.message(
      'Password Has Changed ',
      name: 'PasswordHasChanged',
      desc: '',
      args: [],
    );
  }

  /// `Reset Password `
  String get ResetPassword {
    return Intl.message(
      'Reset Password ',
      name: 'ResetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Enter your User Password`
  String get EnteryourUserPassword {
    return Intl.message(
      'Enter your User Password',
      name: 'EnteryourUserPassword',
      desc: '',
      args: [],
    );
  }

  /// `Enter your User phone`
  String get EnteryourUserphone {
    return Intl.message(
      'Enter your User phone',
      name: 'EnteryourUserphone',
      desc: '',
      args: [],
    );
  }

  /// `Enter your User email`
  String get EnteryourUseremail {
    return Intl.message(
      'Enter your User email',
      name: 'EnteryourUseremail',
      desc: '',
      args: [],
    );
  }

  /// `Forget Password`
  String get ForgetPassword {
    return Intl.message(
      'Forget Password',
      name: 'ForgetPassword',
      desc: '',
      args: [],
    );
  }

  /// `LOG IN`
  String get LOGIN {
    return Intl.message(
      'LOG IN',
      name: 'LOGIN',
      desc: '',
      args: [],
    );
  }

  /// `SIGN UP`
  String get SIGNUP {
    return Intl.message(
      'SIGN UP',
      name: 'SIGNUP',
      desc: '',
      args: [],
    );
  }

  /// `version 1.0.0`
  String get version {
    return Intl.message(
      'version 1.0.0',
      name: 'version',
      desc: '',
      args: [],
    );
  }

  /// `See all`
  String get Seeall {
    return Intl.message(
      'See all',
      name: 'Seeall',
      desc: '',
      args: [],
    );
  }

  /// `Today Offers`
  String get TodayOffers {
    return Intl.message(
      'Today Offers',
      name: 'TodayOffers',
      desc: '',
      args: [],
    );
  }

  /// `Smart phones`
  String get Smartphones {
    return Intl.message(
      'Smart phones',
      name: 'Smartphones',
      desc: '',
      args: [],
    );
  }

  /// `Top Selles`
  String get TopSelles {
    return Intl.message(
      'Top Selles',
      name: 'TopSelles',
      desc: '',
      args: [],
    );
  }

  /// `TOP`
  String get TOP {
    return Intl.message(
      'TOP',
      name: 'TOP',
      desc: '',
      args: [],
    );
  }

  /// `Flash Sale`
  String get FlashSale {
    return Intl.message(
      'Flash Sale',
      name: 'FlashSale',
      desc: '',
      args: [],
    );
  }

  /// `LapTops`
  String get LapTops {
    return Intl.message(
      'LapTops',
      name: 'LapTops',
      desc: '',
      args: [],
    );
  }

  /// `Suggested Products`
  String get SuggestedProducts {
    return Intl.message(
      'Suggested Products',
      name: 'SuggestedProducts',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get Logout {
    return Intl.message(
      'Logout',
      name: 'Logout',
      desc: '',
      args: [],
    );
  }

  /// `View Orders`
  String get ViewOrders {
    return Intl.message(
      'View Orders',
      name: 'ViewOrders',
      desc: '',
      args: [],
    );
  }

  /// `View Locations`
  String get ViewLocations {
    return Intl.message(
      'View Locations',
      name: 'ViewLocations',
      desc: '',
      args: [],
    );
  }

  /// `Change Password`
  String get ChangePassword {
    return Intl.message(
      'Change Password',
      name: 'ChangePassword',
      desc: '',
      args: [],
    );
  }

  /// `Change Email`
  String get ChangeEmail {
    return Intl.message(
      'Change Email',
      name: 'ChangeEmail',
      desc: '',
      args: [],
    );
  }

  /// `Change Language`
  String get ChangeLanguage {
    return Intl.message(
      'Change Language',
      name: 'ChangeLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Dark Mode`
  String get DarkMode {
    return Intl.message(
      'Dark Mode',
      name: 'DarkMode',
      desc: '',
      args: [],
    );
  }

  /// `Enable Notifications`
  String get EnableNotifications {
    return Intl.message(
      'Enable Notifications',
      name: 'EnableNotifications',
      desc: '',
      args: [],
    );
  }

  /// ` Add To Cart`
  String get AddToCart {
    return Intl.message(
      ' Add To Cart',
      name: 'AddToCart',
      desc: '',
      args: [],
    );
  }

  /// `OFF`
  String get OFF {
    return Intl.message(
      'OFF',
      name: 'OFF',
      desc: '',
      args: [],
    );
  }

  /// `price`
  String get price {
    return Intl.message(
      'price',
      name: 'price',
      desc: '',
      args: [],
    );
  }

  /// `Discount`
  String get Discount {
    return Intl.message(
      'Discount',
      name: 'Discount',
      desc: '',
      args: [],
    );
  }

  /// `Before \n discount`
  String get Beforediscount {
    return Intl.message(
      'Before \n discount',
      name: 'Beforediscount',
      desc: '',
      args: [],
    );
  }

  /// `Total`
  String get Total {
    return Intl.message(
      'Total',
      name: 'Total',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Payment`
  String get ConfirmPayment {
    return Intl.message(
      'Confirm Payment',
      name: 'ConfirmPayment',
      desc: '',
      args: [],
    );
  }

  /// `Product count`
  String get Productcount {
    return Intl.message(
      'Product count',
      name: 'Productcount',
      desc: '',
      args: [],
    );
  }

  /// `Total Quantity`
  String get TotalQuantity {
    return Intl.message(
      'Total Quantity',
      name: 'TotalQuantity',
      desc: '',
      args: [],
    );
  }

  /// `Change Password Done`
  String get ChangePasswordDone {
    return Intl.message(
      'Change Password Done',
      name: 'ChangePasswordDone',
      desc: '',
      args: [],
    );
  }

  /// `Change email Done`
  String get ChangeemailDone {
    return Intl.message(
      'Change email Done',
      name: 'ChangeemailDone',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get Search {
    return Intl.message(
      'Search',
      name: 'Search',
      desc: '',
      args: [],
    );
  }

  /// `Has been Successfully Added to your Cart`
  String get HasbeenSuccessfullyAddedtoyourCart {
    return Intl.message(
      'Has been Successfully Added to your Cart',
      name: 'HasbeenSuccessfullyAddedtoyourCart',
      desc: '',
      args: [],
    );
  }

  /// `save loction`
  String get saveloction {
    return Intl.message(
      'save loction',
      name: 'saveloction',
      desc: '',
      args: [],
    );
  }

  /// `Delivery Location Info`
  String get DeliveryLocationInfo {
    return Intl.message(
      'Delivery Location Info',
      name: 'DeliveryLocationInfo',
      desc: '',
      args: [],
    );
  }

  /// `country`
  String get country {
    return Intl.message(
      'country',
      name: 'country',
      desc: '',
      args: [],
    );
  }

  /// `subAdministrativeArea`
  String get subAdministrativeArea {
    return Intl.message(
      'subAdministrativeArea',
      name: 'subAdministrativeArea',
      desc: '',
      args: [],
    );
  }

  /// `locality`
  String get locality {
    return Intl.message(
      'locality',
      name: 'locality',
      desc: '',
      args: [],
    );
  }

  /// `street`
  String get street {
    return Intl.message(
      'street',
      name: 'street',
      desc: '',
      args: [],
    );
  }

  /// `home`
  String get home {
    return Intl.message(
      'home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `work`
  String get work {
    return Intl.message(
      'work',
      name: 'work',
      desc: '',
      args: [],
    );
  }

  /// `Additional Data`
  String get AdditionalData {
    return Intl.message(
      'Additional Data',
      name: 'AdditionalData',
      desc: '',
      args: [],
    );
  }

  /// `Select Your Language`
  String get SelectYourLanguage {
    return Intl.message(
      'Select Your Language',
      name: 'SelectYourLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Arabic`
  String get Arabic {
    return Intl.message(
      'Arabic',
      name: 'Arabic',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get English {
    return Intl.message(
      'English',
      name: 'English',
      desc: '',
      args: [],
    );
  }

  /// `required `
  String get isrequired {
    return Intl.message(
      'required ',
      name: 'isrequired',
      desc: '',
      args: [],
    );
  }

  /// `Welcome Back `
  String get WelcomeBack {
    return Intl.message(
      'Welcome Back ',
      name: 'WelcomeBack',
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
      Locale.fromSubtags(languageCode: 'ar'),
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
