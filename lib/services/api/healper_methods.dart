import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import 'api_headers.dart';

class APIMethods {
  // instance of getConnect
  static final GetConnect _getConnect =
      GetConnect(timeout: const Duration(seconds: 30), maxAuthRetries: 3);

  // A function performing GET request to a server. It has no headers, it is just getting the products
  static Future<Response> getData(String uri) async {
    try {
      Response response = await _getConnect.get(uri);
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

  // This is a function specifically for getting info/details from the API.
  //It has headers which is needed for authorization of each specific user
  static Future<Response> getDataWithHeader({
    required String url,
    Map<String, String>? headers,
  }) async {
    try {
      Response response = await _getConnect.get(
        url,
        headers: headers ?? APIHeaders.appHeaders(),
      );
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

  // A function performing PUT request to a server
  static Future<Response> putData(
      {required String url,
      required dynamic body,
      Map<String, String>? headers,
      required bool withHeader}) async {
    try {
      if (withHeader) {
        Response response = await _getConnect.put(url, body,
            headers: headers ?? APIHeaders.appHeaders());
        if (kDebugMode) print(response.toString()); // for testing
        return response;
      } else {
        Response response = await _getConnect.put(url, body);
        if (kDebugMode) print(response.toString()); // for testing
        return response;
      }
    } catch (e) {
      if (kDebugMode) print(e.toString()); // for testing
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

  // A function performing PATCH request to a server
  static Future<Response> patchData(
      {required String url,
      required dynamic body,
      Map<String, String>? headers,
      required bool withHeader}) async {
    try {
      if (withHeader) {
        Response response = await _getConnect.patch(url, body,
            headers: headers ?? APIHeaders.appHeaders());
        if (kDebugMode) print(response.toString()); // for testing
        return response;
      } else {
        Response response = await _getConnect.patch(url, body);
        if (kDebugMode) print(response.toString()); // for testing
        return response;
      }
    } catch (e) {
      if (kDebugMode) print(e.toString()); // for testing
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

  static Future<Response> postData(
      {required String url,
      required dynamic body,
      Map<String, String>? headers,
      required bool withHeader}) async {
    try {
      if (withHeader) {
        Response response = await _getConnect.post(url, body,
            headers: headers ?? APIHeaders.appHeaders());
        if (kDebugMode) print(response.toString()); // for testing
        return response;
      } else {
        Response response = await _getConnect.post(url, body);
        if (kDebugMode) print(response.toString()); // for testing
        return response;
      }
    } catch (e) {
      if (kDebugMode) print(e.toString()); // for testing
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

  static Future<Response> deletData(
      {required String url,
      Map<String, String>? headers,
      required bool withHeader}) async {
    try {
      if (withHeader) {
        Response response = await _getConnect.delete(url,
            headers: headers ?? APIHeaders.appHeaders());
        if (kDebugMode) print(response.toString()); // for testing
        return response;
      } else {
        Response response = await _getConnect.delete(url);
        if (kDebugMode) print(response.toString()); // for testing
        return response;
      }
    } catch (e) {
      if (kDebugMode) print(e.toString()); // for testing
      return Response(statusCode: 1, statusText: e.toString());
    }
  }
}
