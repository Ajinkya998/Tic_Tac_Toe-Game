import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac_toe/provider/room_data_provider.dart';
import 'package:tic_tac_toe/resources/socket_methods.dart';

class TicTacToeBoard extends StatefulWidget {
  const TicTacToeBoard({super.key});

  @override
  State<TicTacToeBoard> createState() => _TicTacToeBoardState();
}

class _TicTacToeBoardState extends State<TicTacToeBoard> {
  SocketMethods _socketMethods = SocketMethods();

  void tapped(int index, RoomDataProvider roomDataProvider) {
    _socketMethods.tapGrid(index, roomDataProvider.roomData['_id'],
        roomDataProvider.displayElements);
  }

  @override
  void initState() {
    super.initState();
    _socketMethods.tappedListener(context);
  }

  @override
  Widget build(BuildContext context) {
    RoomDataProvider roomDataProvider = Provider.of<RoomDataProvider>(context);
    final size = MediaQuery.sizeOf(context);
    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: size.height * 0.7, maxWidth: 500),
      child: AbsorbPointer(
        absorbing: roomDataProvider.roomData['turn']['socketID'] !=
            _socketMethods.socketClient.id,
        child: GridView.builder(
          itemCount: 9,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => tapped(index, roomDataProvider),
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white24),
                ),
                child: AnimatedSize(
                  duration: const Duration(microseconds: 200),
                  child: Text(
                    roomDataProvider.displayElements[index],
                    style: TextStyle(
                      fontSize: 80,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      shadows: [
                        BoxShadow(
                            color:
                                roomDataProvider.displayElements[index] == 'O'
                                    ? Colors.red
                                    : Colors.blue,
                            blurRadius: 40),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
