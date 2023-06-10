import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'my_app.dart';
// its my first app yehuu
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp], )
      .then((value) => runApp(const MyApp()));
}
