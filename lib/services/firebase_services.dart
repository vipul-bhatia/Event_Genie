import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:package_info_plus/package_info_plus.dart';

class FirebaseServices{
 final _auth= FirebaseAuth.instance;
 final _googleSignIn= GoogleSignIn();


  signInWithGoogle() async{
    try{
      final GoogleSignInAccount? googleSignInAccount= await _googleSignIn.signIn();
      if(googleSignInAccount!=null){
        final GoogleSignInAuthentication googleSignInAuthentication= await googleSignInAccount.authentication;
        final AuthCredential credential= GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken,
        );
        final UserCredential userCredential= await _auth.signInWithCredential(credential);
        final User? user= userCredential.user;
        if(user!=null){
          return user;
        }
      }
    }on FirebaseAuthException catch(e){
      print(e.message);
      throw e;
    }


  }

  signOut() async{
    await _auth.signOut();
    await _googleSignIn.signOut();
  }

}

// class UserHelper {
//   static FirebaseFirestore _db = FirebaseFirestore.instance;

//   static saveUser(User user) async {
//     PackageInfo packageInfo = await PackageInfo.fromPlatform();
//     int buildNumber = int.parse(packageInfo.buildNumber);

//     Map<String, dynamic> userData = {
//       "name": user.displayName,
//       "email": user.email,
//       "last_login": user.metadata.lastSignInTime?.millisecondsSinceEpoch,
//       "created_at": user.metadata.creationTime?.millisecondsSinceEpoch,
//       "role": "user",
//       "build_number": buildNumber,
//     };
//     final userRef = _db.collection("users").doc(user.uid);
//     if ((await userRef.get()).exists) {
//       await userRef.update({
//         "last_login": user.metadata.lastSignInTime?.millisecondsSinceEpoch,
//         "build_number": buildNumber,
//       });
//     } else {
//       await _db.collection("users").doc(user.uid).set(userData);
//     }
//     await _saveDevice(user);
//   }

//   static _saveDevice(User user) async {
//     DeviceInfoPlugin devicePlugin = DeviceInfoPlugin();
//     String deviceId;
//     Map<String, dynamic> deviceData;
//     if (Platform.isAndroid) {
//       final deviceInfo = await devicePlugin.androidInfo;
//       deviceId = deviceInfo.id;
//       deviceData = {
//         "os_version": deviceInfo.version.sdkInt.toString(),
//         "platform": 'android',
//         "model": deviceInfo.model,
//         "device": deviceInfo.device,
//       };
//     }
//     if (Platform.isIOS) {
//       final deviceInfo = await devicePlugin.iosInfo;
//        deviceId = deviceInfo.identifierForVendor!;
//       deviceData = {
//         "os_version": deviceInfo.systemVersion,
//         "device": deviceInfo.name,
//         "model": deviceInfo.utsname.machine,
//         "platform": 'ios',
//       };
//        final nowMS = DateTime.now().toUtc().millisecondsSinceEpoch;
//     final deviceRef = _db
//         .collection("users")
//         .doc(user.uid)
//         .collection("devices")
//         .doc(deviceId);
//     if ((await deviceRef.get()).exists) {
//       await deviceRef.update({
//         "updated_at": nowMS,
//         "uninstalled": false,
//       });
//     } else {
//       await deviceRef.set({
//         "updated_at": nowMS,
//         "uninstalled": false,
//         "id": deviceId,
//         "created_at": nowMS,
//         "device_info": deviceData,
//       });
//     }
//     }
   
//   }
// }