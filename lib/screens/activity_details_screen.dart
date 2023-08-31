// ignore_for_file: prefer_const_constructors, unused_local_variable, sort_child_properties_last, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:travel_app/models/activity_model.dart';
import 'package:travel_app/widgets/clipped_container.dart';

class ActivityScreenDetail extends StatelessWidget {
  const ActivityScreenDetail({
    super.key,
    required this.activity,
  });

  final Activity activity;
  @override
  Widget build(BuildContext context) {
    List<Activity> activities = Activity.activities;

    return Column(
      children: [
        _ActivtiyImage(activity: activity),
        ActivtyInformation(activity: activity)
      ],
    );
  }
}

class ActivtyInformation extends StatelessWidget {
  const ActivtyInformation({super.key, required this.activity});

  final Activity activity;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20, bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            activity.title,
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          ),
          RatingBar.builder(
            initialRating: 3,
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemBuilder: (context, _) => Icon(
              Icons.star,
              color: Colors.amber,
            ),
            onRatingUpdate: (rating) {},
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'About',
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            activity.description,
            textAlign: TextAlign.justify,
            style: Theme.of(context).textTheme.bodySmall,
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '\$${activity.price}',
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text(
                  'Book Now',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xFF231955),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
              ),
              // ElevatedButton(
              //   onPressed: () {
              //     Navigator.pop(context);
              //   },
              //   child: Text(
              //     'Back',
              //     style: Theme.of(context)
              //         .textTheme
              //         .bodyMedium!
              //         .copyWith(color: Colors.white),
              //   ),
              //   style: ElevatedButton.styleFrom(
              //     primary: const Color(0xFF231955),
              //     shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(15.0),
              //     ),
              //   ),
              // )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Back',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: const Color(0xFF231955),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _ActivtiyImage extends StatelessWidget {
  const _ActivtiyImage({
    super.key,
    required this.activity,
  });

  final Activity activity;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      ClippedContainer(
          height: 365), // height of image 300 wa hena 325 m3naha el curve 25 bs
      Hero(
        tag: '${activity.id}_${activity.title}',
        child: ClippedContainer(imageUrl: activity.imageUrl),
      ),
    ]);
  }
}
