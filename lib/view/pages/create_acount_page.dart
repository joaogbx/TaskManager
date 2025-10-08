import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_manager/controllers/create_account_controller.dart';
import 'package:task_manager/services/api_service.dart';
import 'package:task_manager/view/components/buttons/input_widget.dart';
import 'package:task_manager/view/pages/bar_and_bottom.dart';

class CreateAcountPage extends StatefulWidget {
  @override
  State<CreateAcountPage> createState() => _CreateAcountPageState();
}

class _CreateAcountPageState extends State<CreateAcountPage> {
  final TextEditingController _userName = TextEditingController();

  final TextEditingController _password = TextEditingController();

  final TextEditingController _email = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final createAccountController =
        Provider.of<CreateAccountController>(context);
    bool isLoading = createAccountController.isLoading;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 46, 46, 46),
      ),
      body: Form(
        key: _formKey,
        child: Container(
          color: const Color.fromARGB(255, 46, 46, 46),
          child: Padding(
            padding: const EdgeInsets.only(left: 30, right: 30, top: 130),
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
                  label: 'Email',
                  controller: _email,
                ),
                SizedBox(height: 20),
                InputWidget(
                  label: 'Senha',
                  controller: _password,
                ),
                SizedBox(height: 40),
                SizedBox(
                  width: 330,
                  height: 50,
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(
                      const Color.fromARGB(255, 115, 211, 255),
                    )),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _signUp(context, createAccountController);
                      }
                    },
                    child: Consumer<CreateAccountController>(
                      builder: (context, controller, _) => controller.isLoading
                          ? CircularProgressIndicator(
                              color: Colors.white,
                            )
                          : Text('Criar conta'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _signUp(BuildContext context, createAccountController) async {
    final response = await createAccountController.signUp({
      'username': _userName.text,
      'email': _email.text,
      'password': _password.text,
    });

    _showDialog(context, response);
  }

  _showDialog(BuildContext ctx, response) {
    showDialog(
      context: ctx,
      builder: (_) => AlertDialog(
        backgroundColor: Colors.white,
        title: Text(
          response['title'],
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        content: Text(
          response['subtitle'],
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        actionsAlignment: MainAxisAlignment.center,
        actions: [
          SizedBox(
              width: double.infinity,
              height: 40,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    response['color'],
                  ),
                ),
                onPressed: () {
                  Navigator.of(ctx).pop();
                },
                child: Text(
                  'Ok',
                  style: TextStyle(color: Colors.white),
                ),
              ))
        ],
      ),
    );
  }
}
