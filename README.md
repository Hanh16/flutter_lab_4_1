# flutter_lab_4_1

Thực hành điều hướng điều hướng và định tuyến

![](/screenshorts/home.png)

## main.dart
```dart
import 'package:flutter/material.dart';
import 'package:flutter_lab_4_1/detail_screen.dart';
import 'package:flutter_lab_4_1/home_screen.dart';

void main() {
  runApp(MyApp());
}
// Show all exercise in HomeScreen
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // 3. Navigate with named routes
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/detail': (context) => DetailScreen(),
      },
    );
  }
}
```

## home_screen.dart
```dart
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
              // 1. Animate a widget across screens
              Hero(
                tag: 'btnAnimate',
                child: ElevatedButton(
                    child: Text('Animate a widget across screens'),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => DetailScreen()));
                    }),
              ),
              // 2. Navigate to a new screen and back
              ElevatedButton(
                  child: Text('Navigate to a new screen and back'),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => DetailScreen()));
                  }),
              // 3. Navigate with named routes
              ElevatedButton(
                  child: Text('Navigate with named routes'),
                  onPressed: () {
                    Navigator.pushNamed(context, '/detail');
                  }),
              // 4. Pass arguments to a named route
              ElevatedButton(
                  child: Text('Pass arguments to a named route'),
                  onPressed: () {
                    Navigator.pushNamed(context, '/detail',
                        arguments: DetailArguments(
                            title: 'Arguments', message: 'Arguments message'));
                  }),
              // 5 .Return data from a screen
              ElevatedButton(
                  child: Text('Return data from a screen'),
                  onPressed: () {
                    _navigateAndDisplaySelection(context);
                  }),
              // 6. Send data to a new screen
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

  // 5 .Return data from a screen
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
```

## detail_screen.dart
```dart
import 'package:flutter/material.dart';
import 'package:flutter_lab_4_1/arguments/detail_arguments.dart';

class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 4. Pass arguments to a named route
    final DetailArguments args = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(args == null ? "Detail" : args.title),
      ),
      body: Center(
        child: Column(
          children: [
            // 1. Animate a widget across screens
            Hero(
              tag: 'btnAnimate',
              child: ElevatedButton(
                child: Text('Go Back'),
                onPressed: () {
                  // 2. Navigate to a new screen and back
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
```

## selection_screen.dart
```dart
import 'package:flutter/material.dart';

class SelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pick an option'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  // 5 .Return data from a screen
                  Navigator.pop(context, 'Yep!');
                },
                child: Text('Yep!'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  // 5 .Return data from a screen
                  Navigator.pop(context, 'Nope.');
                },
                child: Text('Nope.'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
```

## todo_screen.dart
```dart
import 'package:flutter/material.dart';
import 'package:flutter_lab_4_1/models/todo_model.dart';
import 'package:flutter_lab_4_1/todo_screen.dart';

class TodosScreen extends StatelessWidget {
  final todos = List<Todo>.generate(
    20,
    (i) => Todo(
      'Todo $i',
      'A description of what needs to be done for Todo $i',
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todos'),
      ),
      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(todos[index].title),
            onTap: () {
              // 6. Send data to a new screen
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TodoScreen(todo: todos[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
```

## todo_screen.dart
```dart
import 'package:flutter/material.dart';
import 'package:flutter_lab_4_1/models/todo_model.dart';

class TodoScreen extends StatelessWidget {
  final Todo todo;
  // 6. Send data to a new screen
  TodoScreen({Key key, @required this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(todo.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(todo.description),
      ),
    );
  }
}
```

