import 'dart:async';

import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

// Manejar estados del servidor
enum ServerStatus { Online, Offline, Connecting }

class SocketProvider with ChangeNotifier {
  ServerStatus _serverStatus = ServerStatus.Connecting;
  IO.Socket? _socket;

  get serverStatus => _serverStatus; // Par acceder a una propiedad privada hacemos un get
  get socket => _socket;

  SocketProvider() {
    _initConfig();
  }

  void _initConfig() {
    // Dart client
    _socket = IO.io('http://localhost:3001/', {
      'transports': ['websocket'],
      'autoConnect': true
    });

    _socket?.onConnect((_) {
      _serverStatus = ServerStatus.Online;
      notifyListeners(); // Para notificar que me he conectado
    });

    _socket?.onDisconnect((_) {
      _serverStatus = ServerStatus.Offline;
      notifyListeners(); // Notificar que se ha desconectado
    });

  }
}
