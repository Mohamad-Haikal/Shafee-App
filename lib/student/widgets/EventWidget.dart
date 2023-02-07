// ignore_for_file: file_names

import 'package:flutter/material.dart';

import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shafee_app/resources.dart';
import 'package:shafee_app/student/widgets/BackgroundWidget.dart';

class EventsCard extends StatefulWidget {
  final String eventName;
  final String eventMonth;
  final String eventDay;
  final String eventDayName;
  final String eventTime;
  final String eventLocation;
  final Color backgroundColor;
  const EventsCard({
    Key? key,
    required this.eventName,
    required this.eventTime,
    required this.eventDay,
    required this.eventDayName,
    required this.eventMonth,
    required this.eventLocation,
    required this.backgroundColor,
  }) : super(key: key);

  @override
  State<EventsCard> createState() => _EventsCardState();
}

class _EventsCardState extends State<EventsCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25.sp),
      ),
      color: widget.backgroundColor,
      margin: EdgeInsets.symmetric(vertical: 15.sp),
      elevation: 10,
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(25.sp), bottomLeft: Radius.circular(25.sp)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.eventMonth,
                    style: TextStyle(fontSize: 17.sp),
                  ),
                  Text(widget.eventDay, style: TextStyle(fontSize: 27.sp, fontWeight: FontWeight.w900)),
                  Text(widget.eventDayName, style: TextStyle(fontSize: 17.sp)),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 7,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 3.h, horizontal: 5.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 3,
                    child: Text(
                      widget.eventName,
                      style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w700, color: const Color.fromARGB(255, 236, 230, 247)),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 2.0.w),
                          child: const Icon(
                            Icons.access_time_outlined,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          widget.eventTime,
                          style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w400, color: const Color.fromARGB(255, 236, 230, 247)),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 2.0.w),
                          child: const Icon(Icons.location_on, color: Colors.white),
                        ),
                        Text(
                          widget.eventLocation,
                          style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w400, color: const Color.fromARGB(255, 236, 230, 247)),
                          maxLines: 2,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
