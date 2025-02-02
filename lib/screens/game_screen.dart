import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac_toe/provider/room_data_provider.dart';
import 'package:tic_tac_toe/resources/socket_methods.dart';
import 'package:tic_tac_toe/utils/widgets/scoreboard.dart';
import 'package:tic_tac_toe/utils/widgets/tic_tac_toe_board.dart';
import 'package:tic_tac_toe/utils/widgets/waiting_lobby.dart';

class GameScreen extends StatefulWidget {
  static const String routeName = '/game';
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  final SocketMethods _socketMethods = SocketMethods();

  @override
  void initState() {
    super.initState();
    _socketMethods.updateRoomListener(context);
    _socketMethods.updatePlayersStateListener(context);
    _socketMethods.pointIncreaseListener(context);
    _socketMethods.endGameListener(context);
  }

  @override
  Widget build(BuildContext context) {
    RoomDataProvider roomDataProvider = Provider.of<RoomDataProvider>(context);
    return Scaffold(
      body: roomDataProvider.roomData['isJoin']
          ? const WaitingLobby()
          : SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    const Scoreboard(),
                    const TicTacToeBoard(),
                    Text(
                        '${roomDataProvider.roomData['turn']['nickname']}\'s Turn')
                  ],
                ),
              ),
            ),
    );
  }
}
