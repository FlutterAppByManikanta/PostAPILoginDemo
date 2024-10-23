import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loginpostapicall/NetworksCalls/HttpServerClient.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final TextEditingController userNameController = TextEditingController();
  final TextEditingController userPasswordController = TextEditingController();

  HttpServerClient httpServerClient = HttpServerClient();

  void login() {
    final userName = userNameController.text;
    final password = userPasswordController.text;
    bool isLoggedIn=  httpServerClient.performLoginOperation(userName,password) as bool;

    if (isLoggedIn) {
      // Success Part
    } else {
      // Failure Part
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login"),backgroundColor: Colors.blueAccent,),
      body:  Padding(padding: EdgeInsets.all(17.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          TextField(controller: userNameController,
          decoration: InputDecoration(labelText: "UserName"),
          ),

          SizedBox(height: 10,),


          TextField(controller: userPasswordController,
            decoration: InputDecoration(labelText: "Password"),
            obscureText: true,
          ),

          SizedBox(height: 10,),

          ElevatedButton(onPressed: login, child: Text("Login"))
        ],
      ),
      ),
    );
  }
}
