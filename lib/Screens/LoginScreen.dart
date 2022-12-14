// ignore_for_file: prefer_const_constructors, avoid_print, sized_box_for_whitespace, non_constant_identifier_names, file_names, library_private_types_in_public_api, use_key_in_widget_constructors, must_call_super, curly_braces_in_flow_control_structures, use_build_context_synchronously
// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:get/get.dart';

import '../classes/global.dart' as global;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/gestures.dart';
import 'package:fyp/Screens/ForgetPassword.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginScreen extends StatefulWidget {
  final VoidCallback onClickedSignup;

  const LoginScreen({
    Key? key,
    required this.onClickedSignup,
  }) : super(key: key);
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // final user = FirebaseAuth.instance.currentUser;
  bool _passwordVisible = false;
  bool _enablebtn = true;
  final emailcontroller = TextEditingController();
  final passcontroller = TextEditingController();
  final formkey = GlobalKey<FormState>();
  @override
  void dispose() {
    emailcontroller.dispose();
    passcontroller.dispose();

    super.dispose();
  }

  @override
  void initState() {
    _passwordVisible = false;
  }

  Widget buildemail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Email',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.white, blurRadius: 6, offset: Offset(0, 2))
              ]),
          height: 60,
          child: TextFormField(
            controller: emailcontroller,
            textInputAction: TextInputAction.next,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (val) {
              bool emailValid = RegExp(
                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                  .hasMatch(val!);
              if (!emailValid) {
                return 'Invalid Email Address';
              } else {
                return null;
              }
            },
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(color: Colors.black87),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(
                  Icons.email,
                  color: Color(0xff5ac18e),
                ),
                hintText: 'Email',
                hintStyle: TextStyle(color: Colors.black38)),
          ),
        )
      ],
    );
  }

  Widget buildpassword() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Password',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 15),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.white, blurRadius: 6, offset: Offset(0, 2))
              ]),
          height: 60,
          child: TextFormField(
            controller: passcontroller,
            textInputAction: TextInputAction.done,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) {
              if (value == null)
                return 'Field Cannot be left Empty';
              else if (value.length < 6)
                return 'Enter Minimum 6 characters';
              else
                return null;
            },
            obscureText: !_passwordVisible,
            style: TextStyle(color: Colors.black87),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(
                  Icons.lock,
                  color: Color(0xff5ac18e),
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    _passwordVisible ? Icons.visibility : Icons.visibility_off,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      _passwordVisible = !_passwordVisible;
                    });
                  },
                ),
                hintText: 'Password',
                hintStyle: TextStyle(color: Colors.black38)),
          ),
        )
      ],
    );
  }

  Widget buildRemembermecb() {
    return Container(
      height: 35,
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        children: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ForgetPassword()));
            },
            child: Text(
              'Forgot Password?',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            width: 80,
          ),
        ],
      ),
    );
  }

  Widget Singupbtn() {
    return Container(
        padding: EdgeInsets.only(left: 60.0),
        width: double.infinity,
        child: Row(
          children: <Widget>[
            Text(
              "Don't have an account? ",
              style: TextStyle(color: Colors.white),
            ),
            RichText(
              text: TextSpan(
                recognizer: TapGestureRecognizer()
                  ..onTap = widget.onClickedSignup,
                text: 'Sign Up',
                style: TextStyle(
                    decoration: TextDecoration.underline, color: Colors.white),
              ),
            )
          ],
        ));
  }

  Widget buildloginbtn() {
    return Container(
      height: 40,
      width: double.infinity,
      child: ElevatedButton.icon(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.lightBlue),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ))),
        label: Text('Login'),
        onPressed: () {
          signin();
        },
        icon: Icon(
          Icons.lock,
          size: 24,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: const Text('Login'),
        backgroundColor: const Color.fromARGB(255, 48, 10, 55),
      ),
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: Form(
          key: formkey,
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color.fromARGB(255, 17, 7, 150),
                        Color.fromARGB(255, 106, 5, 5)
                      ]),
                ),
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image(
                        image: AssetImage('assets/Pc_builder_logo.png'),
                        // height: 250,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        '????????????????????',
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      buildemail(),
                      const SizedBox(
                        height: 20,
                      ),
                      buildpassword(),
                      buildRemembermecb(),
                      buildloginbtn(),
                      SizedBox(
                        height: 20,
                      ),
                      Singupbtn()
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future signin() async {
    final isValid = formkey.currentState!.validate();
    if (!isValid) return;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Center(
        child: Image.asset(
          'assets/Eater_loading.gif',
          width: 100,
          height: 100,
        ),
      ),
    );
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailcontroller.text.trim(),
          password: passcontroller.text.trim());
      // final ref = FirebaseStorage.instance
      //     .ref()
      //     .child("DisplayPicture")
      //     .child(user.uid);
      // global.url = await ref.getDownloadURL();
      Fluttertoast.showToast(
          msg: "Logged in",
          toastLength: Toast.LENGTH_SHORT,
          backgroundColor: Colors.grey);
    } on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(msg: e.message!, gravity: ToastGravity.BOTTOM);
    }
    Navigator.pop(context);
  }


}
