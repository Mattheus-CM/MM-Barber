import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mmbarber/models/horario.dart';
import 'package:mmbarber/provider/horario.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AgendarHorario extends StatefulWidget {
  @override
  State<AgendarHorario> createState() => _AgendarHorarioState();
}

class _AgendarHorarioState extends State<AgendarHorario> {
  final _form = GlobalKey<FormState>();

  final Map<String, String> _formData = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Agendar Horário',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color.fromRGBO(240, 128, 42, 1),
      ),
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
                        hintText: 'Nome',
                        fillColor: Colors.white70,
                        filled: true),
                    onSaved: (newValue) => _formData['nome'] = newValue!,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Data',
                        fillColor: Colors.white70,
                        filled: true),
                    onSaved: (newValue) => _formData['data'] = newValue!,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Hora',
                        fillColor: Colors.white70,
                        filled: true),
                    onSaved: (newValue) => _formData['hora'] = newValue!,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _form.currentState!.save();
                      Provider.of<Horarios>(context, listen: false)
                          .create(Horario(
                        id: _formData['id'],
                        nome: _formData['nome']!,
                        data: _formData['data']!,
                        hora: _formData['hora']!,
                      ));

                      String customID = 'Horario_' +
                          DateTime.now().millisecondsSinceEpoch.toString();
                      FirebaseFirestore.instance
                          .collection('horario')
                          .doc(customID)
                          .set({
                        'id': DateTime.now().millisecondsSinceEpoch.toString(),
                        'nome': _formData['nome'],
                        'data': _formData['data'],
                        'hora': _formData['hora'],
                      }).then((_) {
                        Navigator.of(context).pop();
                      }).catchError((error) {
                        print('Erro ao adicionar: ${error}');
                      });
                      //Navigator.of(context).pop();
                    },
                    child: Text('Agendar'),
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
