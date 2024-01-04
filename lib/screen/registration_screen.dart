import 'package:flutter/material.dart';
import 'package:sample/network/network_service.dart';
import 'package:sample/screen/user_Screen.dart';
import 'package:sample/widget/form_feild_text.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _formKey=GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();



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
                textController: emailController, hinText: 'Enter Name:', errorText: 'Name',),
              SizedBox(height: 10,),
              From_Feild_Text(
                textController: passwordController, hinText: 'Enter Email:', errorText: 'Password',),
              SizedBox(height: 10,),
              From_Feild_Text(textController: nameController,
                hinText: 'Enter Password:', errorText: 'password',),
              SizedBox(height: 10,),
              SizedBox(
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                child: ElevatedButton(onPressed: () {

                  final result=NetworkServices().registrationInApi(
                      "http://restapi.adequateshop.com/api/authaccount/registration", nameController.text,
                      emailController.text, passwordController.text).then((value){
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Registration Done")));

                  });
                  print(result);

                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => UserList()));
                }, child: Text("Registration Screen")),
              )

            ],
          ),
        ),
      ),
    );
  }
}

