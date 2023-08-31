// ignore_for_file: prefer_const_constructors
//widget that contains the title of the screen and welcome sentence
import 'package:flutter/material.dart';

class CustomHeader extends StatelessWidget {
  const CustomHeader({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(fontWeight: FontWeight.bold)),
          SizedBox(height: 5),
          Text('Enjoy your holiday in Italy',
              style: Theme.of(context).textTheme.bodyLarge),
          SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
