import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
import 'package:google_sign_in/google_sign_in.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  googleLogin() async {
    GoogleSignIn _googleSignIn = GoogleSignIn();

    try {
      var result = await _googleSignIn.signIn();
      if (result == null) {
        return;
      }
      final userData = await result.authentication;
      final credential = GoogleAuthProvider.credential(
          accessToken: userData.accessToken, idToken: userData.idToken);
      var finalResult =
          await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (error) {
      print(error);
    }
  }

  Future<void> logout() async {
    await GoogleSignIn().disconnect();
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      title: const Text("Login Screen"),
      
      
    ),
    
    body: Center(
      child:  ElevatedButton(
      child: const Text("Sign In With Google"),
      onPressed: googleLogin,
      ),
    ),
    
    );
  }
}
