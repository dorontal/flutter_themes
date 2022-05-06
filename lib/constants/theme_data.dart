import 'package:flutter/material.dart';

// Mostly based on https://www.youtube.com/watch?v=H2xNq5ph8OE

// const primaryColor = Colors.deepOrange;

final themeData = ThemeData(
    brightness: Brightness.dark,
    primarySwatch: Colors.blue,
    // primaryColor: primaryColor,
    // primaryColor: const Color(0xff64ffda),
    inputDecorationTheme: InputDecorationTheme(
      // contentPadding: const EdgeInsets.all(16),
      contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
      // always put the label at the top
      floatingLabelBehavior: FloatingLabelBehavior.always,
      fillColor: Colors.blue,

      // Border

      // enabled, not focused, no error
      enabledBorder: _buildOutlineInputBorder(Colors.grey[600]!),
      // enabled, not focused, error
      errorBorder: _buildOutlineInputBorder(Colors.red),
      // enabled, focused, error
      focusedErrorBorder: _buildOutlineInputBorder(Colors.red),
      // enabbled, focused, no error
      focusedBorder: _buildOutlineInputBorder(Colors.blue),
      // disabled
      disabledBorder: _buildOutlineInputBorder(Colors.grey[400]!),

      // Text

      prefixStyle: _buildTextStyle(Colors.white),
      suffixStyle: _buildTextStyle(Colors.white),
      // counter shows up at bottom right below field eg, to show # of chars:
      counterStyle: _buildTextStyle(Colors.grey, fontSize: 12),
      // label that has floated to the border of the textbox:
      // floatingLabelStyle: _buildTextStyle(Colors.white),
      // Make errorStyle.size == helperStyle.size so that the field
      // does not grow in size when there is an error
      errorStyle: _buildTextStyle(Colors.red, fontSize: 12),
      helperStyle: _buildTextStyle(Colors.white, fontSize: 12),
      hintStyle: _buildTextStyle(Colors.grey),
      // label that's inside the textbox:
      //labelStyle: _buildTextStyle(Colors.white),
    ));

OutlineInputBorder _buildOutlineInputBorder(Color color) => OutlineInputBorder(
    borderRadius: const BorderRadius.all(Radius.circular(4)),
    borderSide: BorderSide(
      color: color,
      width: 1,
    ));

TextStyle _buildTextStyle(Color color, {double fontSize = 16}) => TextStyle(
      color: color,
      fontSize: fontSize,
    );
