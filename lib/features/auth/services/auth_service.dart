import 'dart:convert';

import 'package:amazon_clone_tutorial/common/widgets/bottom_bar.dart';
import 'package:amazon_clone_tutorial/constants/error_handling.dart';
import 'package:amazon_clone_tutorial/constants/utils.dart';
import 'package:amazon_clone_tutorial/features/home/screens/home_screen.dart';
import 'package:amazon_clone_tutorial/models/user.dart';
import 'package:amazon_clone_tutorial/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  void getUserData(BuildContext context) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('x-auth-token');
      if (token == null) {
        prefs.setString('x-auth-token', "");
      }
      var tokenRes = await http.post(
          Uri.parse("http://localhost:3000/tokenIsValid"),
          headers: <String, String>{
            'Content-Type': "application/json; charset=UTF-8",
            'x-auth-token': token!,
          });

      var response = jsonDecode(tokenRes.body);
      if (response == true) {
        http.Response userRes = await http
            .get(Uri.parse("http://localhost:3000/"), headers: <String, String>{
          'Content-Type': "application/json; charset=UTF-8",
          'x-auth-token': token,
        });
        // ignore: use_build_context_synchronously
        var userProvider = Provider.of<UserProvider>(context, listen: false);
        userProvider.setUser(userRes.body);
      }
    } catch (e) {}
  }

  void signInUser({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      http.Response res = await http.post(
        Uri.parse("http://localhost:3000/api/signin"),
        body: jsonEncode({"email": email, "password": password}),
        headers: <String, String>{
          'Content-Type': "application/json; charset=UTF-8"
        },
      );

      // ignore: use_build_context_synchronously
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () async {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          // ignore: use_build_context_synchronously
          Provider.of<UserProvider>(context, listen: false).setUser(res.body);
          await prefs.setString("x-auth-token", jsonDecode(res.body)['token']);
          // ignore: use_build_context_synchronously
          Navigator.pushNamedAndRemoveUntil(
              context, BottomBar.routeName, (route) => false);
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  void signUpUser(
      {required BuildContext context,
      required String email,
      required String name,
      required String password}) async {
    try {
      User user = User("", name, email, password, "", "", "");
      http.Response res = await http.post(
        Uri.parse("http://localhost:3000/api/signup"),
        body: user.toJson(),
        headers: <String, String>{
          'Content-Type': "application/json; charset=UTF-8"
        },
      );
      // ignore: use_build_context_synchronously
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          showSnackBar(
              context, "Account created! Login with the same credentials");
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
