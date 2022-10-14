import 'package:flutter/material.dart';
import 'package:flutter_sample/ravi/githubEx/LoginPage.dart';
import 'package:flutter_sample/ravi/todoApp/MyTodoApp.dart';
import 'package:flutter_sample/ravi/todoApp/todoHome.dart';
import 'package:flutter_sample/ravi/ui_ravi/AnimatedContainerEx.dart';
import 'package:flutter_sample/ravi/ui_ravi/AnimatedIconsEx.dart';
import 'package:flutter_sample/ravi/ui_ravi/AnimationControllerEx.dart';
import 'package:flutter_sample/ravi/ui_ravi/BottomNavigationBar.dart';
import 'package:flutter_sample/ravi/ui_ravi/BottomNavyBarEx.dart';
import 'package:flutter_sample/ravi/ui_ravi/BouncingWidgetExample.dart';
import 'package:flutter_sample/ravi/ui_ravi/GoogleMapsEx.dart';
import 'package:flutter_sample/ravi/ui_ravi/HttpGetEx.dart';
import 'package:flutter_sample/ravi/ui_ravi/ImageSliderHeroAnim.dart';
import 'package:flutter_sample/ravi/ui_ravi/SecondScreen.dart';
import 'package:flutter_sample/ravi/ui_ravi/SequenceAnimationEx.dart';
import 'package:flutter_sample/ravi/ui_ravi/githubUsersFetch.dart';
import 'package:flutter_sample/ravi/ui_ravi/swipeUp_example.dart';
import 'package:provider/provider.dart';
import 'package:flutter_sample/ravi/githubEx/data_provider.dart';


class MyAppStart extends StatelessWidget {
  const MyAppStart({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UserProvider(),
      child: MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
      routes: {
        '/second' :(context) => const SecondScreen()
      },
    ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int _activeIndex = 0;
  String url = "https://ouch-cdn2.icons8.com/AVdOMf5ui4B7JJrNzYULVwT1z8NlGmlRYZTtg1F6z9E/rs:fit:784:767/czM6Ly9pY29uczgu/b3VjaC1wcm9kLmFz/c2V0cy9zdmcvOTY5/L2NlMTY1MWM5LTRl/ZjUtNGRmZi05MjQ3/LWYzNGQ1MzhiOTQ0/Mi5zdmc.png";

  void _incrementCounter() {
    setState(() {
      _counter++;
      _activeIndex++;
      if (_activeIndex == 1) {
        url = "https://ouch-cdn2.icons8.com/fv7W4YUUpGVcNhmKcDGZp6pF1-IDEyCjSjtBB8-Kp_0/rs:fit:784:784/czM6Ly9pY29uczgu/b3VjaC1wcm9kLmFz/c2V0cy9zdmcvMTUv/ZjUzYTU4NDAtNjBl/Yy00ZWRhLWE1YWIt/ZGM1MWJmYjBiYjI2/LnN2Zw.png";
      } else if (_activeIndex == 2) {
        url = "https://ouch-cdn2.icons8.com/As6ct-Fovab32SIyMatjsqIaIjM9Jg1PblII8YAtBtQ/rs:fit:784:784/czM6Ly9pY29uczgu/b3VjaC1wcm9kLmFz/c2V0cy9zdmcvNTg4/LzNmMDU5Mzc0LTky/OTQtNDk5MC1hZGY2/LTA2YTkyMDZhNWZl/NC5zdmc.png";
      } else {
        url = "https://ouch-cdn2.icons8.com/AVdOMf5ui4B7JJrNzYULVwT1z8NlGmlRYZTtg1F6z9E/rs:fit:784:767/czM6Ly9pY29uczgu/b3VjaC1wcm9kLmFz/c2V0cy9zdmcvOTY5/L2NlMTY1MWM5LTRl/ZjUtNGRmZi05MjQ3/LWYzNGQ1MzhiOTQ0/Mi5zdmc.png";
      }

      if (_activeIndex > 2) {
        _activeIndex = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 40,),
            const Text(
              'You have pushed the button this many times:',
            ),
            const SizedBox(height: 20,),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 40),
              height: 300,
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Image.network(url, height: 250,),
                  )
                ],
              )
            ),
            
