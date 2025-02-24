import 'package:flutter/material.dart';
import 'package:frontend/services/authServices.dart';
import 'package:frontend/services/webrtc_service.dart';
import 'package:frontend/services/rtc_CalleeIncomingCallHandler.dart';

class Calleepage extends StatefulWidget {
  @override
  _CalleePageState createState() => _CalleePageState();
}

class _CalleePageState extends State<Calleepage> {
  late WebRTCService _webRTCService;
  late CalleeIncomingCallHandler _calleeIncomingCallHandler;
  final AuthServices _authServices = AuthServices();

  @override
  void initState() {
    super.initState();
    final calleeUid = _authServices.getCurrentUserUid();
    if(calleeUid != null){
      _webRTCService = WebRTCService(callerUid: '', calleeUid: calleeUid);
      _calleeIncomingCallHandler = CalleeIncomingCallHandler(_webRTCService);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Callee Page'),
      ),
      body: Center(
        child: Text('Waiting for calls...'),
      ),
    );
  }
}