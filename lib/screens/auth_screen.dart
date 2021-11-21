import 'dart:developer';

import 'package:codezima_flutter/models/auth_model.dart';
import 'package:codezima_flutter/screens/registration_screen.dart';
import 'package:codezima_flutter/styles/styles.dart';
import 'package:flutter/material.dart';

//main widget what we can import
class AuthWidget extends StatefulWidget {
  const AuthWidget({Key? key}) : super(key: key);

  @override
  _AuthWidgetState createState() => _AuthWidgetState();
}

class _AuthWidgetState extends State<AuthWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: const [
          _AuthScreen(),
        ],
      ),
    );
  }
}

//authenication screen makes here
class _AuthScreen extends StatelessWidget {
  const _AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: const [
          SizedBox(
            height: 125,
          ),
          _FormWidget()
        ],
      ),
    );
  }
}

//widget form makes here
class _FormWidget extends StatelessWidget {
  const _FormWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //костыль(в будущем изменить способ получения текст контроллера)
    final model = AuthProvider.read(context)?.model;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          'Log In to Your CodeZima Account!',
          style: textStyle,
        ),
        const SizedBox(
          height: 26,
        ),
        const Divider(
          color: Colors.black,
          height: 4,
        ),
        const SizedBox(height: 24),
        SizedBox(
          width: 264,
          height: 51,
          child: TextField(
            controller: model?.emailTextController,
            decoration: textFieldDecorartorEmail(''),
          ),
        ),
        const SizedBox(
          height: 39,
        ),
        SizedBox(
          width: 264,
          height: 51,
          child: TextField(
            controller: model?.passwordTextController,
            decoration: textFieldDecorartorPassword(''),
            obscureText: true,
          ),
        ),
        const _ErrorMessageWidget(),
        const SizedBox(
          height: 24,
        ),
        const Divider(
          color: Colors.black,
          height: 2,
        ),
        const SizedBox(
          height: 50,
        ),
        const SizedBox(width: 264, height: 51, child: _AuthButtonWidget()),
        const SizedBox(
          height: 24,
        ),
        const Text("Don't have an account?"),
        const SizedBox(
          height: 24,
        ),
        const SizedBox(width: 264, height: 51, child: _NavigateButtonWidget()),
      ],
    );
  }
}

class _AuthButtonWidget extends StatelessWidget {
  const _AuthButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = AuthProvider.watch(context)?.model;
    final onPressed =
        model?.canAuth == true ? () => model?.auth(context) : null;
    return ElevatedButton(
      onPressed: () {},
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(const Color(0xFFEC5252)),
          foregroundColor: MaterialStateProperty.all(Colors.white),
          textStyle: MaterialStateProperty.all(
            const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
          ),
          padding: MaterialStateProperty.all(const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 8,
          ))),
      child: const Text('Log In'),
    );
  }
}

//go to registr
class _NavigateButtonWidget extends StatelessWidget {
  const _NavigateButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const RegistrationWidget()),
        );
      },
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(const Color(0xFFEC5252)),
          foregroundColor: MaterialStateProperty.all(Colors.white),
          textStyle: MaterialStateProperty.all(
            const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
          ),
          padding: MaterialStateProperty.all(const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 8,
          ))),
      child: const Text('Sign Up'),
    );
  }
}

//widget with message error
class _ErrorMessageWidget extends StatelessWidget {
  const _ErrorMessageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final errorMessage = AuthProvider.watch(context)?.model.errorMessage;
    if (errorMessage == null) return const SizedBox.shrink();
    return Padding(
      padding: const EdgeInsets.only(bottom: 0),
      child: Text(
        errorMessage,
        style: const TextStyle(
          fontSize: 17,
          color: Colors.red,
        ),
      ),
    );
  }
}
