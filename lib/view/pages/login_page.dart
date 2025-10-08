import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_manager/controllers/login_controller.dart';
import 'package:task_manager/services/api_service.dart';
import 'package:task_manager/view/components/buttons/input_widget.dart';
import 'package:task_manager/view/components/dialog_widget.dart';
import 'package:task_manager/view/pages/bar_and_bottom.dart';
import 'package:task_manager/view/pages/create_acount_page.dart';
import 'package:task_manager/view/pages/home_page.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final api = ApiService();
  final TextEditingController _userName = TextEditingController();
  final TextEditingController _password = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final loginController = Provider.of<LoginController>(context);
    bool isLoading = loginController.isLoading;
    return Scaffold(
      body: Container(
        color: const Color.fromARGB(255, 46, 46, 46),
        child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30, top: 190),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadiusGeometry.all(Radius.circular(50)),
                  child: Image.asset(
                    'assets/images/toDoimage.png',
                    width: 290,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                InputWidget(
                  label: 'Username',
                  controller: _userName,
                ),
                SizedBox(height: 20),
                InputWidget(
                  label: 'Senha',
                  controller: _password,
                ),
                SizedBox(height: 20),
                Container(
                  width: 330,
                  height: 50,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(
                        const Color.fromARGB(255, 115, 211, 255),
                      ),
                    ),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        await _login(context, loginController);
                      }
                    },
                    child: isLoading
                        ? CircularProgressIndicator(color: Colors.white)
                        : Text(
                            'Entrar',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => CreateAcountPage()),
                      );
                    },
                    child: Text(
                      'Criar conta',
                      style: TextStyle(
                        color: const Color.fromARGB(255, 255, 255, 255),
                        decorationColor: Colors.white,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  _login(BuildContext context, LoginController loginController) async {
    final response = await loginController.login({
      'username': _userName.text,
      'password': _password.text,
    });

    if (!response['sucess']) {
      showDialog(
        context: context,
        builder: (_) => DialogWidget(response: {
          'title': response['data']['title'],
          'subtitle': response['data']['subtitle'],
          'color': response['data']['color']
        }, ctx: context),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => BarAndBottom()),
      );
    }
  }
}
