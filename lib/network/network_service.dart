import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:test_3/utils/token.dart';

class NetworkServices {
  //get data form api
  Future  getUserListFormApi(String url) async {
    http.Response response = await http.get(Uri.parse(url), headers: {
      "Content-Type": "application/json",
      "Accept": "application/json",
      'Authorization': 'Bearer ${userData.token}',
    });
    print(response.body);
    if (response.statusCode == 200) {
      print("data get");

      return (response.body);
    } else {
      print("data not get");
    }
  }

  //registration Screen data form api
  Future PostMethodInApi(String url,Map<String,String>body) async {
    http.Response response = await http.post(Uri.parse(url),
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
          'Authorization': 'Bearer ${userData.token}'
        },
        body:jsonEncode(body));

    print(response.body);
    if (response.statusCode == 200) {
      print("data get");

      return jsonDecode(response.body);
    } else {
      print("data not get");
    }
  }





}
