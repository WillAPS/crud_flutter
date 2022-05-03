import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:helloworld/screens/home_page.dart';
import 'package:helloworld/theme_changer.dart';

void main() {
  runApp(const TodoListApp());
}

class TodoListApp extends StatelessWidget {
  const TodoListApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ThemeBuilder(
      defaultBrightness: Brightness.light,
      builder: (context, _brightness) {
        return MaterialApp(
          theme: ThemeData(
            primarySwatch: Colors.blue,
            brightness: _brightness,
            textTheme: GoogleFonts.aBeeZeeTextTheme(
              Theme.of(context).textTheme,
            ),
          ),
          home: HomePage(),
        );
      },
    );
  }
}
