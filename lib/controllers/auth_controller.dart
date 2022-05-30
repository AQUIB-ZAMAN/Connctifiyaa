import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController {
  final FirebaseAuth auth = FirebaseAuth.instance;

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Stream<User?> get authChanges => auth.authStateChanges();
  User? get user => auth.currentUser;

  signInWithGoogle() async {
    // sigining in the user doesnt return the credentials of the user
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
// check whether the user is signed in or not
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;
// obtains the credentials of the user
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
// stores the credentials of the user in the firebase db
    UserCredential userCredential = await auth.signInWithCredential(credential);

    User? user = userCredential.user;
    // before storing to the firestone db we need to
    // check if the user is null or not, also we dont
    // want to save the user everytime, we need to
    // save the user only once

    //if user is not null and user is a  new user
    if (user != null) {
      if (userCredential.additionalUserInfo!.isNewUser) {
        firestore.collection('users').doc(user.uid).set({
          'username': user.displayName,
          'uid': user.uid,
          'profilePhoto': user.photoURL,
        });
      }
    }
  }
}
