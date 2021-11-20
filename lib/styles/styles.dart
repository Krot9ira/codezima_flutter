import 'package:flutter/material.dart';

textFieldDecorartorName(errorText) {
  return (const InputDecoration(
      border: OutlineInputBorder(),
      contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 0),
      isCollapsed: false,
      fillColor: Colors.black,
      focusColor: Colors.black,
      hoverColor: Colors.black,
      hintText: 'Full Name',
      prefixIcon: Icon(Icons.person)));
}

textFieldDecorartorEmail(errorText) {
  return (const InputDecoration(
      border: OutlineInputBorder(),
      contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 0),
      isCollapsed: false,
      fillColor: Colors.red,
      focusColor: Colors.black,
      hoverColor: Colors.black,
      // focusedBorder: OutlineInputBorder(
      //   borderSide: BorderSide(color: Colors.red),
      // ),
      hintText: 'Email',
      prefixIcon: Icon(Icons.mail)));
}

textFieldDecorartorPassword(errorText) {
  return (const InputDecoration(
      border: OutlineInputBorder(),
      contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 0),
      isCollapsed: false,
      fillColor: Colors.black,
      focusColor: Colors.black,
      hoverColor: Colors.black,
      hintText: 'Password',
      prefixIcon: Icon(Icons.lock)));
}

const textStyle = TextStyle(
  fontSize: 18,
  color: Color(0xFF213428),
);
