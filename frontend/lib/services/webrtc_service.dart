import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'rtc_signaling_service.dart';

class WebRTCService {
  late RTCPeerConnection _peerConnection;
  late SignalingService _signalingService;
  final String _callerUid;
  final String _calleeUid;

  WebRTCService({
    required String callerUid,
    required String calleeUid,
  })  : _callerUid = callerUid,
        _calleeUid = calleeUid;

  // Create an offer and send it to the callee
  Future<void> createOffer() async {
    final offer = await _peerConnection.createOffer();
    await _peerConnection.setLocalDescription(offer);
    _signalingService.sendOffer(_callerUid, _calleeUid, offer.toMap());
  }

  // Create an answer and send it to the caller
  Future<void> createAnswer() async {
    final answer = await _peerConnection.createAnswer(); 
    await _peerConnection.setLocalDescription(answer);
    _signalingService.sendAnswer(_callerUid, _calleeUid, answer.toMap());
  }

  // Listen for remote offer
  void listenForOffer(Function(RTCSessionDescription) onOfferReceived) {
    _signalingService.listenForOffers(_calleeUid).listen((data) {
      final offer = RTCSessionDescription.fromMap(data);
      onOfferReceived(offer);
    });
  }

  // Listen for remote answer
  void listenForAnswer(Function(RTCSessionDescription) onAnswerReceived) {
    _signalingService.listenForAnswers(_callerUid, _calleeUid).listen((data) {
      final answer = RTCSessionDescription.fromMap(data);
      onAnswerReceived(answer);
    });
  }

  // Listen for ICE candidates
  void listenForIceCandidates(Function(RTCIceCandidate) onCandidateReceived) {
    _signalingService.listenForIceCandidates(_callerUid, _calleeUid).listen((data) {
      final candidate = RTCIceCandidate.fromMap(data);
      onCandidateReceived(candidate);
    });
  }

  // Send ICE candidates
  void sendIceCandidate(RTCIceCandidate candidate) {
    _signalingService.sendIceCandidate(_callerUid, _calleeUid, candidate.toMap());
  }

  // Clean up
  void cleanup() {
    _signalingService.cleanup(_callerUid, _calleeUid);
    _peerConnection.close();
  }
}