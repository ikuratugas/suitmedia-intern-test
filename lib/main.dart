import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suitmedia/controller/controllerscreen.dart';
import 'package:suitmedia/screens/firstscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ControllerScreen())
      ],
      child: MaterialApp(
        title: 'Suitmedia Test Intern',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: "poppins",
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromARGB(255, 43, 99, 123)),
          useMaterial3: true,
        ),
        home: const FirstScreen(),
      ),
    );
  }
}
