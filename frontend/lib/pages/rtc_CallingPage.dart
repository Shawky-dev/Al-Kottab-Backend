import 'package:flutter/material.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:frontend/services/rtc_signaling_service.dart';
import 'package:frontend/services/webrtc_service.dart';
import 'package:frontend/services/rtc_CalleeIncomingCallHandler.dart';
import 'package:frontend/services/rtc_CallerIncomingCallHandler.dart';

class CallingPage extends StatefulWidget {
  final String calleeName;
  final String callerUid;
  final String calleeUid;

  CallingPage({
    required this.calleeName,
    required this.callerUid,
    required this.calleeUid,
  });

  @override
  _CallingPageState createState() => _CallingPageState();
}

class _CallingPageState extends State<CallingPage> {
  late WebRTCService _webRTCService;
  late CallerCallHandler _callHandler;

  @override
  void initState() {
    super.initState();
    _webRTCService = WebRTCService(callerUid: widget.callerUid, calleeUid: widget.calleeUid);
    _callHandler = CallerCallHandler(_webRTCService);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calling Page'),
      ),
      body: Center(
        child: Text('Calling ${widget.calleeName}...'),
      ),
    );
  }
}