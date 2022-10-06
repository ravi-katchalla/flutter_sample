import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class AnimatedContainerEx extends StatefulWidget {
  const AnimatedContainerEx({super.key});

  @override
  State<AnimatedContainerEx> createState() => _AnimatedContainerExState();
}

class _AnimatedContainerExState extends State<AnimatedContainerEx> {

  double _width = 200;
  double _height = 300;
  bool stopAnimation = false;
  Color _color = const Color.fromARGB(255, 245, 124, 164);

  Tween<double> tween = Tween<double>(begin: 0.1, end: 1);

  void _addAnimation() {
    setState(() {
      if (stopAnimation == true) {
        stopAnimation = false;
        _width = 200;
        _height = 200;
      } else {
        stopAnimation = true;
        _width = 400;
        _height = 400;
      }

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 40,),
            ElevatedButton(
              onPressed: () {
                _addAnimation();
              }, 
              child: const Text('start Animation'),
            ),
      
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: AnimatedContainer(
                duration: Duration(milliseconds: 400),
                height: _width,
                width: _height,
                curve: Curves.easeInOutBack,
                color: Colors.lightBlue[200],
                child: Center(
                  child: Text(
                    'Animation', style:Theme.of(context).textTheme.headline5
                  )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: TweenAnimationBuilder(  // wrap container with tween animation builder
                tween: tween,
                duration: Duration(milliseconds: 600), // delay transition duration
                builder: (context, value, child) => Transform.scale(scale: value, child: child,),
                child: Container(
                  height: 200,
                width: 200,
                color: Colors.lightBlue[200],
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: Text(
                      'Tween Animation', style:Theme.of(context).textTheme.headline5
                    ),
                  ))
                ),
              ),
            )
          ],
          
        ),
      ),
    );
  }
}