import 'package:flutter/material.dart';

class VerticalListViewItem extends StatelessWidget {
  final String itemText;
  final Color color;
  const VerticalListViewItem(
      {Key? key, required this.itemText, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
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
        child: const ExpansionTile(
          title: Text(
            'Flutter Native Expansion Text',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
          ),
          expandedAlignment: Alignment.center,
          children: [
            // Text(
            //   'Item 1 hghghj ghgb Item 1 hghghj ghgb Item 1 hghghj ghgb Item 1 hghghj ghgb Item 1 hghghj ghgbItem 1 hghghj ghgb',
            //   style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
            // ),
            // SizedBox(
            //   height: 10,
            // ),
            Text(
                'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which dont look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isnt anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc')
          ],
        ),
      ),
    );
  }
}
