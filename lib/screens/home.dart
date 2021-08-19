import 'package:ehrmis/screens/components/bottomNavigation/transfer.dart';
import 'package:ehrmis/screens/components/bottomNavigation/dashboard.dart';
import 'package:ehrmis/screens/components/navigationDrawer/About.dart';
import 'package:ehrmis/screens/components/navigationDrawer/personalInfo.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ehrmis/screens/components/navigationDrawer/About.dart';

class HomeScreen extends StatefulWidget {
  static const String id = 'registration_screen';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  int _currentIndex = 0;
  final List pages = [
    Dashboard(),
    Transfer(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        // leading: IconButton(
        //   icon: CircleAvatar(
        //     backgroundColor: Colors.teal.shade800,
        //     child: CircleAvatar(
        //       backgroundColor: Colors.teal,
        //       radius: 18,
        //       child: Text(
        //         'J',
        //         style: TextStyle(color: Colors.teal.shade100, fontSize: 20),
        //       ),
        //     ),
        //   ),
        //   onPressed: () {
        //     _scaffoldKey.currentState.openDrawer();
        //   },
        // ),
        title: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Text(
            'Movies List',
            style: TextStyle(
                fontSize: 15,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold),
          ),
        ),
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  print("Notifications clicked");
                },
                child: Icon(
                  FontAwesomeIcons.bell,
                  size: 26.0,
                ),
              )),
        ],
        backgroundColor: Colors.teal,
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.teal.shade700,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      'Sign out',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white54,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: CircleAvatar(
                      backgroundColor: Colors.teal.shade800,
                      radius: 40,
                      child: CircleAvatar(
                        backgroundColor: Colors.teal,
                        radius: 39.5,
                        child: Text(
                          'S',
                          style: TextStyle(
                              color: Colors.teal.shade100, fontSize: 40),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Sayan Roy',
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
                title: Text(
                  'Personal Information',
                ),
                trailing: Icon(FontAwesomeIcons.idCard),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.pushNamed(context, PersonalInfoScreen.id);
                }),
            Divider(),
            ListTile(
              title: Text('Change password'),
              trailing: Icon(FontAwesomeIcons.userLock),
            ),
            ListTile(
              title: Text('Settings'),
              trailing: Icon(FontAwesomeIcons.cogs),
            ),
            Divider(),
            ListTile(
              title: Text('Help'),
              trailing: Icon(FontAwesomeIcons.questionCircle),
            ),
            ListTile(
                title: Text(
                  'About Company',
                ),
                trailing: Icon(FontAwesomeIcons.idCard),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.pushNamed(context, AboutScreen.id);
                }),
          ],
        ),
      ),
      body: pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.teal,
        type: BottomNavigationBarType.fixed,
        iconSize: 20,
        unselectedFontSize: 12,
        selectedFontSize: 12,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            title: Text('Dashboard'),
            backgroundColor: Colors.teal,
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.home),
            title: Text('Home'),
            backgroundColor: Colors.teal,
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.newspaper),
            title: Text('Trends'),
            backgroundColor: Colors.teal,
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
