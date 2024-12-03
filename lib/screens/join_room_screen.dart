import 'package:flutter/material.dart';
import 'package:tic_tac_toe/resources/socket_methods.dart';

import '../responsive/responsive.dart';
import '../utils/widgets/custom_button.dart';
import '../utils/widgets/custom_textfield.dart';

class JoinRoomScreen extends StatefulWidget {
  static const String routeName = '/join-room';
  const JoinRoomScreen({super.key});

  @override
  State<JoinRoomScreen> createState() => _JoinRoomScreenState();
}

class _JoinRoomScreenState extends State<JoinRoomScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController gameIdController = TextEditingController();
  SocketMethods _socketMethods = SocketMethods();

  @override
  void initState() {
    super.initState();
    _socketMethods.joinRoomSuccessListener(context);
    _socketMethods.errorOccurredListener(context);
    _socketMethods.updatePlayersStateListener(context);
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    gameIdController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Responsive(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Join Room",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Join a Tic-Tac-Toe game room with your friends! Enter the unique room code to start playing.",
                  style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                      fontStyle: FontStyle.italic),
                ),
                const SizedBox(height: 32),
                CustomTextfield(
                    controller: nameController,
                    hintText: "Enter your NickName"),
                const SizedBox(height: 20),
                CustomTextfield(
                    controller: gameIdController, hintText: "Enter Game ID"),
                const SizedBox(height: 35),
                CustomButton(
                    onTap: () => _socketMethods.joinRoom(
                        nameController.text, gameIdController.text),
                    title: "Join"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
