import 'dart:convert';

import 'package:http/http.dart' as http;

class NetworkServices {
  //get data form api
  Future  getUserListFormApi(String url) async {
    http.Response response = await http.get(Uri.parse(url), headers: {
      "Content-Type": "application/json",
      "Accept": "application/json",
      'Authorization': 'Bearer 4c2d4a89-15a6-48ce-9df3-5273dd5b4b99',
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
          'Authorization': 'Bearer 4c2d4a89-15a6-48ce-9df3-5273dd5b4b99'
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
  // //update data form api
  // Future updateInApi(int id,String name,String email,) async {
  //   http.Response response = await http.post(Uri.parse("http://restapi.adequateshop.com/api/users/$id"),
  //       headers: {
  //         "Content-Type": "application/json",
  //         "Accept": "application/json",
  //         'Authorization': 'Bearer 4c2d4a89-15a6-48ce-9df3-5273dd5b4b99'
  //       },
  //       body: jsonEncode({
  //         "name": name,
  //         "email": email,
  //       }));
  //
  //   print(response.body);
  //   if (response.statusCode == 200) {
  //     print("data get");
  //
  //     return jsonDecode(response.body);
  //   } else {
  //     print("data not get");
  //   }
  // }
  // Future LoginInApi(String password,String email,) async {
  //   http.Response response = await http.post(Uri.parse("http://restapi.adequateshop.com/api/authaccount/login"),
  //       headers: {
  //         "Content-Type": "application/json",
  //         "Accept": "application/json",
  //         'Authorization': 'Bearer 4c2d4a89-15a6-48ce-9df3-5273dd5b4b99'
  //       },
  //       body: jsonEncode({
  //         "email":email,
  //         "password":password
  //       }));
  //
  //   print(response.body);
  //   if (response.statusCode == 200) {
  //     print("data get");
  //
  //     return jsonDecode(response.body);
  //   } else {
  //     print("data not get");
  //   }
  // }


}
