import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:testvidio/CallPage.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  TextEditingController callIdController = TextEditingController();
  TextEditingController userIdController = TextEditingController();
  TextEditingController userNameController = TextEditingController();

  Future<void> _requestPermissions() async {
    await [
      Permission.camera,
      Permission.microphone,
    ].request();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width / 2,
              child: TextFormField(
                controller: callIdController,
                decoration: const InputDecoration(
                  hintText: "Please enter call ID",
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 2,
              child: TextFormField(
                controller: userIdController,
                decoration: const InputDecoration(
                  hintText: "Please enter user ID",
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 2,
              child: TextFormField(
                controller: userNameController,
                decoration: const InputDecoration(
                  hintText: "Please enter username",
                ),
              ),
            ),
            TextButton(
              onPressed: () async {
                await _requestPermissions();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CallPage(
                      callID: callIdController.text,
                      userID: userIdController.text,
                      username: userNameController.text,
                    ),
                  ),
                ).then((_) {
                  // This code block executes when the CallPage is closed
                  // You can navigate back or perform any other actions here
                  Navigator.pop(context); // Navigate back when the call ends
                });
              },
              child: Text("Join the call"),
            ),
          ],
        ),
      ),
    );
  }
}
