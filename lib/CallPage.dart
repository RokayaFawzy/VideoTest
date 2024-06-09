import 'package:flutter/material.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

class CallPage extends StatelessWidget {
  const CallPage({
    Key? key,
    required this.callID,
    required this.userID,
    required this.username,
  }) : super(key: key);

  final String callID;
  final String userID;
  final String username;

  @override
  Widget build(BuildContext context) {
    return ZegoUIKitPrebuiltCall(
      appID: 1407772730, // Your App ID
      appSign: '82f7b9ff8cfdc55e850f51f7d90ec8803d0cd67cb670b4bffd5e8e4aecdb386f', // Your App Sign
      userID: userID,
      userName: username,
      callID: callID,
      config: ZegoUIKitPrebuiltCallConfig.oneOnOneVideoCall(),
    );
  }
}
