import 'package:ehrmis/screens/components/navigationDrawer/personalInfo/experience.dart';
import 'package:ehrmis/screens/components/navigationDrawer/personalInfo/language.dart';
import 'package:flutter/material.dart';
import 'personalInfo/basic.dart';
import 'personalInfo/address.dart';
import 'personalInfo/contact.dart';

class PersonalInfoScreen extends StatefulWidget {
  static const String id = 'info';
  @override
  _PersonalInfoScreenState createState() => _PersonalInfoScreenState();
}

class _PersonalInfoScreenState extends State<PersonalInfoScreen>
    with SingleTickerProviderStateMixin {
  TabController controller;
  @override
  void initState() {
    super.initState();
    controller = new TabController(length: 10, vsync: this);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            'PERSONAL INFORMATION',
            style: TextStyle(
              fontSize: 15,
            ),
          ),
          backgroundColor: Colors.teal,
          bottom: new TabBar(
              labelStyle: TextStyle(fontSize: 12.0),
              isScrollable: true,
              indicatorColor: Colors.white,
              labelColor: Colors.white,
              unselectedLabelColor: Colors.white70,
              controller: controller,
              tabs: <Widget>[
                new Tab(
                  text: 'Basic',
                ),
                new Tab(
                  text: 'Address',
                ),
                new Tab(
                  text: 'Contact',
                ),
                new Tab(
                  text: 'Qualification',
                ),
                new Tab(
                  text: 'Experience',
                ),
                new Tab(
                  text: 'Awards',
                ),
                new Tab(
                  text: 'Langauge',
                ),
                new Tab(
                  text: 'Family',
                ),
                new Tab(
                  text: 'Nomination',
                ),
                new Tab(
                  text: 'Training',
                ),
              ])),
      body: TabBarView(controller: controller, children: <Widget>[
        Basic(),
        Address(),
        Mycontact(),
        Basic(),
        Myexperience(),
        Basic(),
        Mylangauge(),
        Basic(),
        Basic(),
        Basic(),
      ]),
    );
  }
}
