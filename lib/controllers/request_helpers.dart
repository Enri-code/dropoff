import 'dart:convert';

import 'package:http/http.dart' as http;

class RequestHelper {
  static Future<dynamic> receiveRequest(String url) async {
    http.Response httpResponse = await http.get(Uri.parse(url));

    try {
      if (httpResponse.statusCode == 200) {
        String responseData = httpResponse.body;
        var decodedResponseData = jsonDecode(responseData);

        return decodedResponseData;
      } else {
        return "Error Occured. Failed. No Response.";
      }
    } catch (e) {
      return "Error Occured. Failed. No Response.";
    }
  }
}
