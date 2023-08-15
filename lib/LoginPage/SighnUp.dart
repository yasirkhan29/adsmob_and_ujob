import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ujob/LoginPage/login_screen.dart';
import 'package:ujob/LoginPage/usermodel.dart';

import '../Services/global_variables.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> with TickerProviderStateMixin {
  late Animation<double> _animation;
  late AnimationController _animationController;

  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController cpasswordcontroller = TextEditingController();

  final _signUpFormKey = GlobalKey<FormState>();
  File? imageFile;

  bool _obscureText = true;
  bool _obscurText = true;
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
    String cpassword = cpasswordcontroller.text.trim();

    if (email == "" || password == "" || cpassword == "") {
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
    } else if (password != cpassword) {
      showDialog(
          context: context,
          builder: (context) {
            return Container(
              child: const AlertDialog(
                title: Text(
                  "Password do not match!",
                  style: TextStyle(color: Colors.red),
                ),
              ),
            );
          });
    } else {
      signUp(email, password);
    }
  }

  void signUp(String email, String password) async {
    UserCredential? credential;
    try {
      credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (ex) {
      print(ex.code.toString());
    }

    if (credential != null) {
      String uid = credential.user!.uid;
      UserModel newUser =
          UserModel(uid: uid, email: email, fullname: "", profilepic: "");

      await FirebaseFirestore.instance
          .collection("users")
          .doc(uid)
          .set(newUser.toMap())
          .then((value) {
        Navigator.of(context).pop();
        showDialog(
            context: context,
            builder: (context) {
              return Container(
                child: const AlertDialog(
                  title: Text(
                    "Your Account is Creat",
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              );
            });

        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return const Login();
        }));
      });
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

  void _showImageDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Please choose an option'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                InkWell(
                  onTap: () {
                    _getFormCamera();
                  },
                  child:  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(4.0),
                        child: Icon(
                          Icons.camera,
                          color: Colors.purple,
                        ),
                      ),
                      Text(
                        'Camera',
                        style: TextStyle(color: Colors.purple),
                      )
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    _getFormGallery();
                  },
                  child:  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(4.0),
                        child: Icon(
                          Icons.image,
                          color: Colors.purple,
                        ),
                      ),
                      Text(
                        'Image',
                        style: TextStyle(color: Colors.purple),
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }

  void _getFormCamera() async {
    XFile? PickedFile =
        await ImagePicker().pickImage(source: ImageSource.camera);
    _cropImage(PickedFile!.path);
    Navigator.pop(context);
  }

  void _getFormGallery() async {
    XFile? PickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    _cropImage(PickedFile!.path);
    Navigator.pop(context);
  }

  void _cropImage(filePath) async {
    CroppedFile? croppedImage = await ImageCropper()
        .cropImage(sourcePath: filePath, maxHeight: 1080, maxWidth: 1080);
    if (croppedImage != null) {
      setState(() {
        imageFile = File(croppedImage.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 80),
              child: ListView(
                children: [
                  Text(
                    "Sign Up",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary,
                        fontSize: 40,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Form(
                    key: _signUpFormKey,
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            _showImageDialog();
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(.0),
                            child: Container(
                              width: size.width * 0.24,
                              height: size.width * 0.24,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    width: 1, color: Colors.cyanAccent),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(16),
                                  child: imageFile == null
                                      ? const Icon(
                                          Icons.camera_enhance_sharp,
                                          color: Colors.cyan,
                                          size: 30,
                                        )
                                      : Image.file(
                                          imageFile!,
                                          fit: BoxFit.fill,
                                        )),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Center(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            /////////Email
                            TextField(
                              controller: emailcontroller,
                              decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.email),
                                hintText: 'Email Address',
                                hintStyle: TextStyle(color: Colors.white),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.white)),
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
                                    borderSide:
                                        BorderSide(color: Colors.white)),
                                errorBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.red)),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            ////////////conform
                            TextField(
                              controller: cpasswordcontroller,
                              obscureText: true,
                              decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.lock),
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _obscurText = !_obscurText;
                                    });
                                  },
                                  child: Icon(
                                    _obscurText
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: Colors.white,
                                  ),
                                ),
                                hintText: 'Conform Password',
                                hintStyle: const TextStyle(color: Colors.white),
                                enabledBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                focusedBorder: const UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.white)),
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
                              child: const Text("Sign Up"),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
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
              "Already have an account?",
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
            CupertinoButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                "Log In",
                style: TextStyle(fontSize: 16),
              ),
            )
          ],
        ),
      ),
    );
  }
}
