import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shopify/utils/api_constants.dart';

class LoginProvider extends ChangeNotifier {
  bool isLoading = false;

  Future<void> login(
      String email, String password, BuildContext context) async {
    isLoading = true;
    notifyListeners();

    try {
      final response =
          await http.post(Uri.parse(ApiConstants.loginurl), body: {
        "email": email,
        "password": password,
      });
      final data = jsonDecode(response.body);
      print(data);
      if (data["status"] == "success") {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Login Successful")));
      }
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("error :$e")));
    }
    isLoading = false;
    notifyListeners();
  }
}
