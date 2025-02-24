import 'package:frontend/services/webrtc_service.dart';
import 'rtc_signaling_service.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';

class CallerCallHandler {
  final WebRTCService _webRTCService;
  CallerCallHandler(this._webRTCService){
    _webRTCService.listenForAnswer((Answer) async {
      await _webRTCService.setRemoteDescription(Answer); 
    });
    _webRTCService.listenForIceCandidates((RTCIceCandidate candidate) async{
      await _webRTCService.addIceCandidate(candidate);
    });
  }
}