import 'package:flutter/material.dart';
import 'package:mmbarber/Routes/routes.dart';

class Register extends StatefulWidget {
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
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
                  TextFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'E-mail',
                        fillColor: Colors.white70,
                        filled: true),
                    onSaved: (newValue) => _formData['email'] = newValue!,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _form.currentState!.save();
                      Navigator.of(context).pushNamed(Routes.LOGIN);
                      Navigator.of(context).pop();
                    },
                    child: Text('Registrar'),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
