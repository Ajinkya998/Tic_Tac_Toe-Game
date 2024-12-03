import 'package:flutter/material.dart';
import 'package:tic_tac_toe/models/players.dart';

class RoomDataProvider extends ChangeNotifier{
  Map<String, dynamic> _roomData = {};
  List<String> _displayElemens = ['', '', '', '','', '', '', '',''];
  int _filledBoxes = 0;
  Players _player1 = Players(nickname: '', socketID: '', points: 0, playerType: 'X');
  Players _player2 = Players(nickname: '', socketID: '', points: 0, playerType: 'O');

  Map<String, dynamic> get roomData => _roomData;
  List<String> get displayElements => _displayElemens;
  int get filledBoxes => _filledBoxes;
  Players get player1 => _player1;
  Players get player2 => _player2;

  void updateRoomData(Map<String, dynamic> data){
    _roomData = data;
    notifyListeners();
  }

  void updatePlayer1(Map<String, dynamic> player1Data){
    _player1 = Players.fromMap(player1Data);
    notifyListeners();
  }

  void updatePlayer2(Map<String, dynamic> player2Data){
    _player2 = Players.fromMap(player2Data);
    notifyListeners();
  }

  void updateDisplayElements(int index, String choice){
    _displayElemens[index] = choice;
    _filledBoxes += 1;
    notifyListeners();
  }

  void setFilledBoxesto0(){
    _filledBoxes = 0;
    notifyListeners();
  }
}