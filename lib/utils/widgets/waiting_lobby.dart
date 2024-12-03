import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac_toe/provider/room_data_provider.dart';
import 'package:tic_tac_toe/utils/widgets/custom_textfield.dart';

class WaitingLobby extends StatefulWidget {
  const WaitingLobby({super.key});

  @override
  State<WaitingLobby> createState() => _WaitingLobbyState();
}

class _WaitingLobbyState extends State<WaitingLobby> {
  late TextEditingController gameIdController;
  @override
  void initState() {
    super.initState();
    gameIdController = TextEditingController(
        text: Provider.of<RoomDataProvider>(context, listen: false)
            .roomData["_id"]);
  }

  @override
  void dispose() {
    super.dispose();
    gameIdController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Waiting for the player to join...",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white60),
            ),
            const SizedBox(height: 25),
            CustomTextfield(
                controller: gameIdController, hintText: '', isReadOnly: true)
          ],
        ),
      ),
    );
  }
}
