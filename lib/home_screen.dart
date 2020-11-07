import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_lab_4_1/arguments/detail_arguments.dart';
import 'package:flutter_lab_4_1/detail_screen.dart';
import 'package:flutter_lab_4_1/selection_screen.dart';
import 'package:flutter_lab_4_1/totos_screen.dart';

class HomeScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text('Home Screen'),
        ),
        body: Center(
          child: Column(
            children: [
              Hero(
                tag: 'btnAnimate',
                child: ElevatedButton(
                    child: Text('Animate a widget across screens'),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => DetailScreen()));
                    }),
              ),
              ElevatedButton(
                  child: Text('Navigate to a new screen and back'),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => DetailScreen()));
                  }),
              ElevatedButton(
                  child: Text('Navigate with named routes'),
                  onPressed: () {
                    Navigator.pushNamed(context, '/detail');
                  }),
              ElevatedButton(
                  child: Text('Pass arguments to a named route'),
                  onPressed: () {
                    Navigator.pushNamed(context, '/detail',
                        arguments: DetailArguments(
                            title: 'Arguments', message: 'Arguments message'));
                  }),
              ElevatedButton(
                  child: Text('Return data from a screen'),
                  onPressed: () {
                    _navigateAndDisplaySelection(context);
                  }),
              ElevatedButton(
                  child: Text('Send data to a new screen'),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => TodosScreen()));
                  })
            ],
          ),
        ));
  }

  _navigateAndDisplaySelection(BuildContext context) async {
    final result = await Navigator.push(
        context, MaterialPageRoute(builder: (_) => SelectionScreen()));

    if (result != null)
      _scaffoldKey.currentState.showSnackBar(new SnackBar(
        content: new Text("$result"),
        duration: Duration(milliseconds: 400),
      ));
  }
}
