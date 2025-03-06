import 'package:firebase_database/firebase_database.dart';

class SignalingService {
  final DatabaseReference _databaseRef = FirebaseDatabase.instance.ref();

  // Send offer to a specific user
  Future<void> sendOffer(String callerUid, String calleeUid, Map<String, dynamic> offer) async {
    try {
      await _databaseRef.child('signaling/$calleeUid/$callerUid/offer').set(offer);
    } catch (e) {
      print('Failed to send offer: $e');
    }
  }

  // Send answer to a specific user
  Future<void> sendAnswer(String callerUid, String calleeUid, Map<String, dynamic> answer) async {
    try {
      await _databaseRef.child('signaling/$callerUid/$calleeUid/answer').set(answer);
    } catch (e) {
      print('Failed to send answer: $e');
    }
  }

  // Send ICE candidate to a specific user
  Future<void> sendIceCandidate(String callerUid, String calleeUid, Map<String, dynamic> candidate) async {
    try {
      await _databaseRef.child('signaling/$calleeUid/$callerUid/iceCandidates').push().set(candidate);
    } catch (e) {
      print('Failed to send ICE candidate: $e');
    }
  }

  Stream<Map<String, dynamic>> listenForIceCandidates(String callerUid, String calleeUid) {
    return _databaseRef.child('signaling/$callerUid/$calleeUid/iceCandidates').onValue.map((event){
      return event.snapshot.value as Map<String, dynamic>;
    }).handleError((error) {
      print('Error listening for candidates: $error');
    });
  }

  // Listen for offers
  Stream<Map<String, dynamic>> listenForOffers(String calleeUid) {
    return _databaseRef.child('signaling/$calleeUid').onChildAdded.map((event) {
      return event.snapshot.value as Map<String, dynamic>;
    }).handleError((error) {
      print('Error listening for offers: $error');
    });
  }

  // Listen for answers
  Stream<Map<String, dynamic>> listenForAnswers(String callerUid, String calleeUid) {
    return _databaseRef.child('signaling/$callerUid/$calleeUid/answer').onValue.map((event) {
      return event.snapshot.value as Map<String, dynamic>;
    }).handleError((error) {
      print('Error listening for answers: $error');
    });
  }
}