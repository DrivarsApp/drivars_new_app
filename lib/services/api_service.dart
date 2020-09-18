import 'dart:convert';
import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:fimber/fimber_base.dart';
import 'package:gogame/ui/shared/shared_preference.dart';

class ApiService {
  static int successStatusCode = 200;
  static int badRequest = 400;
  static int notFound = 404;

  static Dio dio = new Dio();

  static Future init() async {
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
    dio.options.followRedirects = false;
    dio.options.validateStatus = (status) {
      return status < 500;
    };

    dio.options.connectTimeout = 20000; //5s
    dio.options.receiveTimeout = 200000;
    return;
  }

  static getAuthHeader() async {
    return {
      "Authorization": '', //await UserPreference.getHeader(),
      "content-type": "application/x-www-form-urlencoded"
    };
  }

  static Future<void> postRequest(
      {String url,
      Map<String, dynamic> params,
      Function onError,
      Function onSuccess,
      bool header = true}) async {
    Fimber.i('API URL ==> $url');
    Fimber.i('Params ==> $params');
    dio.options.headers['Content-Type'] = 'application/json';
    if (header) {
      var token = await UserPreference.getAccessToken();
      dio.options.headers['x-access-token'] = '$token';
    }
    Fimber.i('Headers ==> ${dio.options.headers}');

    try {
      var response = await dio.post(url, data: params);
      printAPIResponseAndResponseCode(response);
      if (isValidResponse(response))
        try {
//          await UserPreference.setUserLogin(true);
          onSuccess(response.data);
        } catch (e) {
          Fimber.i("EXPTION $e");
          onSuccess(response.data);
        }
      else {
        Fimber.i('API Error ==> ${response.statusCode}');
        onError(response.data['message'], response.data);
      }
    } catch (e) {
      Fimber.i('postRequest ==> $e');
//      errorHandaling(e, onError);
    }
    return;
  }

  static Future<void> formDataPostRequest(
      {String url,
      Map<String, dynamic> params,
      Function onError,
      Function onSuccess,
      bool header = true}) async {
    Fimber.i('API URL ==> $url');
    Fimber.i('Params ==> $params');
    dio.options.headers['Content-Type'] = 'application/json';
    if (header) {
      var token = await UserPreference.getAccessToken();
      dio.options.headers['x-access-token'] = '$token';
    }
    Fimber.i('Headers ==> ${dio.options.headers}');

    try {
      var response = await dio.post(url, data: FormData.fromMap(params));
      printAPIResponseAndResponseCode(response);
      if (isValidResponse(response))
        try {
          onSuccess(response.data);
        } catch (e) {
          Fimber.i("EXCEPTION $e");
          onSuccess(response.data);
        }
      else {
        Fimber.i('API Error ==> ${response.statusCode}');
        onError(response.data['message'], response.data);
      }
    } catch (e) {
      Fimber.i('postRequest ==> $e');
//      errorHandling(e, onError);
    }
    return;
  }

  static Future<void> putRequest(
      {String url,
      Map<String, dynamic> params,
      Function onError,
      Function onSuccess}) async {
    Fimber.i('API URL ==> $url');
    Fimber.i('Params ==> $params');
    dio.options.headers['Content-Type'] = 'application/json';
    try {
      var response = await dio.put(url, data: params);
      printAPIResponseAndResponseCode(response);
      if (isValidResponse(response))
        try {
//          await UserPreference.setUserLogin(true);
          onSuccess(json.decode(response.data));
        } catch (e) {
          Fimber.i("EXPTION $e");
          onSuccess(response.data);
        }
      else {
        Fimber.i('API Error ==> ${response.statusCode}');
        onError(response.data['message'], true);
      }
    } catch (e) {
      Fimber.i('postRequest ==> $e');
//      errorHandaling(e, onError);
    }
    return;
  }

  static Future<void> getRequest(
      {String url, Function onError, Function onSuccess}) async {
//    Fimber.i('API URL ==> $url');
    dio.options.headers['Content-Type'] = 'application/json';
    try {
      url = url.replaceAll("+", "%2B");
//      url = url.replaceAll('&', '%26');
      print('url is ==> $url');
      var response = await dio.get(url);
      printAPIResponseAndResponseCode(response);
      if (isValidResponse(response))
        onSuccess(response.data);
      else {
        Fimber.i('API Error ==> ${response.statusCode}');
        onError(response.data['message'], true);
      }
    } catch (e) {
      errorHandaling(e, onError);
    }
    return;
  }

  static void errorHandaling(dynamic e, Function onError) {
    print(e);
    return;
    DioError dioError = e;
    if (dioError == null || dioError.type == null) return;
    print(dioError.type);
    if (dioError.type == DioErrorType.CONNECT_TIMEOUT ||
        dioError.type == DioErrorType.RECEIVE_TIMEOUT ||
        dioError.type == DioErrorType.SEND_TIMEOUT)
      onError('Connection timeout', true);
    else
      onError('Server error', true);
  }

  static bool isValidResponse(Response response) {
    if (response.statusCode == 200) {
//       Map responseData = json.decode(response.data);
      try {
        Map responseData = json.decode(response.data);
        Fimber.i('checking by map');
        if (responseData['status'] as int == 0) {
          return false;
        }
      } catch (e) {
        if (response.data['status'] as int == 0) {
          Fimber.i('checking directly without map');

          return false;
        }
      }
    } else {
      return false;
    }
    return true;
  }

  static void printAPIResponseAndResponseCode(Response<dynamic> response,
      [bool showData = true]) {
    Fimber.i('response data ==> ${response.data}');
    if (showData) Fimber.i('response code ==> ${response.statusCode}');
  }

  static Future<Map<String, dynamic>> getBaseParams() async {
    Map<String, dynamic> params = new Map();
//    params["UserId"] = await UserPreference().getUserId();
//    params["AccessToken"] = await UserPreference().getAccessToken();
//    params["device_token"] = await UserPreference().getFcmToken();
    return params;
  }

//  static Dio dio = new Dio();

}
