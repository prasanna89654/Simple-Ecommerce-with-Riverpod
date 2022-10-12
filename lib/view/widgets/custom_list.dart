import 'package:flutter/material.dart';

class CustomList extends StatefulWidget {
  CustomList(
      {Key? key,
      required this.textButton,
      required this.text,
      required this.press})
      : super(key: key);
  String textButton;
  String text;
  VoidCallback press;

  @override
  State<CustomList> createState() => _CustomListState();
}

class _CustomListState extends State<CustomList> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            // padding: const Edge,
            height: 60,
            width: 70,
            // color: Colors.red,
            child: TextButton(
              onPressed: widget.press,
              child: Image.asset(
                widget.textButton,
                height: 40,
                width: 40,
                color: Colors.blue,
              ),

              // widget.textButton,

              // height: 40,
              // width: 40,
              // color: Colors.blue,
            ),
          ),
          SizedBox(height: 2),
          Container(
            padding: const EdgeInsets.only(left: 6),
            height: 18,
            width: 120,
            // color: Colors.blue,
            child: Text(
              widget.text,
              style: TextStyle(color: Colors.black, fontSize: 13),
            ),
          ),
        ],
      ),
    );
  }
}
