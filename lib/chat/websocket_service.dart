import 'dart:convert';
import 'package:websocket/websocket.dart';

class WebSocketService {
  late WebSocket _webSocket;

  void connect(String url) async {
    _webSocket = await WebSocket.connect(url);
    _webSocket.listen((data) {
      print("Message received: $data");
    });
  }

  void sendMessage(String message) {
    _webSocket.add(message);
  }

  void disconnect() {
    _webSocket.close();
  }
}
