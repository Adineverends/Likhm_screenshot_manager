import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:likhm/profile.dart';
import 'package:likhm/screen.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'cells.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    home: home(),
    debugShowCheckedModeBanner: false,
  ));
}

class home extends StatefulWidget {
  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  int selectedindex=0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.w600);
 final screen=[


  screenshot(),
   cell(),
   profile()


  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: screen[selectedindex],

      bottomNavigationBar: Container(
      decoration: BoxDecoration(
    color: Colors.white,
    boxShadow: [
    BoxShadow(
    blurRadius: 20,
    color: Colors.black.withOpacity(.1),
    )
    ],
    ),



        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              rippleColor: Colors.grey[300]!,
              hoverColor: Colors.grey[100]!,
              gap: 8,
              activeColor: Colors.black,
              iconSize: 24,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: Duration(milliseconds: 400),
              tabBackgroundColor: Colors.blue[100]!,
              color: Colors.black,
              tabs: [

                GButton(
                  icon: Icons.screenshot,
                  text: 'Screenshot',
                  textStyle: TextStyle(color: Colors.blue,fontSize: 17,fontWeight: FontWeight.normal),
                ),

                GButton(
                  icon: Icons.description,
                  text: 'Documents',
                  textStyle: TextStyle(color: Colors.blue,fontSize: 17,fontWeight: FontWeight.normal),
                ),
              GButton(
                icon: Icons.settings,
                text: 'Setting',
                textStyle: TextStyle(color: Colors.blue,fontSize: 17,fontWeight: FontWeight.normal),
              ),



              ],
              selectedIndex: selectedindex,
              onTabChange: (index) {
                setState(() {
                  selectedindex = index;
                });
              },
            ),
          ),
        ),


)
    );
  }
}

