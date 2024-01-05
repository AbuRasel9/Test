import 'package:flutter/material.dart';
import 'package:test_3/network/network_service.dart';
import 'package:test_3/screen/user_Screen.dart';
import 'package:test_3/widget/form_feild_text.dart';


class UpdateScreen extends StatefulWidget {
  final String name;
  final String email;
  final int id;
  const UpdateScreen({super.key, required this.name, required this.email, required this.id, });

  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  final _formKey=GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nameController.text=widget.name;
    emailController.text=widget.email;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registration Screen"),
      ),
      body: Padding(
        padding: EdgeInsets.all(30),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(height: 10,),
              From_Feild_Text(
                textController: nameController, hinText: 'Enter Name:', errorText: 'Name',),

              SizedBox(height: 10,),
              From_Feild_Text(textController: emailController,
                hinText: 'Enter Password:', errorText: 'password',),
              SizedBox(height: 10,),
              SizedBox(
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                child: ElevatedButton(onPressed: () {

                  // final result=NetworkServices().updateInApi(widget.id , widget.name, widget.email).then((value) =>
                  //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("update successfull")))
                  // );
                  // print(result);
                  //
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => UserList()));
                }, child: Text("Update data ")),
              )

            ],
          ),
        ),
      ),
    );
  }
}

