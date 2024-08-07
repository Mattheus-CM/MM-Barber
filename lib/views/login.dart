import 'package:flutter/material.dart';
import 'package:mmbarber/Routes/routes.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _form = GlobalKey<FormState>();

  final Map<String, String> _formData = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Container(
          color: Colors.black12,
          height: 650,
          width: 375,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: _form,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Login',
                        fillColor: Colors.white70,
                        filled: true),
                    onSaved: (newValue) => _formData['login'] = newValue!,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Senha',
                        fillColor: Colors.white70,
                        filled: true),
                    onSaved: (newValue) => _formData['senha'] = newValue!,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _form.currentState!.save();
                      Navigator.of(context).pushNamed(Routes.HOME);
                      Navigator.of(context).pop();
                    },
                    child: Text('Login'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
