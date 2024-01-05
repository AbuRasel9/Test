import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:test_3/model/user_list_model.dart';
import 'package:test_3/network/network_service.dart';


class UserList extends StatefulWidget {
  const UserList({super.key});

  @override
  State<UserList> createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  UserLIstModel? _userLIstModel;

  Future getData() async {
    final response = await NetworkServices()
        .getUserListFormApi("http://restapi.adequateshop.com/api/users");
    _userLIstModel = UserLIstModel.fromJson(jsonDecode(response));
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User List"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView.builder(
            itemCount: _userLIstModel?.data?.length ?? 0,
            itemBuilder: (context, index) {
              return ExpansionTile(
                // trailing: ClipOval(child: Image.network(_userLIstModel?.data?[index].profilepicture ?? ""),),
                title: Text(_userLIstModel?.data?[index].name ?? "unknown"),
                subtitle: Text(_userLIstModel?.data?[index].email ?? "unknown"),

                children: [
                  ElevatedButton(
                      onPressed: () {

                      },
                      child: Text("Update"))
                ],
              );
            }),
      ),
    );
  }
}