            const SizedBox(height: 20,),
            MaterialButton(
              onPressed: () {
             Navigator.of(context).push(MaterialPageRoute(builder: (context) => const CustomBottomNavigationBar()));
              },
              color: Colors.white,
              shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)
                  ),
              child: const Text('Bottom Navigation1', style: TextStyle(color: Colors.blue, fontSize: 16),),
            ),
            const SizedBox(height: 20,),
            MaterialButton(
              onPressed: () {
             Navigator.of(context).push(MaterialPageRoute(builder: (context) => const BottomNavyBarExample()));
              },
              color: Colors.white,
              shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)
                  ),
              child: const Text('Bottom Navigation inbuilt', style: TextStyle(color: Colors.blue, fontSize: 16),),
            ),
            const SizedBox(height: 20,),
            MaterialButton(
              onPressed: () {
             Navigator.of(context).push(_createRouteSlideRight());
              },
              color: Colors.white,
              shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)
                  ),
              child: const Text('Slide Transition', style: TextStyle(color: Colors.blue, fontSize: 16),),
            ),
            const SizedBox(height: 20,),
            MaterialButton(
              onPressed: () {
             Navigator.of(context).push(_scaleAndRotation());
              },
              color: Colors.white,
              shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)
                  ),
              child: const Text('Scale and Rotation Transition', style: TextStyle(color: Colors.blue, fontSize: 16),),
            ),
            const SizedBox(height: 20,),
            MaterialButton(
              onPressed: () {
             Navigator.of(context).push(MaterialPageRoute(builder: (context) => const BouncingWidgetExample()));
              },
              color: Colors.white,
              shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)
                  ),
              child: const Text('Bowuncing Widget', style: TextStyle(color: Colors.blue, fontSize: 16),),
            ),
            const SizedBox(height: 20,),
            MaterialButton(
              onPressed: () {
              //  Navigator.pushNamed(context, '/second');
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ImagerSliderHeroAnim()));
             // with transition animation
            // Navigator.of(context).push(_createRouteSlideRight());
              },
              color: Colors.white,
              shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)
                  ),
              child: const Text('ImagerSliderHeroAnim', style: TextStyle(color: Colors.blue, fontSize: 16),),
            ),
            const SizedBox(height: 20,),
            MaterialButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const AnimatedContainerEx()));
              },
              color: Colors.white,
              shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)
                  ),
              child: const Text('Animation1', style: TextStyle(color: Colors.blue, fontSize: 16),),
            ),
            const SizedBox(height: 20,),
            MaterialButton(
              onPressed: () {
             Navigator.of(context).push(MaterialPageRoute(builder: (context) => const AnimationControllerEx()));
              },
              color: Colors.white,
              shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)
                  ),
              child: const Text('Animation2', style: TextStyle(color: Colors.blue, fontSize: 16),),
            ),
            const SizedBox(height: 20,),
            MaterialButton(
              onPressed: () {
             Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SequenceAnimationEx()));
              },
              color: Colors.white,
              shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)
                  ),
              child: const Text('Animation3', style: TextStyle(color: Colors.blue, fontSize: 16),),
            ),
            const SizedBox(height: 20,),
            MaterialButton(
              onPressed: () {
             Navigator.of(context).push(MaterialPageRoute(builder: (context) => const AnimatedIconsEx()));
              },
              color: Colors.white,
              shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)
                  ),
              child: const Text('Animated Icons', style: TextStyle(color: Colors.blue, fontSize: 16),),
            ),
            const SizedBox(height: 20,),
            MaterialButton(
              onPressed: () {
             Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SwipeUpEx()));
              },
              color: Colors.white,
              shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)
                  ),
              child: const Text('Swipe Up', style: TextStyle(color: Colors.blue, fontSize: 16),),
            ),
             const SizedBox(height: 20,),
            MaterialButton(
              onPressed: () {
             Navigator.of(context).push(MaterialPageRoute(builder: (context) => const HttpGetEx()));
              },
              color: Colors.white,
              shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)
                  ),
              child: const Text('Api Basic', style: TextStyle(color: Colors.blue, fontSize: 16),),
            ),
            const SizedBox(height: 20,),
            MaterialButton(
              onPressed: () {
             Navigator.of(context).push(MaterialPageRoute(builder: (context) => const GoogleMapsEx()));
              },
              color: Colors.white,
              shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)
                  ),
              child: const Text('Api Basic2', style: TextStyle(color: Colors.blue, fontSize: 16),),
            ),
            const SizedBox(height: 20,),
            MaterialButton(
              onPressed: () {
            // Navigator.of(context).push(MaterialPageRoute(builder: (context) => TodoApp()));
              },
              color: Colors.white,
              shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)
                  ),
              child: const Text('Api Example', style: TextStyle(color: Colors.blue, fontSize: 16),),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.verified),
      ), 
    );
  }
}

Route _createRouteSlideRight() {
  return PageRouteBuilder(
    pageBuilder: ((context, animation, secondaryAnimation) => const SecondScreen()),
    transitionsBuilder: ((context, animation, secondaryAnimation, child) {
      const begin = Offset(-1.0, 0.0);
      const end = Offset.zero; // Offset(0.0, 0.0)
      const curve = Curves.ease;
      final tween = Tween(begin: begin, end: end);
      
      final screeenAnimation = animation.drive(tween);
      return SlideTransition(
        position: Tween<Offset>(begin: const Offset(-1, 0), end: Offset.zero).animate(animation),
        child: child,);
    })
  );
}

Route _scaleAndRotation() {
  return PageRouteBuilder(
    pageBuilder: ((context, animation, secondaryAnimation) => const SecondScreen()),
    transitionsBuilder: ((context, animation, secondaryAnimation, child) {      
      return ScaleTransition(
        scale: Tween<double>(begin: 0.0, end: 1.0).animate(animation), // scale takes Tween(double)
        child: RotationTransition(
          turns: Tween<double>(begin: 0.0, end: 1.0).animate(animation),
           child: child,),  // rotation takes Tween(double)
      );
    })
  );
}
