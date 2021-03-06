import 'package:connectify/controllers/auth_controller.dart';
import 'package:connectify/views/screens/widgets/meeting_option.dart';
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
  bool isAudioMuted = true;
  bool isVideoMuted = true;

  joinMeeting() {
    jitsiController.createMeeting(
      roomName: meetingIdController.text,
      isAudioMuted: isAudioMuted,
      isVideoMuted: isVideoMuted,
      username: nameController.text,
    );
  }

  @override
  void initState() {
    //called only once;used for 1 time initializations; used to initialize data that depends on a specific build context
    meetingIdController = TextEditingController();
    nameController =
        TextEditingController(text: authController.user!.displayName);
    // TODO: implement initState
    super.initState();
  }

  onAudioMuted(bool val) {
    setState(() {
      isAudioMuted = val;
    });
  }

  onVideoMuted(bool val) {
    setState(() {
      isVideoMuted = val;
    });
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
              keyboardType: TextInputType.name,
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
                padding: const EdgeInsets.all(15.0),
                child: Text('Join',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: buttonColor,
                    )),
              ),
            ),
            SizedBox(height: 20),
            MeetingOption(
                text: 'Mute Audio',
                isMuted: isAudioMuted,
                onChange: onAudioMuted),
            SizedBox(height: 15),
            MeetingOption(
                text: 'Turn Off Video',
                isMuted: isVideoMuted,
                onChange: onVideoMuted),
          ],
        ));
  }
}
