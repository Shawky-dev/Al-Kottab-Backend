import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'rtc_signaling_service.dart';
import 'rtc_CalleeIncomingCallHandler.dart';

//implement getUserMedia here 
class WebRTCService {
  late RTCPeerConnection _peerConnection;
  final SignalingService _signalingService = SignalingService();
  final String _callerUid;
  final String _calleeUid;

  WebRTCService({
    required String callerUid,
    required String calleeUid,
  })  : _callerUid = callerUid,
        _calleeUid = calleeUid {
    _initializePeerConnection();
  }

  Future<void> _initializePeerConnection() async {
    // Configuration for the peer connection
    final configuration = {
      'iceServers': [
        {'urls': 'stun:stun.l.google.com:19302'},
      ]
    };

    // Create the peer connection
    _peerConnection = await createPeerConnection(configuration);

    // every time a new ice candidate is found, 
    //it is immediately sent to the remote peer.
    _peerConnection.onIceCandidate = (RTCIceCandidate candidate) {
      _signalingService.sendIceCandidate(_callerUid, _calleeUid, candidate.toMap());
    };

    _peerConnection.onIceConnectionState = (RTCIceConnectionState state) {
      print('ICE connection state: $state');
    };

    _peerConnection.onAddStream = (MediaStream stream) {
      print('Add stream: ${stream.id}');
    };

    _peerConnection.onRemoveStream = (MediaStream stream) {
      print('Remove stream: ${stream.id}');
    };
  }

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
      //converts the recieved map into an RTCSessionDescription object.
      final offer = RTCSessionDescription.fromMap(data);
      onOfferReceived(offer);
    });
  }

  // Listen for remote answer
  void listenForAnswer(Function(RTCSessionDescription) onAnswerReceived) {
    _signalingService.listenForAnswers(_callerUid, _calleeUid).listen((data) {
      final answer = RTCSessionDescription.fromMap(data);
      //this is a callback function that allows the caller 
      //of the listenForAnswer method to define custom behavior
      //for handling the recieved answer. 
      //(see rtc_CallinPage.dart _listenForAnswers method) 
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

  //Public method to set the remote description
  Future<void> setRemoteDescription(RTCSessionDescription description) async {
    await _peerConnection.setRemoteDescription(description);
  }

  Future<void> addIceCandidate(RTCIceCandidate candidate) async {
    await _peerConnection.addCandidate(candidate);
  }

  Future<MediaStream> openMediaDevices(constraints) async {
    return await navigator.mediaDevices.getUserMedia(constraints);
  }
  
Future<List<MediaDeviceInfo>> getConnectedMicrophones() async {
    final allMics = await navigator.mediaDevices.enumerateDevices();
    return allMics.where((mic) => mic.kind == 'audioinput').toList();
  }

  Future<List<MediaDeviceInfo>?> updateMicsList() async{
    List<MediaDeviceInfo> allMics = await getConnectedMicrophones();
    navigator.mediaDevices.ondevicechange = (event) async {
      allMics = await getConnectedMicrophones();
    };
      return allMics;
  }

  //Playing video from camera method left
}