// ignore_for_file: prefer_const_constructors, avoid_print, prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:travel_app/screens/activity_screen.dart';
import 'package:travel_app/screens/hotels_screen.dart';

class SideBar extends StatefulWidget {
  const SideBar(
      {super.key,
      required this.height,
      required this.width,
      required this.navigator});

  final double height;
  final double width;
  final GlobalKey<NavigatorState> navigator;

  @override
  State<SideBar> createState() => _SideBarState();
}

List<Map> menu = [
  {'title': 'Activities', 'routeName': '/activities'},
  {'title': 'Hotels', 'routeName': '/hotels'},
  {'title': 'Flights', 'routeName': '/flights'},
  {'title': 'Restaurants', 'routeName': '/restaurants'}
];

List<Widget> screens = [ActivityScreen(), HotelsScreen()];

class _SideBarState extends State<SideBar> {
  int sideBarIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1000,
      width: widget.width * 0.2,
      color: Color(0xFF211955),
      child: Column(
        children: [
          SizedBox(
            height: widget.height * 0.05,
          ),
          ListView.builder(
              shrinkWrap: true,
              itemCount: menu.length,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return RotatedBox(
                    quarterTurns: 3,
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          sideBarIndex = index;
                          print(index);
                          print("Title: " + menu[index]['title']);
                          print("Route: " + menu[index]['routeName']);
                        });
                        // navigate to the new screen
                        widget.navigator.currentState
                            ?.pushNamed(menu[index]['routeName']);
                      },
                      style: TextButton.styleFrom(minimumSize: Size(100, 50)),
                      child: Text(
                        menu[index]['title'],
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontWeight: (index == sideBarIndex)
                                ? FontWeight.bold
                                : FontWeight.normal,
                            color: (index == sideBarIndex)
                                ? Colors.white
                                : Colors.white.withAlpha(200),
                            letterSpacing: 2),
                      ),
                    ));
              })
        ],
      ),
    );
  }
}
