import 'dart:convert';
import 'package:http/http.dart' as http;
class HttpServerClient {
  Future<bool> performLoginOperation(String userName,String password)  async {

    // Use Your API and Respected Parameters
    final loginURL = Uri.parse("https://www.example.com/api/login");

    bool isLoggedInSuccess = false;

    Map<String,dynamic> loginData = {
      'userName' : userName,
      'password' : password
    };

    try {

      final response = await http.post(loginURL,headers: {'content-type' : 'application/json'},body: jsonEncode(loginData));

      if (response.statusCode == 200) {
        isLoggedInSuccess = true;
        return isLoggedInSuccess;
      } else {
        return isLoggedInSuccess;
      }

    }catch (error) {
      print("Error Message $error");
    }
    return isLoggedInSuccess;
  }

}