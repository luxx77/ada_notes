import 'package:ada_notes/providers/main_provider.dart';
import 'package:ada_notes/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => MainProvider())],
      child: const MaterialApp(
        home: MyHomePage(),
        debugShowCheckedModeBanner: true ,
      ),
    );
  }
}
