import 'package:flutter/material.dart';
import 'package:mmbarber/Routes/routes.dart';
import 'package:mmbarber/models/horario.dart';
import 'package:mmbarber/provider/horario.dart';
import 'package:provider/provider.dart';

class HorarioTile extends StatelessWidget {
  final Horario horario;

  const HorarioTile(this.horario);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(horario.nome),
      subtitle: Text(horario.data + "\n" + horario.hora),
      trailing: Container(
        width: 100,
        child: Row(
          children: <Widget>[
            IconButton(
                onPressed: () {
                  print(horario.nome);
                  Navigator.of(context).pushNamed(
                    Routes.EDITAR_AGENDAMENTO,
                    arguments: horario,
                  );
                },
                icon: Icon(Icons.edit)),
            IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (ctx) => AlertDialog(
                            title: Text('Remover Horário'),
                            content: Text('Tem certeza?'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop(false);
                                },
                                child: Text('Não'),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop(true);
                                },
                                child: Text('Sim'),
                              ),
                            ],
                          )).then((confirmou) => {
                        if (confirmou)
                          {
                            Provider.of<Horarios>(context, listen: false)
                                .remove(horario)
                          }
                      });
                },
                icon: Icon(Icons.delete)),
          ],
        ),
      ),
    );
  }
}
