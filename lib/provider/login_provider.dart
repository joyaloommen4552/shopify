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
      final headers = {
        "Content-Type": "application/json",
        "Accept": "application/json",
        "Connection": "keep-alive",
      };

      final body = jsonEncode({
        "email": email,
        "password": password,
      });

      final response = await http.post(
        Uri.parse(ApiConstants.loginurl),
        headers: headers,
        body: body,
      );

      final data = jsonDecode(response.body);

      if (!context.mounted) return;

      if (data["status"] == "success") {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("✅ Login Successful")),
        );

        // Navigator.pushReplacement(
        //   context,
        //   MaterialPageRoute(
        //     builder: (_) => HomeScreen(name: data["user"]["name"]),
        //   ),
        // );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("⚠️ ${data['message']}")),
        );
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("❌ Error: $e")),
        );
      }
    }

    isLoading = false;
    notifyListeners();
  }
}
