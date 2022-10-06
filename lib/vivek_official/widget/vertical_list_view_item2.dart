import 'package:flutter/material.dart';
import 'package:flutter_sample/vivek_official/utils/expandable_text.dart';

class VerticalListViewItem2 extends StatelessWidget {
  final String itemText;
  final Color color;
  const VerticalListViewItem2(
      {Key? key, required this.itemText, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      // child: ListTile(
      //   title: Text(itemText),
      //   leading: CircleAvatar(
      //     radius: 30,
      //     backgroundColor: color,
      //     child: const Padding(
      //       padding: EdgeInsets.all(6.0),
      //     ),
      //   ),
      //   trailing: Text('fhhg'),
      // ),
      child: ExpandableText(
          text:
              'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum'),
    );
  }
}
