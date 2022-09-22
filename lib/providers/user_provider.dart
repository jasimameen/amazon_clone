import '../models/user.dart';
import 'package:flutter/foundation.dart';

class UserProvider extends ChangeNotifier {
  User _user = User(
    id: '',
    name: '',
    email: '',
    password: '',
    address: '',
    type: '',
    token: '',
  );

  User get user => _user;

  /// gets jsonString containing userData and Convert into UserModel
  void setUser(String jsonString) {
    _user = User.fromJson(jsonString);
    notifyListeners();
  }
}
