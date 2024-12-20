import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class WebSocketPage extends StatelessWidget {
  final channel = WebSocketChannel.connect(
    Uri.parse('wss://echo.websocket.events'),
    // Uri.parse('wss://echo.websocket.org/ws'),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WebSocket Example'),
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder(
              stream: channel.stream,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return const Text('Connecting...');
                } else if (snapshot.hasData) {
                  return Text('Received: ${snapshot.data}');
                }
                return const Text('No data');
              },
            ),
          ),
          TextField(
            onSubmitted: (message) {
              channel.sink.add(message);
            },
            decoration: const InputDecoration(
              labelText: 'Send a message',
              border: OutlineInputBorder(),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    channel.sink.close();
    // super.dispose();
  }
}
