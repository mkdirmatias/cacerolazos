// Dart imports
import 'package:flutter/material.dart';

// App imports
import 'package:cacerola/src/pages/Home/home_page.dart';

// Inicar aplicación
void main() async
{
    runApp(MyApp());
}
 
class MyApp extends StatelessWidget
{
    @override
    Widget build(BuildContext context) 
    {
        return MaterialApp(
            title: 'Cacerola',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                primaryColor: Colors.white,
            ),
            home: HomePage(),
        );
    }
}