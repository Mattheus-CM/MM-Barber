import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mmbarber/Routes/routes.dart';
import 'package:mmbarber/provider/horario.dart';
import 'package:mmbarber/views/agendar_horario.dart';
import 'package:mmbarber/views/editar_agendamento.dart';
import 'package:mmbarber/views/home.dart';
import 'package:mmbarber/views/login.dart';
import 'package:mmbarber/views/register.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Horarios(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        routes: {
          Routes.HOME: (_) => Home(),
          Routes.AGENDAR_HORARIO: (_) => AgendarHorario(),
          Routes.EDITAR_AGENDAMENTO: (_) => EditarAgendamento(),
          Routes.LOGIN: (_) => Login(),
          Routes.REGISTER: (_) => Register(),
        },
      ),
    );
  }
}
