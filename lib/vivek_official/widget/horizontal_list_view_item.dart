import 'package:flutter/material.dart';

class HorizontalListViewItem extends StatelessWidget {
  final String itemText;
  final Color color;
  const HorizontalListViewItem(
      {Key? key, required this.itemText, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.orange[800],
        boxShadow: [
          BoxShadow(
              color: Colors.black.withAlpha(30),
              offset: const Offset(3.0, 10.0),
              blurRadius: 15)
        ],
      ),
      height: 200,
      width: 150,
      // color: color,
      child: Center(
          child: Text(
        itemText,
        style: const TextStyle(
            color: Colors.white,
            fontFamily: 'OpenSans',
            fontWeight: FontWeight.w600),
      )),
    );
  }
}
