import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginButton extends StatefulWidget {
  const LoginButton({super.key});

  @override
  State<LoginButton> createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  final _auth = FirebaseAuth.instance;
  bool _isChecking = true;

  Future<UserCredential?> _loginWithGoogle() async {
    try {
      final googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        // The user canceled the sign-in
        print("Google sign-in was canceled by the user.");
        return null;
      }

      // Obtain the authentication details from the Google sign-in
      final googleAuth = await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
        accessToken: googleAuth.accessToken,
      );

      // Sign in the user with Firebase
      final UserCredential userCredential = await _auth.signInWithCredential(credential);

      return userCredential;
    } on FirebaseAuthException catch (e) {
      // Handle Firebase-specific errors
      print("FirebaseAuthException: ${e.message}");
    } on Exception catch (e) {
      // Handle general errors
      print("Unexpected error during Google sign-in: $e");
    }

    return null;
  }

  Future<void> _checkLoginState() async {
    var user = _auth.currentUser;
    if (user != null) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) => context.goNamed('home'));
    } else {
      // If not logged in, stop showing the modal
      setState(() => (_isChecking = false));
    }
  }

  void _onLogin(BuildContext context) async {
    try {
      if (_isChecking) return;

      final user = await _loginWithGoogle();
      if (user == null) throw Exception("Something gone wrong while logged in the user");

      context.goNamed("home");
    } catch (e) {
      print(e);
      const AlertDialog(
        title: Text("Failed to login !"),
      );
    }
  }

  @override
  void initState() {
    _checkLoginState();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      style: TextButton.styleFrom(
        backgroundColor: _isChecking ? Colors.grey.shade800 : Colors.grey.shade900,
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 6.0),
      ),
      icon: Image.asset("assets/images/google.png"),
      label: Text(
        _isChecking ? "checking..." : "Login with google",
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.white),
      ),
      onPressed: () => _onLogin(context),
    );
  }
}
