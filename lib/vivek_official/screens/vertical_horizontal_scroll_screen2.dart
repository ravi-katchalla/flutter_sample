import 'package:flutter/material.dart';
import 'package:flutter_sample/vivek_official/widget/horizontal_list_view_item.dart';
import 'package:flutter_sample/vivek_official/widget/vertical_list_view_item.dart';
import 'package:flutter_sample/vivek_official/widget/vertical_list_view_item2.dart';

class VerticalHorizontalScrollScreen extends StatefulWidget {
  const VerticalHorizontalScrollScreen({Key? key}) : super(key: key);
  final List<Widget> horizontalList = const [
    HorizontalListViewItem(
      itemText: 'Item 1',
      color: Colors.amber,
    ),
    HorizontalListViewItem(
      itemText: 'Item 2',
      color: Colors.black,
    ),
    HorizontalListViewItem(
      itemText: 'Item 3',
      color: Colors.blue,
    ),
    HorizontalListViewItem(
      itemText: 'Item 4',
      color: Colors.red,
    ),
    HorizontalListViewItem(
      itemText: 'Item 5',
      color: Colors.orange,
    ),
    HorizontalListViewItem(
      itemText: 'Item 6',
      color: Colors.green,
    ),
    HorizontalListViewItem(
      itemText: 'Item 7',
      color: Colors.grey,
    ),
  ];

  final List<Widget> verticalList = const [
    VerticalListViewItem2(
      itemText: 'Item 1',
      color: Colors.amber,
    ),
    VerticalListViewItem2(
      itemText: 'Item 2',
      color: Colors.black,
    ),
    VerticalListViewItem2(
      itemText: 'Item 3',
      color: Colors.blue,
    ),
    VerticalListViewItem2(
      itemText: 'Item 4',
      color: Colors.red,
    ),
    VerticalListViewItem2(
      itemText: 'Item 5',
      color: Colors.orange,
    ),
    VerticalListViewItem2(
      itemText: 'Item 6',
      color: Colors.green,
    ),
    VerticalListViewItem2(
      itemText: 'Item 7',
      color: Colors.grey,
    ),
    VerticalListViewItem(
      itemText: 'Item 8',
      color: Colors.orange,
    ),
    VerticalListViewItem(
      itemText: 'Item 9',
      color: Colors.cyan,
    ),
    VerticalListViewItem(
      itemText: 'Item 10',
      color: Colors.green,
    ),
    VerticalListViewItem(
      itemText: 'Item 11',
      color: Colors.red,
    ),
    VerticalListViewItem(
      itemText: 'Item 12',
      color: Colors.blue,
    ),
    VerticalListViewItem(
      itemText: 'Item 13',
      color: Colors.black,
    ),
  ];

  @override
  State<VerticalHorizontalScrollScreen> createState() =>
      _VerticalHorizontalScrollScreenState();
}

class _VerticalHorizontalScrollScreenState
    extends State<VerticalHorizontalScrollScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scroll Example'),
      ),
      body: ListView(
        shrinkWrap: false,
        scrollDirection: Axis.vertical,
        children: [
          const TextField(
            decoration: InputDecoration(hintText: 'Enter Text'),
          ),
          SizedBox(
            height: 200,
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: widget.horizontalList,
            ),
          ),
          ...widget.verticalList,
        ],
      ),
    );
  }
}
