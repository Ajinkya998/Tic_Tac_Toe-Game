import 'package:flutter/material.dart';
import 'package:tic_tac_toe/resources/socket_methods.dart';
import 'package:tic_tac_toe/responsive/responsive.dart';
import 'package:tic_tac_toe/utils/widgets/custom_button.dart';
import 'package:tic_tac_toe/utils/widgets/custom_textfield.dart';

class CreateRoomScreen extends StatefulWidget {
  static const String routeName = '/create-room';
  const CreateRoomScreen({super.key});

  @override
  State<CreateRoomScreen> createState() => _CreateRoomScreenState();
}

class _CreateRoomScreenState extends State<CreateRoomScreen> {
  final TextEditingController nameController = TextEditingController();
  final SocketMethods _socketMethods = SocketMethods();

  @override
  void initState() {
    super.initState();
    _socketMethods.createRoomSuccessListener(context);
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
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
                  "Create Room",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Create a room to host your own Tic-Tac-Toe game and invite friends to join with a unique room code.",
                  style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                      fontStyle: FontStyle.italic),
                ),
                const SizedBox(height: 32),
                CustomTextfield(
                    controller: nameController,
                    hintText: "Enter your NickName"),
                const SizedBox(height: 35),
                CustomButton(
                    onTap: () {
                      _socketMethods.createRoom(nameController.text);
                    },
                    title: "Create"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
