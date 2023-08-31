// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_local_variable

import 'package:flutter/material.dart';
import 'package:travel_app/widgets/custom_header.dart';

// import '../widgets/custom_header.dart';

class HotelsScreen extends StatelessWidget {
  const HotelsScreen({super.key});

  static const routeName = '/hotels';

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height; // Used to access the dimensions of the used screen
    double width = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50),
            CustomHeader(title: 'Hotels',),
          ],
        ),
      ),
    );
}
}

