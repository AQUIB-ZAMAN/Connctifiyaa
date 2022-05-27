import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController {
  final FirebaseAuth auth = FirebaseAuth.instance;
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
    UserCredential? userCredential =
        await auth.signInWithCredential(credential);
  }
}
