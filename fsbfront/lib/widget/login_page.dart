import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  Duration get loginTime => Duration(milliseconds: 2250);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: ListView(
        children: <Widget>[
          SizedBox(
            width: 150,
            height: 150,
            child: Image.network(
                "https://imagedelivery.net/cdkaXPuFls5qlrh3GM4hfA/7ab50bd0-fa89-407e-a45c-2aae09081500/preview"),
          ),
          Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: const TextField(
                    decoration: InputDecoration(
                      labelText: 'Username',
                    ),
                  ),
                ),
                const TextField(
                  decoration: InputDecoration(
                    labelText: 'Password',
                  ),
                  obscureText: true,
                ),
                Container(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: MaterialButton(
                    color: Colors.lightBlueAccent,
                    textColor: Colors.white,
                    child: const Text('Log In'),
                    onPressed: () => Navigator.of(context).pop(),
                    splashColor: Colors.redAccent,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
