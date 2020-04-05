import 'package:flutter/material.dart';

import 'package:chips/screen/chip_screen.dart';
import 'package:chips/screen/choice_chip_screen.dart';
import 'package:chips/screen/filter_chip_screen.dart';
import 'package:chips/screen/input_chip_screen.dart';
import 'package:chips/screen/action_chip_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Chips',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Colors.teal,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chips'),
      ),
      body: Center(
        child: IntrinsicWidth(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              RaisedButton(
                color: Colors.deepPurple,
                textColor: Colors.white,
                child: Text(
                  'Chip',
                  style: TextStyle(fontSize: 18),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return ChipScreen();
                      },
                    ),
                  );
                },
              ),
              SizedBox(height: 10.0),
              RaisedButton(
                color: Colors.deepPurple,
                textColor: Colors.white,
                child: Text(
                  'ChoiceChip',
                  style: TextStyle(fontSize: 18),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return ChoiceChipScreen();
                      },
                    ),
                  );
                },
              ),
              SizedBox(height: 10.0),
              RaisedButton(
                color: Colors.deepPurple,
                textColor: Colors.white,
                child: Text(
                  'ActionChip',
                  style: TextStyle(fontSize: 18),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return ActionChipScreen();
                      },
                    ),
                  );
                },
              ),
              SizedBox(height: 10.0),
              RaisedButton(
                color: Colors.deepPurple,
                textColor: Colors.white,
                child: Text(
                  'FilterChip',
                  style: TextStyle(fontSize: 18),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return FilterChipScreen();
                      },
                    ),
                  );
                },
              ),
              SizedBox(height: 10.0),
              RaisedButton(
                color: Colors.deepPurple,
                textColor: Colors.white,
                child: Text(
                  'InputChip',
                  style: TextStyle(fontSize: 18),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return InputChipScreen();
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
