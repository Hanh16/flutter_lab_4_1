import 'package:flutter/material.dart';
import 'package:flutter_lab_4_1/arguments/detail_arguments.dart';

class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final DetailArguments args = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(args == null ? "Detail" : args.title),
      ),
      body: Center(
        child: Column(
          children: [
            Hero(
              tag: 'btnAnimate',
              child: ElevatedButton(
                child: Text('Go Back'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            args == null ? Container() : Text(args.message),
          ],
        ),
      ),
    );
  }
}
