import 'package:flutter/foundation.dart';
import 'package:gogame/models/api/profile.dart';
import 'package:gogame/ui/shared/shared_preference.dart';

class UserProvider with ChangeNotifier {
  String userFullName,
      userName,
      userMobile,
      userCoverImage,
      userEmail,
      userProfileImage,
      userCoin,
      userCash;

  void init() async {
    userName = await UserPreference.getUsername();
    userMobile = await UserPreference.getMobileNo();
    userEmail = await UserPreference.getUserEmail() ?? '';
    userFullName = await UserPreference.getUserFullName();
    userCoverImage = await UserPreference.getUserCoverImageUrl() ?? '';
    userProfileImage = await UserPreference.getUserProfileImageUrl() ?? '';
    userCoin = await UserPreference.getUserCoin() ?? '';
    userCash = await UserPreference.getUserCash() ?? '';
  }

  void update(Profile profile) async {
    UserPreference.setUserFullName(profile.fullname);
    userFullName = await UserPreference.getUserFullName();
    UserPreference.setUserProfileImageUrl(profile.profilephoto);
    userProfileImage = await UserPreference.getUserProfileImageUrl();
    UserPreference.setUserCoverImageUrl(profile.coverphoto);
    userCoverImage = await UserPreference.getUserCoverImageUrl();
    UserPreference.setUsername(profile.username);
    userName = await UserPreference.getUsername();
    UserPreference.setMobileNo(profile.mobileno);
    userMobile = await UserPreference.getMobileNo();
    UserPreference.setUserEmail(profile.email);
    userEmail = await UserPreference.getUserEmail();
    notifyListeners();
  }

  void updateCoin(String coin) async {
    UserPreference.setUserCoin(coin);
    userCoin = await UserPreference.getUserCoin();
    notifyListeners();
  }

  void updateCash(String cash) async {
    UserPreference.setUserCash(cash);
    userCash = await UserPreference.getUserCash();
    notifyListeners();
  }
}
