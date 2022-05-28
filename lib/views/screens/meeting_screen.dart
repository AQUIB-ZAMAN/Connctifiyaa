import 'package:connectify/views/screens/widgets/reuseable_icon.dart';
import 'package:flutter/material.dart';

class MeetingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              ReuseableIcon(
                  icon: Icons.videocam,
                  text: "New Meeting",
                  onPressed: () {
                    print("New meeting");
                  }),
              ReuseableIcon(
                  icon: Icons.add_box_rounded,
                  text: "Join Meeting",
                  onPressed: () {
                    print("New meeting");
                  }),
              ReuseableIcon(
                  icon: Icons.calendar_today,
                  text: "Schedule",
                  onPressed: () {
                    print("New meeting");
                  }),
              ReuseableIcon(
                  icon: Icons.arrow_upward_rounded,
                  text: 'Share Screen',
                  onPressed: () {
                    print("New meeting");
                  }),
            ],
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          ),
          Expanded(
            child: Center(
              child: Text('Create/Join meetings with just a click'),
            ),
          )
        ],
      ),
    );
  }
}
