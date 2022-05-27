import 'package:flutter/material.dart';

import '../../controllers/auth_controller.dart';
import './widgets/custom_button.dart';
import 'home_screen.dart';

class LoginScreen extends StatelessWidget {
  final AuthController authController = AuthController();
  LoginScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Start or join a meeting...',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Image.asset('assets/images/onboarding.jpg'),
          ),
          CustomButton(
            text: 'Login With Google',
            onPressed: () {
              authController.signInWithGoogle();
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (BuildContext context) {
                return HomeScreen();
              }));
            },
          ),
        ],
      ),
    );
  }
}
