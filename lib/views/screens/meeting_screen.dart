import 'dart:math';

import 'package:connectify/views/screens/video_call_screen.dart';
import 'package:connectify/views/screens/widgets/reuseable_icon.dart';
import 'package:flutter/material.dart';

import '../../controllers/jitsiMeet_controller.dart';

class MeetingScreen extends StatefulWidget {
  @override
  State<MeetingScreen> createState() => _MeetingScreenState();
}

class _MeetingScreenState extends State<MeetingScreen> {
  final JitsiMeetController jitsiController = JitsiMeetController();

  createNewMeeting() {
    var random = Random();
    String roomName = (random.nextInt(10000000) + 10000000).toString();
    jitsiController.createMeeting(
      roomName: roomName,
      isAudioMuted: true,
      isVideoMuted: true,
    );
  }

  joinMeeting(){
    Navigator.of(context).push(MaterialPageRoute(builder: (context){
      return VideoCallScreen();
    })
    )
  }

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
                onPressed: createNewMeeting,
              ),
              ReuseableIcon(
                  icon: Icons.add_box_rounded,
                  text: "Join Meeting",
                  onPressed: joinMeeting,
              ),
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
