import 'package:gogame/models/api/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreference {
  static SharedPreferences pref;

  static String userName = 'userName';
  static String userId = 'userId';
  static String accessID = 'accessID';
  static String mobile = 'mobile';
  static String userFullName = 'userFullName';
  static String userEmail = 'userEmail';
  static String userCoverImageUrl = 'userCoverImageUrl';
  static String userProfileImageUrl = 'userProfileImageUrl';
  static String userCoin = 'userCoin';
  static String userCash = 'userCash';

  static Future<SharedPreferences> getPrefObject() async {
    if (pref == null) pref = await SharedPreferences.getInstance();
    return pref;
  }

  static Future<void> saveUserDetails(
      String username, String user_id, String access_id, String mobile) async {
    print('user data $user_id\n$username\n$access_id');
    pref = await getPrefObject();
    pref.setString(userId, user_id);
    pref.setString(userName, username);
    pref.setString(accessID, access_id);
    pref.setString(UserPreference.mobile, mobile);
  }

  static Future<UserDetails> getUser() async {
    pref = await getPrefObject();
    UserDetails user = new UserDetails(
        userName: pref.getString(userName),
        phoneNumber: pref.getString(mobile),
        userId: pref.getString(userId),
        accessID: pref.getString(accessID));
    return user;
  }

  static Future<bool> setUserLogin(bool isUserLogin) async {
    await getPrefObject();
    pref.setBool('isUserLogin', isUserLogin);
    return true;
  }

  static Future<bool> getUserLogin() async {
    await getPrefObject();
    return pref.getBool('isUserLogin');
  }

  static Future<bool> setMobileNo(String mobileNo) async {
    await getPrefObject();
    pref.setString(mobile, mobileNo);
    return true;
  }

  static Future<String> getMobileNo() async {
    await getPrefObject();
    return pref.getString(mobile);
  }

  static Future<bool> setUsername(String username) async {
    await getPrefObject();
    pref.setString(userName, username);
    return true;
  }

  static Future<String> getUsername() async {
    await getPrefObject();
    return pref.getString(userName);
  }

  static Future<String> getUserId() async {
    await getPrefObject();
    return pref.getString(userId);
  }

  static Future<String> getAccessToken() async {
    await getPrefObject();
    return pref.getString(accessID);
  }

  static Future<bool> setUserEmail(String useremail) async {
    await getPrefObject();
    pref.setString(userEmail, useremail);
    return true;
  }

  static Future<String> getUserEmail() async {
    await getPrefObject();
    return pref.getString(userEmail);
  }

  static Future<bool> setUserFullName(String userfullname) async {
    await getPrefObject();
    pref.setString(userFullName, userfullname);
    return true;
  }

  static Future<String> getUserFullName() async {
    await getPrefObject();
    return pref.getString(userFullName);
  }

  static Future<bool> setUserCoverImageUrl(String coverImageUrl) async {
    await getPrefObject();
    pref.setString(userCoverImageUrl, coverImageUrl);
    return true;
  }

  static Future<String> getUserCoverImageUrl() async {
    await getPrefObject();
    return pref.getString(userCoverImageUrl);
  }

  static Future<bool> setUserProfileImageUrl(String profileImageUrl) async {
    await getPrefObject();
    pref.setString(userProfileImageUrl, profileImageUrl);
    return true;
  }

  static Future<String> getUserProfileImageUrl() async {
    await getPrefObject();
    return pref.getString(userProfileImageUrl);
  }

  static Future<bool> setUserCoin(String coin) async {
    await getPrefObject();
    pref.setString(userCoin, coin);
    return true;
  }

  static Future<String> getUserCoin() async {
    await getPrefObject();
    return pref.getString(userCoin);
  }

  static Future<bool> setUserCash(String cash) async {
    await getPrefObject();
    pref.setString(userCash, cash);
    return true;
  }

  static Future<String> getUserCash() async {
    await getPrefObject();
    return pref.getString(userCash);
  }
}
