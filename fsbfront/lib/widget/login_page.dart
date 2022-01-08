import 'package:flutter/material.dart';
import 'package:fsbfront/data/login_model.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Builder(builder: (context) {
        bool isLogin = context.watch<LoginModel>().isLogin;
        if (isLogin) {
          String userName = context.read<LoginModel>().name;
          return Center(
            child: Wrap(
              spacing: 20,
              crossAxisAlignment: WrapCrossAlignment.center,
              direction: Axis.vertical,
              children: [
                Text("Hi, $userName"),
                ElevatedButton(
                  onPressed: () {
                    context.read<LoginModel>().logoOut();
                  },
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    direction: Axis.horizontal,
                    children: const [
                      Icon(Icons.logout),
                      Text("登出"),
                    ],
                  ),
                )
              ],
            ),
          );
        }

        return ListView(
          children: <Widget>[
            SizedBox(
              width: 150,
              height: 150,
              child: Image.network(
                  "https://imagedelivery.net/cdkaXPuFls5qlrh3GM4hfA/7ab50bd0-fa89-407e-a45c-2aae09081500/preview"),
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
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
                      child: const Text('登入'),
                      onPressed: () {
                        context.read<LoginModel>().setLogin("Tony");
                        Navigator.of(context).pop();
                      },
                      splashColor: Colors.redAccent,
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}
