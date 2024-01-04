import 'package:flutter/material.dart';
import 'package:sample/network/network_service.dart';
import 'package:sample/screen/registration_screen.dart';
import 'package:sample/screen/user_Screen.dart';
import 'package:sample/widget/form_feild_text.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController=TextEditingController();
  final passwordController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Screen"),
      ),
      body: Padding(
        padding: EdgeInsets.all(30),
        child: Form(
          child: Column(
            children: [
              SizedBox(height: 10,),
              From_Feild_Text( textController: emailController, hinText: 'Enter Email:', errorText: 'email',),
              SizedBox(height: 10,),
              From_Feild_Text( textController: passwordController, hinText: 'Enter Password:', errorText: 'password',),
              SizedBox(height: 10,),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(onPressed: () async {
                  final response=await NetworkServices().LoginInApi(passwordController.text, emailController.text);
                  if(response["message"]=="success"){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>UserList()));

                  }



                }, child: Text("Login Screen")),
              )

            ],
          ),
        ),
      ),
    );
  }
}

