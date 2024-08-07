import 'package:flutter/material.dart';
import 'package:mmbarber/models/horario.dart';
import 'package:mmbarber/provider/horario.dart';
import 'package:provider/provider.dart';

class EditarAgendamento extends StatefulWidget {
  @override
  State<EditarAgendamento> createState() => _EditarAgendamentoState();
}

class _EditarAgendamentoState extends State<EditarAgendamento> {
  final _form = GlobalKey<FormState>();

  final Map<String, String> _formData = {};

  void _carregaFormulario(Horario horario) {
    _formData['id'] = horario.id!;
    _formData['nome'] = horario.nome;
    _formData['data'] = horario.data;
    _formData['hora'] = horario.hora;
  }

  @override
  Widget build(BuildContext context) {
    final horario = ModalRoute.of(context)!.settings.arguments as Horario;

    _carregaFormulario(horario);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Editar Agendamento',
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
                    initialValue: _formData['nome'],
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Nome',
                        fillColor: Colors.white70,
                        filled: true),
                    onSaved: (newValue) => _formData['nome'] = newValue!,
                  ),
                  TextFormField(
                    initialValue: _formData['data'],
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Data',
                        fillColor: Colors.white70,
                        filled: true),
                    onSaved: (newValue) => _formData['data'] = newValue!,
                  ),
                  TextFormField(
                    initialValue: _formData['hora'],
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
                          .update(Horario(
                        id: _formData['id'],
                        nome: _formData['nome']!,
                        data: _formData['data']!,
                        hora: _formData['hora']!,
                      ));
                      Navigator.of(context).pop();
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
