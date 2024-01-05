import 'package:flutter/material.dart';
import 'package:test_3/network/network_service.dart';
import 'package:test_3/screen/registration_screen.dart';
import 'package:test_3/screen/user_Screen.dart';
import 'package:test_3/utils/token.dart';
import 'package:test_3/widget/form_feild_text.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

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
                  final response=await NetworkServices().PostMethodInApi("http://restapi.adequateshop.com/api/authaccount/login",
                      {
                        "email":emailController.text,
                        "password":passwordController.text
                      }

                  );
                  if(response["message"]=="success"){
                    final result=userData.token=response["data"]["Token"];
                    print("User token ${result}");
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Login Successfull")));
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>UserList()));

                  }else{
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Login Not Successfull please enter correct password and email")));



                  }




                }, child: Text("Login Screen")),
              ),
              SizedBox(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't Have Account?"),
                  TextButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>RegistrationScreen()));
                  }, child: Text("Singup"))
                ],
              )


            ],
          ),
        ),
      ),
    );
  }
}

