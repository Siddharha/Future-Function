import 'dart:async';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());
var _userNameController = TextEditingController();
var _passwordController = TextEditingController();

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Future Function',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: SimpleLoginPage(),
    );
  }
}

class SimpleLoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(5),
              child: TextFormField(
                decoration: InputDecoration(labelText: 'Enter your username'),
                controller: _userNameController,
              ),
            ),
            Container(
              margin: EdgeInsets.all(5),
              child: TextFormField(
                obscureText: true,
                decoration: InputDecoration(labelText: 'Enter your Password'),
                controller: _passwordController,
              ),
            ),
            AnswerSection(),
          ],
        ),
      ),
    );
  }
}

class AnswerSection extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AnswerSectionState();
  }
}

class _AnswerSectionState extends State<AnswerSection> {
  var ans;
  @override
  void initState() {
    ans = "No Username and Password";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        RaisedButton(
            child: Text("Submit"),
            onPressed: () {
              setState(() {
                var user = _userNameController.text.toString();
                var pass = _passwordController.text.toString();

                getUserAndPassAfer(user,pass).then((value) =>ans = value);
              });
            }),
        Container(
          child: Text(ans),
        )
      ],
    );
  }
}

Future<String> getUserAndPassAfer(String user, String pass) async{
 return "User ID is $user and Password: $pass";

}
