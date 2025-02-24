import 'package:frontend/services/webrtc_service.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';

class CalleeIncomingCallHandler {
  final WebRTCService _webRTCService;

  CalleeIncomingCallHandler(this._webRTCService) {
    _webRTCService.listenForOffer((offer) async {
      // Handle the received offer
      await _webRTCService.setRemoteDescription(offer);
      await _webRTCService.createAnswer();
    });

    _webRTCService.listenForIceCandidates((RTCIceCandidate candidate) async{
      await _webRTCService.addIceCandidate(candidate);
    });
  }
}