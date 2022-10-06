import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';

class BottomNavyBarExample extends StatefulWidget {
  const BottomNavyBarExample({ Key? key }) : super(key: key);

  @override
  _BottomNavyBarExampleState createState() => _BottomNavyBarExampleState();
}

class _BottomNavyBarExampleState extends State<BottomNavyBarExample> {
  int _selectedIndex = 0;
  PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          children: <Widget>[
            _buildPage(
              icon: Icons.home,
              title: 'Home Page',
              color: Colors.red,
            ),
            _buildPage(
              icon: Icons.apps,
              title: 'Products',
              color: Colors.pink,
            ),
            _buildPage(
              icon: Icons.shop,
              title: 'Online Store',
              color: Colors.orange,
            ),
            _buildPage(
              icon: Icons.store,
              title: 'Shop Bills',
              color: Colors.blue,
            ),
            _buildPage(
              icon: Icons.search,
              title: 'Search',
              color: Colors.blue,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _selectedIndex,
        showElevation: false, 
        onItemSelected: (index) => setState(() {
          _selectedIndex = index;
          _pageController.animateToPage(index,
              duration: Duration(milliseconds: 300), curve: Curves.ease);
        }),
        items: [
          BottomNavyBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
            activeColor: Color.fromARGB(255, 129, 167, 19),
          ),
          BottomNavyBarItem(
              icon: Icon(Icons.apps),
              title: Text('Products'),
              activeColor: Colors.purpleAccent
          ),
          BottomNavyBarItem(
              icon: Icon(Icons.shop),
              title: Text('Online Store'),
              activeColor: Colors.pink
          ),
          BottomNavyBarItem(
              icon: Icon(Icons.store),
              title: Text('Shop Bills'),
              activeColor: Colors.blue
          ),
          BottomNavyBarItem(
              icon: Icon(Icons.search),
              title: Text('Search'),
              activeColor: Colors.blue
          )
        ],
      )
    );
  }

  _buildPage ({ IconData? icon, String? title, Color? color }) {
    return Container(
      color: color,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(icon, size: 200.0, color: Colors.white),
            Text(title!, style: TextStyle(color: Colors.white, fontSize: 20)),
          ],
        ),
      ),
    );
  }
}
