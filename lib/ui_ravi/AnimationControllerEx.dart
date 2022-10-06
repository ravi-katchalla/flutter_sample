import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class AnimationControllerEx extends StatefulWidget {
  const AnimationControllerEx({super.key});

  @override
  State<AnimationControllerEx> createState() => _AnimationControllerExState();
}

class _AnimationControllerExState extends State<AnimationControllerEx> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _animation;
  late Animation _animation1;
  bool reverse = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(vsync: this, duration: Duration(milliseconds: 2000));  // by default controller emits values from 0 to 1 over this duration 200ms
   // _controller.forward(); // to start animation
    //_controller.repeat(); // animation in loop
    // _controller.reverse(); // reverse the animation

    //Add color tween to change color over this duration of time
    _animation = ColorTween(begin: Colors.grey, end: Colors.red).animate(_controller); // assigning controller to control this animation tween
    _animation1 = ColorTween(begin: Colors.grey, end: Colors.red).chain(Tween<double>(begin: 0.1, end: 1)).animate(_controller);
    _controller.addListener(() { // add listner to controller emiting value
      print(_controller.value);
      print(_animation.value);

      setState(() {
        _animation.value;
      });
    });

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          reverse = true;  
        });
      } else {
        setState(() {
          reverse = false;  
        });
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body : Column(
        children: <Widget>[
          Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: Container(
                    height: 200,
                    width: 200,
                    color:_animation.value,
                    child: Center(child: Text('without Animated builder', style: Theme.of(context).textTheme.headline5)),
                  ),
                ),
                SizedBox(height: 20,),
                AnimatedBuilder(
                  animation: _controller,
                  builder: (BuildContext context, _) {  // every time controller value changes builder will rebuild this child
                    return Padding(
                      padding: const EdgeInsets.all(40.0),
                      child: MaterialButton(
                        onPressed: () {
                          reverse ? _controller.reverse() : _controller.forward();
                        },
                        child: Container(
                          height: 200,
                          width: 200,
                          color:_animation1.value,
                          child: Center(child: Text('Animated builder', style: Theme.of(context).textTheme.headline5)),
                          
                        ),
                      ),
                  );
                  },
                )
        ],
      )
    );
  }
}