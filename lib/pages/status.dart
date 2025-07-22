import 'package:band_names/providers/socket_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StatusPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Instancia de socket provider
    final socketProvider = Provider.of<SocketProvider>(context);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text('Server Status: ${socketProvider.serverStatus}')],
        ),
      ),
      floatingActionButton: FloatingActionButton( // Emitir un mensaje al tocar el FloatingActionBoton
        child: Icon(Icons.message),
        onPressed: () {
          // TAREA
          socketProvider.socket.emit('emitir-mensaje', {
            'nombre': 'Flutter',
            'mensaje': 'Hola desde Flutter'
          });
        },
      ),
    );
  }
}
