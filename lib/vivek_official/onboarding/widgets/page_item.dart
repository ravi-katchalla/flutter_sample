import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PageItem extends StatelessWidget {
  final title;
  final image;
  final description;

  const PageItem({
    this.title,
    this.description,
    this.image,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 250,
          width: 250,
          child: SvgPicture.asset(
            image,
            allowDrawingOutsideViewBox: true,
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Text(
          title,
          style: const TextStyle(fontSize: 22, fontFamily: 'OpenSans'),
        ),
        const SizedBox(
          height: 9,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Text(
            description,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 16,
                fontFamily: 'OpenSans',
                fontWeight: FontWeight.normal),
          ),
        ),
      ],
    );
  }
}
