import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:http/http.dart' as http;

class NetworkConnection {
  NetworkConnection._();

  static final _instance = NetworkConnection._();

  static NetworkConnection get instance => _instance;

  final _connectivity = Connectivity();
  late Stream<bool>_statusStream;
  late StreamController<bool> _statusController;
  Stream<bool> get statusStream => _statusStream;

  final _controller = StreamController.broadcast();

    bool _isOnline = true;
    bool get isOnline => _isOnline; // Getter method to retrieve _isOnline status


  Stream get myStream => _controller.stream;

  void initialise() async {
    final List<ConnectivityResult> result = await (Connectivity().checkConnectivity());
    _checkStatus(result); 
    _connectivity.onConnectivityChanged.listen((result) {
      _checkStatus(result);
    });
  }

  void _checkStatus(List<ConnectivityResult> result) async {


    try {
      final result = await InternetAddress.lookup('google.com');
      _isOnline = result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      _isOnline = false;
    }
    
    if (_isOnline) {
      try {
        final response = await http.head(Uri.parse('https://google.com'));
        _isOnline = response.statusCode == 200;
      } catch (e) {
        _isOnline = false;
      }
    }
    _controller.sink.add({result: _isOnline});
  }

  void disposeStream() {
    _controller.close();
    _statusController.close();
  }
}