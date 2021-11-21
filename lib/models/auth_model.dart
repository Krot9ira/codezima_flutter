import 'package:codezima_flutter/screens/domain/api_client/api_client.dart';
import 'package:flutter/material.dart';

//now its not work b my server is not ready to auth
class AuthModel extends ChangeNotifier {
  final _apiClient = ApiClient();

  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  bool _isAuthProgress = false;
  bool get canAuth => !_isAuthProgress;

  Future<void> auth(BuildContext context) async {
    final email = emailTextController.text;
    final password = passwordTextController.text;

    if (password.isEmpty || email.isEmpty) {
      _errorMessage = 'Fill in all the fields';
      notifyListeners();
      return;
    }
    _errorMessage = null;
    _isAuthProgress = true;
    notifyListeners();
    final result = await _apiClient.auth(
        //email: email, password: password);
        //_isAuthProgress = false;
        //notifyListeners();
        //return;
        );
  }
}

class AuthProvider extends InheritedNotifier {
  final AuthModel model;
  const AuthProvider({
    Key? key,
    required this.model,
    required Widget child,
  }) : super(key: key, notifier: model, child: child);

  static AuthProvider? watch(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AuthProvider>();
  }

  static AuthProvider? read(BuildContext context) {
    final widget =
        context.getElementForInheritedWidgetOfExactType<AuthProvider>()?.widget;
    return widget is AuthProvider ? widget : null;
  }
}
