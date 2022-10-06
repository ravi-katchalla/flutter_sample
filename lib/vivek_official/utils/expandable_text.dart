import 'package:flutter/material.dart';

class ExpandableText extends StatefulWidget {
  ExpandableText({this.text = ""});
  //text is the total text of our expandable widget
  final String text;
  @override
  _ExpandableTextState createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  String textToDisplay = '';
  bool isEllipsis = true;
  @override
  void initState() {
    //if the text has more than a certain number of characters, the text we display will consist of that number of characters;
    //if it's not longer we display all the text
    print(widget.text.length);

    //we arbitrarily chose 25 as the length
    // textToDisplay = widget.text.length > 25
    //     ? widget.text.substring(0, 25) + "..."
    //     : widget.text;
    textToDisplay = widget.text;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: isEllipsis
          ? Text(
              textToDisplay,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            )
          : Text(
              textToDisplay,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
      onTap: () {
        setState(() {
          isEllipsis = !isEllipsis;
        });
        //if the text is not expanded we show it all
        // if (widget.text.length > 25 && textToDisplay.length <= 28) {
        //   setState(() {
        //     textToDisplay = widget.text;
        //   });
        // }
        // //else if the text is already expanded we contract it back
        // else if (widget.text.length > 25 && textToDisplay.length > 28) {
        //   setState(() {
        //     textToDisplay = widget.text;
        //   });
        // }
      },
    );
  }
}
