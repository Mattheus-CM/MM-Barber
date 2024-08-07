import 'package:flutter/material.dart';
import 'package:mmbarber/Routes/routes.dart';
import 'package:mmbarber/components/horario_tile.dart';
import 'package:mmbarber/provider/horario.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final horarios = Provider.of<Horarios>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color.fromRGBO(240, 128, 42, 1),
      ),
      body: ListView.builder(
        itemCount: horarios.count,
        itemBuilder: (context, index) => HorarioTile(horarios.byIndex(index)),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(Routes.AGENDAR_HORARIO);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
