class API {
  static const String domain = 'https://api.gogame.in/api/';
  static const String imageAddress = 'https://dashboard.gogame.in:4444/';
  static const String profileImageAddress = 'https://api.gogame.in/';

  static String baseURL = domain; // live base url

  static String loginUser = baseURL + 'login';
  static String checkOTP = baseURL + 'checkotp';
  static String checkUser = baseURL + 'checkuser';
  static String addUsername = baseURL + 'addUsername';

  static String getUserCoin = baseURL + 'getusercoin';
  static String getUserAmount = baseURL + 'getuseramount';

  static String getDashboard = baseURL + 'dashboard';

  static String addHelpdesk = baseURL + 'addhelpdesk';
  static String addFeedback = baseURL + 'addfeedback';

  static String paymentStart = baseURL + 'paymentstart';
  static String paymentUpdate = baseURL + 'paymentupdate';

  static String coinHistory = baseURL + 'coinhistory';
  static String paymentHistory = baseURL + 'paymenthistory';

  static String getUserProfile = baseURL + 'getprofile';
  static String updateUserProfile = baseURL + 'editprofile';

  static String updateProfilePhoto = baseURL + 'editprofilephoto';
  static String removePhoto = baseURL + 'removeProfilePhoto';

  static String updateCoverPhoto = baseURL + 'editcoverphoto';
  static String removeCoverPhoto = baseURL + 'removeCoverPhoto';

  static String getDocumentData = baseURL + 'documentData';
  static String uploadKyc = baseURL + 'uploadDocument';

  static String getReferralCode = baseURL + 'refereallist';

  static String uploadBankDetails = baseURL + 'addbankdetail';
  static String getBankDetails = baseURL + 'getbankdetail';

  static String addCashOffers = baseURL + 'offerlist';

  static String withdrawHistory = baseURL + 'withdrawhistory';
  static String withdrawMoney = baseURL + 'withdrawmoney';
}
