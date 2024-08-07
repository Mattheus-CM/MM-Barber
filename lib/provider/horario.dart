import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mmbarber/data/dummy_horarios.dart';
import 'package:mmbarber/models/horario.dart';

class Horarios with ChangeNotifier {
  final Map<String, Horario> _items = {...DUMMY_HORARIOS};

  List<Horario> get all {
    return [..._items.values];
  }

  int get count {
    return _items.length;
  }

  Horario byIndex(int index) {
    return _items.values.elementAt(index);
  }

  void create(Horario horario) {
    if (horario == null) {
      return;
    }
    final id = Random().nextDouble().toString();
    _items.putIfAbsent(
      id,
      () => Horario(
          id: id, nome: horario.nome, data: horario.data, hora: horario.hora),
    );
    notifyListeners();
  }

  void update(Horario horario) {
    _items.update(
        horario.id!,
        (_) => Horario(
            nome: horario.nome, data: horario.data, hora: horario.hora));
    notifyListeners();
  }

  void remove(Horario horario) {
    _items.remove(horario.id);
    notifyListeners();
  }
}
