import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SequenceAnimationEx extends StatefulWidget {
  const SequenceAnimationEx({super.key});

  @override
  State<SequenceAnimationEx> createState() => _SequenceAnimationExState();
}

class _SequenceAnimationExState extends State<SequenceAnimationEx> with SingleTickerProviderStateMixin{

  late AnimationController _animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 2000));
  }
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}