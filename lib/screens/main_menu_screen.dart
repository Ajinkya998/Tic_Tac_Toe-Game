import 'package:flutter/material.dart';
import 'package:tic_tac_toe/responsive/responsive.dart';
import 'package:tic_tac_toe/screens/create_room_screen.dart';
import 'package:tic_tac_toe/screens/join_room_screen.dart';
import 'package:tic_tac_toe/utils/widgets/custom_button.dart';

class MainMenuScreen extends StatelessWidget {
  static const String routeName = '/main-menu';
  const MainMenuScreen({super.key});

  TextSpan glowingText(String text, Color color) {
    return TextSpan(
      text: text,
      style: TextStyle(
        color: Colors.white,
        shadows: [
          Shadow(
            color: color,
            blurRadius: 10,
            offset: const Offset(3, 3),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Responsive(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Welcome to',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                RichText(
                  text: TextSpan(
                    style: const TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                    ),
                    children: [
                      glowingText("X", Colors.blue),
                      glowingText("O", Colors.red),
                      glowingText("X", Colors.blue),
                      glowingText("O", Colors.red),
                    ],
                  ),
                ),
                const Spacer(),
                CustomButton(
                    onTap: () {
                      Navigator.pushNamed(context, CreateRoomScreen.routeName);
                    },
                    title: "Create Room"),
                const SizedBox(height: 20),
                CustomButton(
                    onTap: () {
                      Navigator.pushNamed(context, JoinRoomScreen.routeName);
                    },
                    title: "Join Room"),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
