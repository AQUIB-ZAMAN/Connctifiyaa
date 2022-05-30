import 'package:jitsi_meet/feature_flag/feature_flag.dart';
import 'package:jitsi_meet/jitsi_meet.dart';

import 'auth_controller.dart';

class JitsiMeetController {
  final AuthController authController = AuthController();

  createMeeting({
    required String roomName,
    required bool isAudioMuted,
    required bool isVideoMuted,
    String? username = '',
  }) async {
    try {
      FeatureFlag featureFlag = FeatureFlag();
      featureFlag.welcomePageEnabled = false;
      featureFlag.resolution = FeatureFlagVideoResolution
          .MD_RESOLUTION; // Limit video resolution to 360p

      if (username!.isEmpty) username = authController.user!.displayName;
      var options = JitsiMeetingOptions(room: roomName)
        ..userDisplayName = username
        ..userEmail = authController.user!.email
        ..userAvatarURL = authController.user!.photoURL // or .png
        ..audioMuted = isAudioMuted
        ..videoMuted = isVideoMuted;

      await JitsiMeet.joinMeeting(options);
    } catch (error) {
      print("error: $error");
    }
  }
}
