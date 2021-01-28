import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

const apiKey = 'AIzaSyDp_El3htchv9iPbBlFFrNpavpmh5xvhdc';

class Auth with ChangeNotifier {
  String _token;
  DateTime _expiryDate;
  String _userId;

  Future<void> _authenticate(
      String email, String password, String urlSegment) async {
    final url =
        'https://identitytoolkit.googleapis.com/v1/$urlSegment?key=$apiKey';
    final response = await http.post(url,
        body: json.encode(
          {
            'email': email,
            'password': password,
            'returnSecureToken': true,
          },
        ));
    print(json.decode(response.body));
    notifyListeners();
  }

  Future<void> signup(String email, String password) async {
    // final url =
    //     'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=$apiKey';
    // final response = await http.post(url,
    //     body: json.encode(
    //       {
    //         'email': email,
    //         'password': password,
    //         'returnSecureToken': true,
    //       },
    //     ));
    // print(json.decode(response.body));
    // notifyListeners();
    return _authenticate(email, password, 'accounts:signUp');
  }

  Future<void> login(String email, String password) async {
    // final url =
    //     'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=$apiKey';

    // final response = await http.post(
    //   url,
    //   body: json.encode({
    //     'email': email,
    //     'password': password,
    //     'returnSecureToken': true,
    //   }),
    // );

    return _authenticate(email, password, 'accounts:signInWithPassword');
  }
}
