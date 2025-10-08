import 'package:flutter/material.dart';

class DialogWidget extends StatelessWidget {
  const DialogWidget({required this.response, required this.ctx});

  final Map<String, dynamic> response;
  final BuildContext ctx;

  @override
  Widget build(BuildContext ctx) {
    return AlertDialog(
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
    );
  }
}
