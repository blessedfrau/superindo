import 'package:badges/badges.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:superindo/cubit/getdata_cubit.dart';
import 'package:superindo/screen/home.dart';
import 'package:superindo/screen/profile.dart';
import 'package:superindo/screen/search.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider<GetDataCubit>(
        create: (BuildContext context) => GetDataCubit(),
        child: const InitialPage(),
      ),
    );
  }
}

class InitialPage extends StatefulWidget {
  const InitialPage({Key? key}) : super(key: key);

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    Search(),
    Profile(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.red[700],
          centerTitle: true,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Superindo Shop',
                style: GoogleFonts.lobster(
                  fontSize: 20,
                ),
              ),
              Badge(
                  badgeContent: Text(
                    '2',
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.red[700],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  badgeColor: Colors.white,
                  child: const Icon(Icons.shopping_cart))
            ],
          )),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      extendBody: true,
      bottomNavigationBar: DotNavigationBar(
        paddingR: const EdgeInsets.only(
          left: 5,
          right: 5,
          bottom: 5,
        ),
        enablePaddingAnimation: true,
        items: [
          DotNavigationBarItem(
            icon: const Icon(Icons.home),
          ),
          DotNavigationBarItem(
            icon: const Icon(Icons.search),
          ),
          DotNavigationBarItem(
            icon: const Icon(Icons.person),
          ),
        ],
        currentIndex: _selectedIndex,
        backgroundColor: Colors.red[700],
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey[350],
        onTap: _onItemTapped,
      ),
    );
  }
}
