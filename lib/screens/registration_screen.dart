import 'dart:developer';

import 'package:codezima_flutter/models/registration_model.dart';
import 'package:codezima_flutter/styles/styles.dart';
import 'package:flutter/material.dart';

//main widget what we can import
class RegistrationWidget extends StatefulWidget {
  const RegistrationWidget({Key? key}) : super(key: key);

  @override
  _RegistrationWidgetState createState() => _RegistrationWidgetState();
}

class _RegistrationWidgetState extends State<RegistrationWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: const [
          _RegistrationScreen(),
        ],
      ),
    );
  }
}

//registration screen makes here
class _RegistrationScreen extends StatelessWidget {
  const _RegistrationScreen({Key? key}) : super(key: key);

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
    final model = RegistarationProvider.read(context)?.model;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          'Sign up and Start Learning',
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
            controller: model?.nameTextController,
            decoration: textFieldDecorartorName(''),
          ),
        ),
        const SizedBox(height: 39),
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
        const SizedBox(
            width: 264, height: 51, child: _RegistrationButtonWidget())
      ],
    );
  }
}

class _RegistrationButtonWidget extends StatelessWidget {
  const _RegistrationButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = RegistarationProvider.watch(context)?.model;
    final onPressed = model?.canRegistration == true
        ? () => model?.registration(context)
        : null;
    return ElevatedButton(
      onPressed: onPressed,
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
    final errorMessage =
        RegistarationProvider.watch(context)?.model.errorMessage;
    if (errorMessage == null) return const SizedBox.shrink();
    return Padding(
      padding: EdgeInsets.only(bottom: 20),
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
