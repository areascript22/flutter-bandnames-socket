import 'package:band_names/services/socket_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StatusPage extends StatelessWidget {
  const StatusPage({super.key});

  @override
  Widget build(BuildContext context) {
    final socketService = Provider.of<SocketService>(context);
    // socketService.socket.emit();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Status page"),
      ),
      body: Center(
        child: Column(
          children: [Text("Server staus: ${socketService.serverStatus} ")],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.message),
          onPressed: () {
            //emitir Map
            socketService.socket.emit("emitir-mensaje", {
              'nombre': 'Flutter',
              'mensaje': 'Hola desde Flutter',
            });
          }),
    );
  }
}
