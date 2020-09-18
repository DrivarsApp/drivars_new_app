import 'dart:async';

import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gogame/locator.dart';
import 'package:gogame/models/api/user.dart';
import 'package:gogame/models/localization_language_model.dart';
import 'package:gogame/services/dialog_service.dart';
import 'package:gogame/services/localization_service.dart';
import 'package:gogame/ui/shared/app_colors.dart';
import 'package:gogame/ui/shared/shared_preference.dart';

export 'package:provider_architecture/provider_architecture.dart';

enum ViewState { Idle, Busy }

class BaseModel extends ChangeNotifier {
  final LocalizationService _localizationService =
      locator<LocalizationService>();
  final DialogService _dialogService = locator<DialogService>();

  StreamSubscription _streamSubscriptionLanguageChange;
  final NavigationService _navigationService = locator<NavigationService>();
  BuildContext context;
  ViewState _state = ViewState.Idle;
  UserDetails user;

  ViewState get state => _state;
  DialogService get dialogService => _dialogService;

  redirectToPage(String routeName, {dynamic arguments}) {
    if (arguments == null)
      _navigationService.navigateTo(routeName);
    else
      _navigationService.navigateTo(routeName, arguments: arguments);
  }

  redirectToPageAwait(String routeName, {dynamic arguments}) async {
    if (arguments == null)
      await _navigationService.navigateTo(routeName);
    else
      await _navigationService.navigateTo(routeName, arguments: arguments);
  }

  redirectWithClearBackStack(String routeName, {dynamic arguments}) {
//    if(arguments==null)
//    _navigationService.navigateTo(routeName);
//    else
    _navigationService.popAllAndNavigateTo(routeName, arguments: arguments);
  }

  BaseModel() {
    _streamSubscriptionLanguageChange =
        _localizationService.languageChangeNotifier.stream.listen((event) {
      print('Got Event languageChange');
      notifyListeners();
    });
  }

  void setState(ViewState viewState) {
    if (_state != viewState) _state = viewState;
    notifyListeners();
  }

  pop() {
    _navigationService.pop();
  }

  String translate(String wordToTranslate) {
    return _localizationService.getValueById(wordToTranslate);
  }

  showLanguagePicker() async {
    _dialogService.showLanguagePicker();
  }

  LocalizationLanguage get currentLanguage =>
      _localizationService.currentLanguage;

  List<LocalizationLanguage> get getAllLanguages =>
      _localizationService.languages;

  bool _busy = false;
  bool get busy => _busy;

  void setBusy(bool value) {
    _busy = value;
    notifyListeners();
  }

  void setLanguage(LocalizationLanguage value) {
//    _busy = value;
//    notifyListeners();
  }

  @override
  Future<void> dispose() async {
//    await _streamSubscriptionLanguageChange.cancel();
//    super.dispose();
  }

  void showMessageInFlushBar(String message, bool isError) {
    try {
      if (message != null) {
        Flushbar(
          message: message,
          flushbarStyle: FlushbarStyle.GROUNDED,
          flushbarPosition: FlushbarPosition.TOP,
          duration: Duration(seconds: 4),
          backgroundColor:
              isError ? Colors.red : AppColors.enabledButtonBackgroundColor,
        ).show(context);
      }
    } catch (e) {
      print(e);
    }
  }

  void showMessageInFlushBarWithContext(
      String message, bool isError, BuildContext context) {
    try {
      if (message != null) {
        Flushbar(
          message: message,
          flushbarStyle: FlushbarStyle.GROUNDED,
          flushbarPosition: FlushbarPosition.TOP,
          duration: Duration(seconds: 4),
          backgroundColor:
              isError ? Colors.red : AppColors.enabledButtonBackgroundColor,
        ).show(context);
      }
    } catch (e) {
      print(e);
    }
  }

  static String formatISOTime(DateTime date) {
    var duration = date.timeZoneOffset;
    if (duration.isNegative)
      return (date.toIso8601String() +
          "-${duration.inHours.toString().padLeft(2, '0')}:${(duration.inMinutes - (duration.inHours * 60)).toString().padLeft(2, '0')}");
    else
      return (date.toIso8601String() +
          "+${duration.inHours.toString().padLeft(2, '0')}:${(duration.inMinutes - (duration.inHours * 60)).toString().padLeft(2, '0')}");
  }

  void getUser() async {
    user = await UserPreference.getUser();
    notifyListeners();
  }
}
