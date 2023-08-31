// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_local_variable, sort_child_properties_last, unused_import, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:travel_app/models/activity_model.dart';
import 'package:travel_app/screens/activity_details_screen.dart';
import 'package:travel_app/widgets/custom_header.dart';
import 'package:travel_app/widgets/side_bar.dart';

class ActivityScreen extends StatelessWidget {
  const ActivityScreen({super.key});

  static const routeName = '/activities';

  @override
  Widget build(BuildContext context) {
    List<Activity> activities = Activity.activities;

    double height = MediaQuery.of(context)
        .size
        .height; // Used to access the dimensions of the used screen
    double width = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50),
            CustomHeader(
              title: 'Activities',
            ),
            _ActivitiesGrid(width: width, activities: activities)
          ],
        ),
      ),
    );
  }
}

class _ActivitiesGrid extends StatelessWidget {
  const _ActivitiesGrid({
    super.key,
    this.masonryListHeight = const [200, 250, 300],
    required this.width,
    required this.activities,
  });

  final double width;
  final List<double> masonryListHeight;
  final List<Activity> activities;

  @override
  Widget build(BuildContext context) {
    return MasonryGridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.all(10.0),
      itemCount: 9,
      crossAxisCount: 2,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      itemBuilder: (context, index) {
        Activity activity = activities[index];
        return InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ActivityScreenDetail(
                          activity: activity,
                        )));
          },
          child: Column(
            children: [
              Hero(
                tag: '${activity.id}_${activity.title}',
                child: Container(
                  height: masonryListHeight[index % 3],
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          image: NetworkImage(activity.imageUrl),
                          fit: BoxFit.cover)),
                ),
              ),
              Text(activity.title,
                  maxLines: 3,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: Colors.black, fontWeight: FontWeight.bold)),
            ],
          ),
        );
      },
    );
  }
}
