import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:flutter_tts/flutter_tts.dart';

class VoiceControlApp extends StatefulWidget {
  @override
  _VoiceControlAppState createState() => _VoiceControlAppState();
}

class _VoiceControlAppState extends State<VoiceControlApp> {
  stt.SpeechToText _speech = stt.SpeechToText();
  FlutterTts _flutterTts = FlutterTts();
  bool _isListening = false;
  String _command = "Ucapkan sesuatu...";

  // mic -> spech to text -> python -> kamus data -> return hasilnya

  @override
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();
    _flutterTts = FlutterTts();
  }

  void _startListening() async {
    bool available = await _speech.initialize(
      onStatus: (status) => print('Status: $status'),
      onError: (error) => print('Error: $error'),
    );

    if (available) {
      setState(() => _isListening = true);
      _speech.listen(
        onResult: (result) {
          setState(() => _command = result.recognizedWords);
          _handleCommand(result.recognizedWords);
        },
      );
    }
  }

  void _stopListening() {
    _speech.stop();
    setState(() => _isListening = false);
  }

  void _handleCommand(String command) async {
    // if (command.contains('halo') || command.contains('hello')) {
    //   await _speak("Hello!");
    // } else if (command.contains('nyalakan lampu')) {
    //   //function nyalain lampu
    //   await _speak("Lampu telah dinyalakan.");
    // } else if (command.contains('sedih')) {
    //   await _speak("Memutar musik sedih dan menyesuaikan lampu.");
    // } else {
    //   await _speak("Perintah tidak dikenali.");
    // }

    //Panggil NLP
    String nlp = await callNLP(command);
    _speak(nlp);
  }

  Future<String> callNLP(String command) async {
    // call NLP
    // npl.process(onSuccess, onError)
    return 'Lampu Merah';
  }

  Future<void> _speak(String text) async {
    await _flutterTts.speak(text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Kontrol Suara Flutter')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_command, style: TextStyle(fontSize: 24)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _isListening ? _stopListening : _startListening,
              child: Text(_isListening ? 'Stop' : 'Mulai Mendengarkan'),
            ),
          ],
        ),
      ),
    );
  }
}
