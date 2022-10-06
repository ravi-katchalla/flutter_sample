import 'package:flutter/material.dart';
import 'package:flutter_sample/vivek_official/widget/horizontal_list_view_item.dart';
import 'package:flutter_sample/vivek_official/widget/vertical_list_view_item.dart';

class VerticalHorizontalScrollScreen extends StatefulWidget {
  const VerticalHorizontalScrollScreen({Key? key}) : super(key: key);
  final List<Widget> horizontalList = const [
    HorizontalListViewItem(
      itemText: 'Item 1',
      color: Colors.amber,
    ),
    HorizontalListViewItem(
      itemText: 'Item 1',
      color: Colors.black,
    ),
    HorizontalListViewItem(
      itemText: 'Item 1',
      color: Colors.blue,
    ),
    HorizontalListViewItem(
      itemText: 'Item 1',
      color: Colors.red,
    ),
    HorizontalListViewItem(
      itemText: 'Item 1',
      color: Colors.orange,
    ),
    HorizontalListViewItem(
      itemText: 'Item 1',
      color: Colors.green,
    ),
    HorizontalListViewItem(
      itemText: 'Item 1',
      color: Colors.grey,
    ),
  ];

  final List<Widget> verticalList = const [
    VerticalListViewItem(
      itemText: 'Item 1',
      color: Colors.amber,
    ),
    VerticalListViewItem(
      itemText: 'Item 1',
      color: Colors.black,
    ),
    VerticalListViewItem(
      itemText: 'Item 1',
      color: Colors.blue,
    ),
    VerticalListViewItem(
      itemText: 'Item 1',
      color: Colors.red,
    ),
    VerticalListViewItem(
      itemText: 'Item 1',
      color: Colors.orange,
    ),
    VerticalListViewItem(
      itemText: 'Item 1',
      color: Colors.green,
    ),
    VerticalListViewItem(
      itemText: 'Item 1',
      color: Colors.grey,
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scroll Example'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 200,
                // flex: 1,
                // fit: FlexFit.loose,
                child: ListView(
                  shrinkWrap: true,
                  // physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  children: widget.horizontalList,
                ),
              ),
              Expanded(
                // flex: 1,
                // fit: FlexFit.tight,
                child: ListView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  children: widget.verticalList,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
