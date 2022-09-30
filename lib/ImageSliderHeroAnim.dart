import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_sample/LoadFullImage.dart';
import 'package:flutter_sample/models/ImageData.dart';

class ImagerSliderHeroAnim extends StatefulWidget {
  const ImagerSliderHeroAnim({super.key});

  @override
  State<ImagerSliderHeroAnim> createState() => _ImagerSliderHeroAnimState();
}

class _ImagerSliderHeroAnimState extends State<ImagerSliderHeroAnim> {
  late PageController _pageController; // late initialization
  int _currentPage = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController(initialPage: _currentPage, viewportFraction: 0.8); // viewPortFraction : 0.8% of view 
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40),
        child: Column(
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.all(40.0),
              child: Text('Carousel Scroll', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: Colors.black),),
            ),
            AspectRatio(
              aspectRatio: 0.85,
              child: PageView.builder(
                itemCount: dataList.length,
                physics: const ClampingScrollPhysics(),
                controller: _pageController,
                itemBuilder: (context, index) {
                  return corouselView(index);
              }),
            )
          ],
        ),
      ),
    );
  }

  Widget corouselView(int index) {
    return carouselCard(dataList[index]);
  }

  Widget carouselCard(ImageData data) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white,
                image: DecorationImage(
                  image: AssetImage(data.path),
                  fit: BoxFit.fill)
              ),
            ),
          ),
        ),
        Text("\$${data.title}", 
          style : const TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: Colors.black),)
      ],
    );
  }
}

