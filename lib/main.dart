import 'package:flutter/material.dart';
import 'package:generichttp/json_place_holder/json_place_holder.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: JsonPlaceHolder(),
    );
  }
}
