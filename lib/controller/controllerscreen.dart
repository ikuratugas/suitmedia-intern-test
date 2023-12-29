import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:suitmedia/model/modelapi.dart';

class ControllerScreen extends ChangeNotifier {
  // ========== screen 1
  TextEditingController tampungNameS1 = TextEditingController();
  TextEditingController tampungPalindromeS1 = TextEditingController();

  bool? isPalindrome;
  String? messageIsPalindrome;

  String? _name;
  String? get name => _name;
  void setName() => _name = tampungNameS1.text;

  void checkIsPalindrome() {
    isPalindrome = tampungPalindromeS1.text.contains(' ');
    isPalindrome!
        ? messageIsPalindrome = "isPalindrome"
        : messageIsPalindrome = "not palindrome";
  }

  // ============ sreen 2
  bool? _isUserSelected = false;
  bool? get isUserSelected => _isUserSelected;
  void setIsUserSelectedTrue() {
    _isUserSelected = true;
    notifyListeners();
  }

  void setIsUserSelectedFalse() {
    _isUserSelected = false;
    notifyListeners();
  }

  // ============ screen 3
  List<User> user = [];

  Future<void> fetchUserFromAPI() async {
    const url = "https://reqres.in/api/users?page=1&per_page=10";
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final json = jsonDecode(response.body)['data'] as List;
    user = json.map((e) => User.fromJson(e)).toList();
    notifyListeners();
  }

  String? userSelected = "No User Selected";
  void selectedUser(User u) {
    userSelected = "${u.firstName} ${u.lastName}";
  }
}
