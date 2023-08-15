import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ujob/LoginPage/HomePage.dart';
import 'package:ujob/LoginPage/SighnUp.dart';
import 'package:ujob/LoginPage/usermodel.dart';
import 'package:ujob/Services/global_variables.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> with TickerProviderStateMixin {
  late Animation<double> _animation;
  late AnimationController _animationController;
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  bool _obscureText = true;

  void checkValues() {
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
    String email = emailcontroller.text.trim();
    String password = passwordcontroller.text.trim();

    if (email == "" || password == "") {
      showDialog(
          context: context,
          builder: (context) {
            return Container(
              child: const AlertDialog(
                title: Text(
                  "Please fill all the field!",
                  style: TextStyle(color: Colors.red),
                ),
              ),
            );
          });
    } else {
      logIn(email, password);
    }
  }

  void logIn(String email, String password) async {
    UserCredential? credential;
    try {
      credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (ex) {
      print(ex.message.toString());
    }

    if (credential != null) {
      String uid = credential.user!.uid;

      DocumentSnapshot userData =
          await FirebaseFirestore.instance.collection("users").doc(uid).get();
      UserModel userModel =
          UserModel.fromMap(userData.data() as Map<String, dynamic>);

      Navigator.of(context).pop();
      //Go to Homepage
      showDialog(
          context: context,
          builder: (context) {
            return Container(
              child: const AlertDialog(
                title: Text(
                  "Log In Successful!",
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            );
          });
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return HomePage(userModel: userModel, firebaseUser: credential!.user!);
      }));
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 20));
    _animation =
        CurvedAnimation(parent: _animationController, curve: Curves.linear)
          ..addListener(() {
            setState(() {});
          })
          ..addStatusListener((animationStatus) {
            if (animationStatus == AnimationStatus.completed) {
              _animationController.reset();
              _animationController.forward();
            }
          });
    _animationController.forward();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CachedNetworkImage(
            imageUrl: loginurlImage,
            placeholder: (context, url) => Image.asset(
              'images/back.jpg',
              fit: BoxFit.fill,
            ),
            errorWidget: (context, url, error) => const Icon(Icons.error),
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
            alignment: FractionalOffset(_animation.value, 0),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text(
                      "Login",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary,
                          fontSize: 40,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    /////////Email
                    TextField(
                      controller: emailcontroller,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.email),
                        hintText: 'Email',
                        hintStyle: TextStyle(color: Colors.white),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        errorBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.red)),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    /////////Pasword
                    TextField(
                      controller: passwordcontroller,
                      obscureText: true,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.lock),
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                          child: Icon(
                            _obscureText
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.white,
                          ),
                        ),
                        hintText: 'Password',
                        hintStyle: const TextStyle(color: Colors.white),
                        enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        errorBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.red)),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CupertinoButton(
                      onPressed: () {
                        checkValues();
                      },
                      color: Theme.of(context).colorScheme.secondary,
                      child: const Text("Log In"),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Don't have an account?",
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
            CupertinoButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return const SignUpPage();
                  }),
                );
              },
              child: const Text(
                "Sign Up",
                style: TextStyle(fontSize: 16),
              ),
            )
          ],
        ),
      ),
    );
  }
}
