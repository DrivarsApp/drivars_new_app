import 'package:gogame/viewmodels/base_model.dart';

class LoginWithFacebookViewModel extends BaseModel {
//  static final FacebookLogin facebookSignIn = new FacebookLogin();
//
//  String messagegen = 'Log in/out by pressing the buttons below.';
//
//  Future<Null> login() async {
//    final FacebookLoginResult result = await facebookSignIn.logIn(['email']);
//
//    switch (result.status) {
//      case FacebookLoginStatus.loggedIn:
//        final FacebookAccessToken accessToken = result.accessToken;
//        showMessage('''
//         Logged in!
//
//         Token: ${accessToken.token}
//         User id: ${accessToken.userId}
//         Expires: ${accessToken.expires}
//         Permissions: ${accessToken.permissions}
//         Declined permissions: ${accessToken.declinedPermissions}
//         ''');
//        break;
//      case FacebookLoginStatus.cancelledByUser:
//        showMessage('Login cancelled by the user.');
//        break;
//      case FacebookLoginStatus.error:
//        showMessage('Something went wrong with the login process.\n'
//            'Here\'s the error Facebook gave us: ${result.errorMessage}');
//        break;
//    }
//  }
//
//  Future<Null> logOut() async {
//    await facebookSignIn.logOut();
//    showMessage('Logged out.');
//  }
//
//  void showMessage(String message) {
//    messagegen = message;
//    notifyListeners();
//  }
}

// class LoginWithFacebookViewModel extends StatefulWidget {
//   @override
//   _MyAppState createState() => new _MyAppState();
// }

// class _MyAppState extends State<LoginWithFacebookViewModel> {
//   static final FacebookLogin facebookSignIn = new FacebookLogin();

//   String _message = 'Log in/out by pressing the buttons below.';

//   Future<Null> _login() async {
//     final FacebookLoginResult result = await facebookSignIn.logIn(['email']);

//     switch (result.status) {
//       case FacebookLoginStatus.loggedIn:
//         final FacebookAccessToken accessToken = result.accessToken;
//         _showMessage('''
//          Logged in!

//          Token: ${accessToken.token}
//          User id: ${accessToken.userId}
//          Expires: ${accessToken.expires}
//          Permissions: ${accessToken.permissions}
//          Declined permissions: ${accessToken.declinedPermissions}
//          ''');
//         break;
//       case FacebookLoginStatus.cancelledByUser:
//         _showMessage('Login cancelled by the user.');
//         break;
//       case FacebookLoginStatus.error:
//         _showMessage('Something went wrong with the login process.\n'
//             'Here\'s the error Facebook gave us: ${result.errorMessage}');
//         break;
//     }
//   }

//   Future<Null> _logOut() async {
//     await facebookSignIn.logOut();
//     _showMessage('Logged out.');
//   }

//   void _showMessage(String message) {
//     setState(() {
//       _message = message;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return new MaterialApp(
//       home: new Scaffold(
//         appBar: new AppBar(
//           title: new Text('Plugin example app'),
//         ),
//         body: new Center(
//           child: new Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               new Text(_message),
//               new RaisedButton(
//                 onPressed: _login,
//                 child: new Text('Log in'),
//               ),
//               new RaisedButton(
//                 onPressed: _logOut,
//                 child: new Text('Logout'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
