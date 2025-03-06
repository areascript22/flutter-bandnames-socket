import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

enum ServerStatus {
  online,
  offline,
  connecting,
}

class SocketService with ChangeNotifier {
  ServerStatus _serverStatus = ServerStatus.connecting;
  late IO.Socket _socket;

  ServerStatus get serverStatus => _serverStatus;
    IO.Socket get  socket => _socket;

  set serverStatus(ServerStatus value) {
    _serverStatus = value;
    notifyListeners();
  }

  SocketService() {
    _initConfig();
  }
  void _initConfig() {
// Dart client
    _socket = IO.io('http://192.168.0.106:3000/', {
      'transports': ['websocket'],
      'autoConnect': true,
    });
    _socket.onConnect((_) {
      print('connect');
      serverStatus = ServerStatus.online;
    });

    _socket.onDisconnect((_) {
      print('disconnect');
      serverStatus = ServerStatus.offline;
    });

    // socket.on('nuevo-mensaje', (payload) {
    //   print(
    //       "Nuevo mensaje ${payload.containsKey('name') ? payload['name'] : 'No name Field'}");
    // });
  }
}
