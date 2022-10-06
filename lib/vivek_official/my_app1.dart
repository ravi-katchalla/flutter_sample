import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_sample/vivek_official/onboarding/common/dot_indicator.dart';
import 'package:flutter_sample/vivek_official/onboarding/widgets/login_bottom_widget.dart';
import 'package:flutter_sample/vivek_official/onboarding/widgets/page_item.dart';
import 'package:flutter_sample/vivek_official/providers/data_provider.dart';
import 'package:flutter_sample/vivek_official/screens/otp_verification_screen.dart';
import 'package:flutter_sample/vivek_official/screens/sample_api/sample_fetch_list.dart';
import 'package:flutter_sample/vivek_official/screens/sample_api/sample_form.dart';
import 'package:flutter_sample/vivek_official/screens/vertical_horizontal_scroll_screen2.dart';

class MyApp1 extends StatelessWidget {
  const MyApp1({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DataProvider(),
      child: MaterialApp(
        title: 'Zadinga Sample',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
          fontFamily: 'OpenSans',
          textTheme: ThemeData.light().textTheme.copyWith(
                bodyText1: const TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
                bodyText2: const TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 12,
                ),
                button: const TextStyle(color: Colors.white),
              ),
        ),
        home: const VerticalHorizontalScrollScreen(),
        routes: {
          OtpVerificationScreen.routeName: (context) => OtpVerificationScreen(),
          UserInputForm.routname: (context) => UserInputForm(),
          SampleListDataScreen.routname: (context) => SampleListDataScreen(),
        },
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _current_page = 0;
  final PageController _pageController = PageController();
  static const _kDuration = Duration(milliseconds: 300);

  static const _kCurve = Curves.ease;
  final List<Widget> _list = <Widget>[
    const PageItem(
      title: 'Manage inventory',
      description:
          'Digital stock management made easy with barcode scan and ready-made catalogs',
      image: 'assets/images/p1.svg',
    ),
    const PageItem(
      title: 'Take your store online',
      description:
          'Sell your stock online to your customers through your own website',
      image: 'assets/images/p2.svg',
    ),
    const PageItem(
      title: 'Multiple payment options',
      description:
          'Collect payments through UPI, Online payment or share your own payment link',
      image: 'assets/images/p3.svg',
    ),
    const PageItem(
      title: 'Deliver to door steps',
      description:
          'Deliver orders to your customer’s doorsteps with our delivery partners',
      image: 'assets/images/p4.svg',
    ),
  ];

  void _setPagePosition(int position) {
    setState(() {
      _current_page = position;
    });
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                color: Color(0xfffe5e5e5),
                margin: EdgeInsets.only(top: mediaQuery.padding.top),
                width: double.infinity,
                child: Image.asset(
                  'assets/images/leafs.png',
                ),
              ),
              Flexible(
                fit: FlexFit.loose,
                child: Container(
                  height:
                      (mediaQuery.size.height - mediaQuery.padding.top - 80) *
                          0.7,
                  color: Color(0xfffe5e5e5),
                  child: Stack(
                    children: [
                      PageView(
                        controller: _pageController,
                        children: _list,
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        onPageChanged: (i) => {_setPagePosition(i)},
                      ),
                      Positioned(
                        bottom: 0.0,
                        left: 0.0,
                        right: 0.0,
                        child: Container(
                          padding: const EdgeInsets.all(10.0),
                          child: Center(
                            child: DotsIndicator(
                              controller: _pageController,
                              itemCount: _list.length,
                              onPageSelected: (int page) {
                                _pageController.animateToPage(
                                  page,
                                  duration: _kDuration,
                                  curve: _kCurve,
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              LoginBottomBar(),
            ],
          ),
        ),
      ),

      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
