import 'package:flutter/material.dart';
import 'package:task_manager/controllers/user_controller.dart';
import 'package:task_manager/services/api_service.dart';

class LoginController extends ChangeNotifier {
  final ApiService _apiService = ApiService();
  final UserController userController = UserController();
  bool isLoading = false;

  Future<Map<String, dynamic>> login(Map<String, dynamic> data) async {
    _setLoading();
    String errorMsg = 'Erro desconhecido';

    final response = await _apiService.login(data);

    if (response['sucess']) {
      _setLoading();

      userController.setUser(
        response['data']['result']['id'],
        response['data']['result']['username'],
        response['data']['result']['email'],
      );
      return {
        'sucess': true,
      };
    } else {
      if (response['error'] == 'Invalid username/password.') {
        errorMsg = 'Email ou senha incorreto';
      }
      _setLoading();

      return {
        'sucess': false,
        'data': {
          'title': 'Falha!',
          'subtitle': errorMsg,
          'color': const Color.fromARGB(255, 255, 57, 83)
        }
      };
    }
  }

  _setLoading() {
    isLoading = !isLoading;
    notifyListeners();
  }
}
