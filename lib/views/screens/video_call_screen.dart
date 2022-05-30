import 'package:connectify/controllers/auth_controller.dart';
import 'package:flutter/material.dart';

import '../../controllers/jitsiMeet_controller.dart';
import '../../utilities/colors.dart';

class VideoCallScreen extends StatefulWidget {
  @override
  State<VideoCallScreen> createState() => _VideoCallScreenState();
}

class _VideoCallScreenState extends State<VideoCallScreen> {
  late TextEditingController meetingIdController;

  late TextEditingController nameController;

  final AuthController authController = AuthController();
  final JitsiMeetController jitsiController = JitsiMeetController();

  joinMeeting() {
    jitsiController.createMeeting(
      roomName: meetingIdController.text,
      isAudioMuted: true,
      isVideoMuted: true,
      username: nameController.text,
    );
  }

  @override
  void initState() {
    meetingIdController = TextEditingController();
    nameController =
        TextEditingController(text: authController.user!.displayName);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: backgroundColor,
          title: Text(
            'Join a Meeting',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            TextField(
              controller: meetingIdController,
              keyboardType: TextInputType.number,
              maxLines: 1,
              decoration: InputDecoration(
                fillColor: secondaryBackgroundColor,
                filled: true,
                border: InputBorder.none,
                hintText: 'Room ID',
                contentPadding: EdgeInsets.all(10),
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 15,
            ),
            TextField(
              controller: nameController,
              keyboardType: TextInputType.number,
              maxLines: 1,
              decoration: InputDecoration(
                fillColor: secondaryBackgroundColor,
                filled: true,
                border: InputBorder.none,
                hintText: 'User Name',
                contentPadding: EdgeInsets.all(10),
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            InkWell(
              onTap: joinMeeting,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Join',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ),
            )
          ],
        ));
  }
}
