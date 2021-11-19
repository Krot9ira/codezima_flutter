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
            height: 20,
          ),
          _FormWidget()
        ],
      ),
    );
  }
}

//widget form makes here
class _FormWidget extends StatefulWidget {
  const _FormWidget({Key? key}) : super(key: key);

  @override
  __FormWidgetState createState() => __FormWidgetState();
}

class __FormWidgetState extends State<_FormWidget> {
  final _nameTextController = TextEditingController();
  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  String? errorText;

  void _auth() {}

  void _resetPaswword() {}
  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
      fontSize: 18,
      color: Color(0xFF213428),
    );
    const textFieldDecorartor = InputDecoration(
      border: OutlineInputBorder(),
      contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      isCollapsed: true,
      fillColor: Colors.black,
      focusColor: Colors.black,
      hoverColor: Colors.black,
    );
    final errorText = this.errorText;

    return Column();
  }
}
