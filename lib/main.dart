import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:whatsapp_clone/screens/main-chat screen.dart';
import 'package:whatsapp_clone/screens/calls screen.dart';
import 'package:whatsapp_clone/screens/camera  screen.dart';
import 'package:whatsapp_clone/screens/settings%20screen.dart';
import 'package:whatsapp_clone/screens/status screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 3;
  List<Widget> rootes = [Status(), Calls(), Camera(), ChatsScreen(), Settings()];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: Colors.black,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Scaffold(
          backgroundColor:Colors.black,
          body: rootes.elementAt(_selectedIndex),
          bottomNavigationBar: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.visibility,
                  color: Colors.black
                  ,
                ),
                title: Text(
                  'Status',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.call,
                  color: Colors.black,
                ),
                title: Text(
                  'Calls',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.camera_alt,
                    color: Colors.black,
                  ),
                  title: Text(
                    'Camera',
                    style: TextStyle(color: Colors.black),
                  )),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.chat_bubble,
                  color: Colors.black,
                ),
                title: Text(
                  'Chats',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.settings,
                  color: Colors.black,
                ),
                title: Text(
                  'Settings',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
            selectedItemColor: Colors.red,
          ),
        ));
  }
}
