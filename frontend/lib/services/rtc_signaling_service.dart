import 'package:firebase_database/firebase_database.dart';

class SignalingService {
  final DatabaseReference _databaseRef = FirebaseDatabase.instance.ref();

  // Send offer to a specific user
  void sendOffer(String callerUid, String calleeUid, Map<String, dynamic> offer) {
    _databaseRef.child('signaling/$calleeUid/$callerUid/offer').set(offer);
  }

  // Send answer to a specific user
  void sendAnswer(String callerUid, String calleeUid, Map<String, dynamic> answer) {
    _databaseRef.child('signaling/$callerUid/$calleeUid/answer').set(answer);
  }

  // Send ICE candidate to a specific user
  void sendIceCandidate(String callerUid, String calleeUid, Map<String, dynamic> candidate) {
    _databaseRef.child('signaling/$calleeUid/$callerUid/iceCandidates').push().set(candidate);
  }

  // Listen for offers
  Stream<Map<String, dynamic>> listenForOffers(String calleeUid) {
    //onChildAdded sets up a listener that is triggered whenever 
    //a new child node is added to the specified path.
    return _databaseRef.child('signaling/$calleeUid').onChildAdded.map((event) {
      return event.snapshot.value as Map<String, dynamic>;
    });
  }

  // Listen for answers
  Stream<Map<String, dynamic>> listenForAnswers(String callerUid, String calleeUid) {
    //onValue is used instead of onChildAdded because onChildAdded is suitable 
    //for scenarios where multiple child nodes may be added overtime.In the case of an answer,
    //it is a single value, therefore it is more appropriate to listen for changes at the specified path.
    return _databaseRef.child('signaling/$callerUid/$calleeUid/answer').onValue.map((event) {
      return event.snapshot.value as Map<String, dynamic>;
    });
  }

  // Listen for ICE candidates
  Stream<Map<String, dynamic>> listenForIceCandidates(String callerUid, String calleeUid) {
    return _databaseRef.child('signaling/$callerUid/$calleeUid/iceCandidates').onChildAdded.map((event) {
      return event.snapshot.value as Map<String, dynamic>;
    });
  }

  // Keeping old signaling data can lead to confusion and potential 
  //conflicts if the same users initiate a new call.So,
  // cleaning up is necessary.
  void cleanup(String callerUid, String calleeUid) {
    _databaseRef.child('signaling/$callerUid/$calleeUid').remove();
  }
}