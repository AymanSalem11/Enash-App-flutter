import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

String userName = "";
String userPhone = "";
String userID = FirebaseAuth.instance.currentUser!.uid;

String googleMapKey = "AIzaSyBEqOzBywlTxKj1xUR_xZkgKoUJr8FDWtk";
String serverKeyFCM = "AAAAPYFmQ3Q:APA91bHVOaLZ-Q36hlpHll-4hJqTxutllzVqq0WnBPEJqEiA3Puum7RBT2TY3no-y5xruAWMC71lE4DGnRbOFj9ESvNSLKC_-Sx5DeW-V8HBA-tijlmlnRJmVrmoNH4uRKPzUQ-_XyRv";

const CameraPosition googlePlexInitialPosition = CameraPosition(
  target: LatLng(37.42796133580664, -122.085749655962),
  zoom: 14.4746,
);

