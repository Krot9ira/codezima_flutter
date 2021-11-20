import 'package:codezima_flutter/screens/domain/api_client/api_client.dart';
import 'package:flutter/material.dart';

class RegistrationModel extends ChangeNotifier {
  final _apiClient = ApiClient();

  final nameTextController = TextEditingController();
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  bool _isRegistrationProgress = false;
  bool get canRegistration => !_isRegistrationProgress;

  Future<void> registration(BuildContext context) async {
    final name = nameTextController.text;
    final email = emailTextController.text;
    final password = passwordTextController.text;

    if (name.isEmpty || password.isEmpty || email.isEmpty) {
      _errorMessage = 'Fill in all the fields';
      notifyListeners();
      return;
    }
    _errorMessage = null;
    _isRegistrationProgress = true;
    notifyListeners();
    final result = await _apiClient.registration(
        fullName: name, email: email, password: password);
    _isRegistrationProgress = false;
    notifyListeners();
    return;
  }
}

class RegistarationProvider extends InheritedNotifier {
  final RegistrationModel model;
  const RegistarationProvider({
    Key? key,
    required this.model,
    required Widget child,
  }) : super(key: key, notifier: model, child: child);

  static RegistarationProvider? watch(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<RegistarationProvider>();
  }

  static RegistarationProvider? read(BuildContext context) {
    final widget = context
        .getElementForInheritedWidgetOfExactType<RegistarationProvider>()
        ?.widget;
    return widget is RegistarationProvider ? widget : null;
  }
}
