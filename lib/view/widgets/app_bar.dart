import 'package:flutter/material.dart';

class autoappbar extends StatefulWidget {
  autoappbar({
    Key? key,
    required this.text,
  }) : super(key: key);

  String text;

  @override
  State<autoappbar> createState() => _autoappbarState();
}

class _autoappbarState extends State<autoappbar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,

      title: Text(
        widget.text,
        style: TextStyle(
          fontSize: 21,
          fontWeight: FontWeight.bold,
        ),
      ),
      // surfaceTintColor: Colors.green,
      centerTitle: false,
      // elevation:/
      // actions: [
      //   // SizedBox(
      //   //   height: 19,
      //   // ),
      //   Container(
      //       height: 90,
      //       width: 423,
      //       color: Colors.red,
      //       )
    ));
  }
}
