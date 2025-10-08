import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
  final Dio auth = Dio(
    BaseOptions(baseUrl: 'https://parseapi.back4app.com/functions', headers: {
      'X-Parse-Application-Id': 'hpTlzzjj3NoqV6tYYaeRwoqOshTYJZypDr62tjbL',
      'X-Parse-REST-API-Key': 'avRpn4uRzZaYMP839y8pOquJ2XxThLTqP8DA7AJ8',
      'Content-Type': 'application/json'
    }),
  );

  Future<Dio> buildfFunctionService(String? sessionToken) async {
    return Dio(
      BaseOptions(baseUrl: 'https://parseapi.back4app.com/functions', headers: {
        'X-Parse-Application-Id': 'hpTlzzjj3NoqV6tYYaeRwoqOshTYJZypDr62tjbL',
        'X-Parse-REST-API-Key': 'avRpn4uRzZaYMP839y8pOquJ2XxThLTqP8DA7AJ8',
        "X-Parse-Session-Token": sessionToken ?? '',
        'Content-Type': 'application/json'
      }),
    );
  }

  Future<Map<String, dynamic>> signUp(Map<String, dynamic> data) async {
    try {
      final response = await auth.post('/signup', data: data);

      return {
        'sucess': true,
      };
    } on DioException catch (e) {
      return {
        'sucess': false,
        'status': e.response?.statusCode,
        'error': e.response?.data['error']
      };
    }
  }

  Future<Map<String, dynamic>> login(Map<String, dynamic> data) async {
    final prefs = await SharedPreferences.getInstance();
    try {
      final response = await auth.post('/login', data: data);
      prefs.setString('sessionToken', response.data['result']['sessionToken']);

      return {'sucess': true, 'data': response.data};
    } on DioException catch (e) {
      return {
        'sucess': false,
        'status': e.response?.statusCode,
        'error': e.response?.data['error']
      };
    }
  }

  Future<Map<String, dynamic>> taskAdd(Map<String, dynamic> data) async {
    final prefs = await SharedPreferences.getInstance();
    final String? sessionToken = prefs.getString('sessionToken');
    final dio = await buildfFunctionService(sessionToken);

    try {
      final response = await dio.post('/taskadd', data: data);
      return {
        'sucess': true,
        'response': response,
      };
    } on DioException catch (e) {
      return {
        'sucess': false,
        'error': e,
      };
    }
  }
}
