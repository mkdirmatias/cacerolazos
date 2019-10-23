// Flutter imports
import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget
{
    @override
    Widget build(BuildContext context)
    {
        return Scaffold(
            appBar: AppBar(
                centerTitle: true,
                title: Text('Información', style: TextStyle(color: Colors.white),),
                backgroundColor: Colors.blue,

                iconTheme: IconThemeData(color: Colors.white),
                
            ),
            body: Container(
                padding: EdgeInsets.all(20.0),
                child: Text('Sonido extraído de: https://www.youtube.com/watch?v=CKF4tQBC-xQ'),
            ),
        );
    }
}