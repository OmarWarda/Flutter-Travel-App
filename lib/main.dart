// ignore_for_file: prefer_const_constructors, unused_element, unused_import

import 'package:flutter/material.dart';
import 'package:travel_app/screens/activity_screen.dart';
import 'package:travel_app/screens/hotels_screen.dart';
import 'package:travel_app/widgets/custom_header.dart';
import 'package:travel_app/widgets/side_bar.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Travel App',
      // home: HotelsScreen(),
      initialRoute: '/activities',
      routes: {
        "/activities": (context) => ActivityScreen(),
        "/hotels": (context) => HotelsScreen(),
      },

      builder: (context, child) {
        return _TravelApp(
          navigator: GlobalKey<NavigatorState>(),
          child: Container(child: child),
        );
      },
    );
  }
}

class _TravelApp extends StatefulWidget {
  const _TravelApp({super.key, required this.navigator, required this.child});

  @override
  State<_TravelApp> createState() => _TravelAppState();

  final GlobalKey<NavigatorState> navigator;
  final Widget child;
}

class _TravelAppState extends State<_TravelApp> {
  bool isOnBoarding = true;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context)
        .size
        .height; // Used to access the dimensions of the used screen
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xFFF5EDDC),
      body: Row(
        children: [
          SideBar(
            height: height,
            width: width,
            navigator: widget.navigator,
          ),
          Expanded(child: widget.child),
        ],
      ),
    );
  }

// body: isOnBoarding
//           ? _buildOnBoarding(context)
//           : Row(
//               children: [
//                 SideBar(
//                   height: height,
//                   width: width,
//                   navigator: widget.navigator,
//                 ),
//                 Expanded(child: widget.child),
//               ],
//             ),

  // Column _buildOnBoarding(context) => Column(
  //       children: [
  //         Container(
  //           decoration: BoxDecoration(
  //             image:
  //                 DecorationImage(image: AssetImage('assets/background-2.jpg')),
  //           ),
  //         ),
  //       ],
  //     );
}

// asset('assets/background-2')