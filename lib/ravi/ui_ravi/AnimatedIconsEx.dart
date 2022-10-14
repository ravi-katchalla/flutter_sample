import 'package:animate_icons/animate_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class AnimatedIconsEx extends StatefulWidget {
  const AnimatedIconsEx({super.key});

  @override
  State<AnimatedIconsEx> createState() => _AnimatedIconsExState();
}

class _AnimatedIconsExState extends State<AnimatedIconsEx> with SingleTickerProviderStateMixin {
  bool isOpen = false;
  bool isIconClick = false;
  late AnimationController _controller;
  late AnimateIconController _controller2;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller= AnimationController(vsync : this, duration: Duration(milliseconds: 300));
    _controller2 = AnimateIconController();
  }


@override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }
  void _toggleOpen() {
    setState(() {
      isOpen = !isOpen;
      isOpen ? _controller.forward() : _controller.reverse();

    });
  }

  void _toggleIcon() {
      setState(() {
      isIconClick = !isIconClick;
      isIconClick ? _controller2.animateToStart() : _controller2.animateToEnd();

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: ConstrainedBox(
        constraints: BoxConstraints.tightForFinite(),
        child: Container(
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Stack(
                alignment: Alignment.bottomLeft,
                children: <Widget>[
                  SizedBox(height: 300,),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(140, 5, 0, 0),
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeInCubic,
                      height: !isOpen ? 50 : 350,
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: StadiumBorder()),
                       
                    ),
                  ),
                  Container (
                  child: Column(children: [
                    AnimatedOpacity(
                    duration: const Duration(milliseconds: 500),
                    opacity: isOpen ? 1 : 0,
                    curve: Curves.fastOutSlowIn,
                    child: Container(
                      color: Colors.white,
                      height : !isOpen ? 0 : 400,
                      padding: EdgeInsets.only(top: 40),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(height: 20,),
                          Container(
                            child: Row(
                              children: <Widget>[
                                SizedBox(width: 207),
                                Text('Online Store', style: TextStyle(color: Colors.black, fontSize: 20)),
                                SizedBox(width: 10,),
                                Container(
                                        width: 50,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            shape: BoxShape.circle,
                                            boxShadow: [BoxShadow(
                                                color: Colors.grey.withOpacity(0.5),
                                                spreadRadius: 2,
                                                blurRadius: 7,
                                                offset: Offset(0, 2)
                                              )],
                                          ),
                                        child: IconButton(
                                          icon: Icon(Icons.store),
                                          onPressed:() {
                                            
                                          }),
                                      )
                              ],
                            ),
                          ),
                          SizedBox(height: 20,),
                          Container(
                            child: Center(
                              child: Row(
                                children: <Widget>[
                                  SizedBox(width: 285),
                                  Text('Edit', style: TextStyle(color: Colors.black, fontSize: 20)),
                                  SizedBox(width: 10,),
                                  Container(
                                          width: 50,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            shape: BoxShape.circle,
                                            boxShadow: [BoxShadow(
                                                color: Colors.grey.withOpacity(0.5),
                                                spreadRadius: 2,
                                                blurRadius: 7,
                                                offset: Offset(0, 2)
                                              )],
                                          ),
                                          child: IconButton(
                                            icon: Icon(Icons.edit),
                                            onPressed:() {
                                              
                                            }),
                                        )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 20,),
                           Container(
                            child: Center(
                              child: Row(
                                children: <Widget>[
                                  SizedBox(width: 272),
                                  Text('Shop', style: TextStyle(color: Colors.black, fontSize: 20)),
                                  SizedBox(width: 10,),
                                  Container(
                                          width: 50,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            shape: BoxShape.circle,
                                            boxShadow: [BoxShadow(
                                                color: Colors.grey.withOpacity(0.5),
                                                spreadRadius: 2,
                                                blurRadius: 7,
                                                offset: Offset(0, 2)
                                              )],
                                          ),
                                          child: IconButton(
                                            icon: Icon(Icons.shop),
                                            onPressed:() {
                                              
                                            }),
                                        )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 20,),
                          Container(
                            child: Center(
                              child: Row(
                                children: <Widget>[
                                  SizedBox(width: 255),
                                  Text('Search', style: TextStyle(color: Colors.black, fontSize: 20)),
                                  SizedBox(width: 10,),
                                  Container(
                                          width: 50,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            shape: BoxShape.circle,
                                            boxShadow: [BoxShadow(
                                                color: Colors.grey.withOpacity(0.5),
                                                spreadRadius: 2,
                                                blurRadius: 7,
                                                offset: Offset(0, 2)
                                              )],
                                          ),
                                          child: IconButton(
                                            icon: Icon(Icons.search),
                                            onPressed:() {
                                              
                                            }),
                                        )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(300, 20, 0, 0),
                    child: Container(
                      width: 50,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.circle,
                        boxShadow: [BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 7,
                          offset: Offset(0, 2)
                        )]
                      ),
                      
                      child: IconButton(
                        icon: AnimatedIcon(
                          color : Colors.white,
                          progress: _controller,
                          icon: AnimatedIcons.menu_close
                          ),
                        onPressed:() {
                          _toggleOpen();
                        }),
                    ),
                  ),
                  SizedBox(height: 35,),
                  ]), ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: Container(
                    child: AnimateIcons(
                        startIcon: Icons.add,
                        endIcon: Icons.close,
                        size: 60.0,
                        controller: _controller2,
                        onStartIconPress: () {
                            print("Clicked on Add Icon");
                            return true;
                        },
                        onEndIconPress: () {
                            print("Clicked on Close Icon");
                            return true;
                        },
                        duration: const Duration(milliseconds: 500),
                        clockwise: false,
                    ),
                  ),
                )
                  
              ],
              ),
              
            ],
          ),
        ),),
    );
  }

  _buildIcon ({ IconData? icon, String? title}) {
    return Container(
      child: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(title!, style: TextStyle(color: Colors.black, fontSize: 20)),
            SizedBox(width: 20,),
            Container(
                    width: 50,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: Icon(icon),
                      onPressed:() {
                        
                      }),
                  )
          ],
        ),
      ),
    );
  }
}