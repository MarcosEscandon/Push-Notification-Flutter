import 'package:flutter/material.dart';
import 'package:badges/badges.dart';

class HomePage extends StatelessWidget {
  //const HomePage({ Key? key }) : super(key: key);
  int counter = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Badge(
          badgeContent: Text(counter.toString()),
          child: Text('Home Page')
          ),  
      ),
      body: Center(child: Text('Hola Mundo'),
      ),
    );
  }
}