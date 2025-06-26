import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sign_in_button/sign_in_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? _user;

  @override
  void initState() {
    super.initState();
    _auth.authStateChanges().listen((event) {
      setState(() {
        _user = event;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Google Sign In Demo", style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.amber,


      ),
      body: _user != null ? userInfo() : _googleSignInButton(),
    );
  }

  Widget _googleSignInButton() {
    return Center(

      child: SizedBox(
        height: 50,
        child: SignInButton(
          Buttons.google,
          shape: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          text: "Sign In With Google",
          onPressed: _handleGoogleSignIn,
        ),
      ),
    );
  }

  Widget userInfo() {
    return Center(
      child: Card(
        margin: const EdgeInsets.all(20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15), // Rounded corners
        ),
        child: Container(
          height: 300, // Set a fixed height for the card
          padding: const EdgeInsets.all(20), // Increased padding
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            child: Column(

              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(_user!.photoURL!),
                ),
                const SizedBox(height: 15), // More space below the image

                Text(
                  _user!.displayName ?? "",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 25),
                ),
                const SizedBox(height: 5), // Space between name and email
                Text(
                  _user!.email!,
                  style: const TextStyle(fontSize: 16, color: Colors.black),
                ),
                const SizedBox(height: 20), // Space above the button
                MaterialButton(
                  color: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8), // Rounded button corners
                  ),
                  child: const Text("Sign Out!", style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
                  onPressed: _confirmSignOut,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  void _handleGoogleSignIn() {
    try {
      GoogleAuthProvider _googleAuthProvider = GoogleAuthProvider();
      _auth.signInWithProvider(_googleAuthProvider);
    } catch (error) {
      // Handle error
    }
  }

  void _confirmSignOut() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Confirm Sign Out"),
          content: const Text("Are you sure you want to sign out?"),
          actions: [
            TextButton(
              child: const Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text("Sign Out"),
              onPressed: () {
                _auth.signOut();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}