import 'package:flutter/material.dart';
import 'package:movie_app/features/profile/models/user_model.dart';
import 'package:movie_app/features/profile/services/user_service.dart';

class UserViewModel extends ChangeNotifier {
  final UserService _userService = UserService();

  UserModel? _user;
  UserModel? get user => _user;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String _error = '';
  String get error => _error;

  void _setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  void _setError(String error) {
    _error = error;
    notifyListeners();
  }

  Future<void> fetchUserDetails() async {
    _setLoading(true);
    _error = "";

    try {
      _user = await _userService.getCurrentUser();
      notifyListeners();
    } catch (e) {
      _setError(e.toString());
    } finally {
      _setLoading(false);
    }
  }
}
