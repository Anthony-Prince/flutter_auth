import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_auth_project/models/user.dart';

class ApiService {
  // Getting users
  Future<List<User>?> getUsers() async {
    try {
      var url = Uri.parse(dotenv.get('baseUrl') + dotenv.get('usersEndpoint'));
      var response = await http.get(url,
          headers: {"Authorization": "Bearer ${dotenv.get('accesToken')}"});
      if (response.statusCode == 200) {
        List<User> _model = UserFromJson(response.body);
        return _model;
      } else {
        String error = jsonDecode(response.body)['error']['message'];
        throw Exception(error);
      }
    } catch (e) {
      log(e.toString());
    }
  }

  // Adding user
  Future<User?> addUser(String email, String username, String password) async {
    try {
      var url = Uri.parse(dotenv.get('baseUrl') + dotenv.get('usersEndpoint'));
      var response = await http.post(url,
          headers: {"Authorization": "Bearer ${dotenv.get('accesToken')}"},
          body: {"email": email, "username": username, "password": password});

      if (response.statusCode == 201) {
        User _model = singleUserFromJson(response.body);
        return _model;
      } else {
        String error = jsonDecode(response.body)['error']['message'];
        throw Exception(error);
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}