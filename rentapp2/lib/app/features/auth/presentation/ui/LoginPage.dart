import 'package:flutter/material.dart';
import 'package:rentapp2/app/di/service.dart';
import 'package:rentapp2/app/features/auth/data/data_source/jwtSignIn.dart';
import 'package:rentapp2/app/features/auth/data/data_source/TokenUser.dart';
import 'package:rentapp2/app/routes/app_router.dart';
import 'package:rentapp2/app/routes/router_utils.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 300,
              child: TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: 300,
              child: TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                AppRouter.router.pushNamed(Pages.registration.screenName);
              },
              child: const Text('Зарегистрироваться'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _authorize();
              },
              child: const Text('Войти'),
            ),
          ],
        ),
      ),
    );
  }

  void _authorize() async {
    var email = _emailController.text;
    var password = _passwordController.text;
    await TokenUser().setToken(""); // очищаем токен перед
    if (email == '' || password == '') {

    } else {
      String token =
        await  JwtSignIn(dio: service()).getToken(email, password);
      
      if (token == "fail") {
        print(token);
        print(token);
        print(token);
        print(token);
        print(token);
        print(token);

      } else {
        await TokenUser().setToken(token);
        await TokenUser().setUserEmail(email);
        AppRouter.router.pushNamed(Pages.home.screenName);
      }
    }
  }
}
