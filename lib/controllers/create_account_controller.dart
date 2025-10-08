import 'package:flutter/material.dart';
import 'package:task_manager/services/api_service.dart';

class CreateAccountController extends ChangeNotifier {
  final _apiService = ApiService();
  bool isLoading = false;

  Future<Map<String, dynamic>> signUp(data) async {
    _isLoading();
    var errorMsg = '';
    final Map<String, dynamic> response = await _apiService.signUp(data);
    if (!response['sucess']) {
      if (response['error'] == 'Account already exists for this username.') {
        errorMsg = 'Usúario com esse username já existe';
      } else {
        errorMsg = 'Erro desconhecido';
      }
      _isLoading();
      return {
        'title': 'Falha!',
        'subtitle': errorMsg,
        'color': const Color.fromARGB(255, 255, 57, 83)
      };
    } else {
      _isLoading();
      return {
        'title': 'Sucesso!',
        'subtitle': 'Usuário criado com rucesso',
        'color': Colors.greenAccent,
      };
    }
  }

  _isLoading() {
    isLoading = !isLoading;
    notifyListeners();
  }
}
