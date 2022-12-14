import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:fyp/Screens/LoginScreen.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

var useridd;

class Signup extends StatefulWidget {
  final VoidCallback onClickedLogin;

  const Signup({
    Key? key,
    required this.onClickedLogin,
  }) : super(key: key);
  @override
  SignupArea createState() => SignupArea();
}

class SignupArea extends State<Signup> {
  final user = FirebaseAuth.instance.currentUser;
  int maxLength = 11;
  final TextEditingController _controller = new TextEditingController();
  final TextEditingController _namecontroller = new TextEditingController();
  String contactno = "";
  bool obscureTextt = true;
  bool _passwordVisible = false;
  bool _passwordVisible2 = false;
  final emailcontroller = TextEditingController();
  final passcontroller = TextEditingController();
  final confirmpasscontroller = TextEditingController();
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
    _passwordVisible2 = false;
  }

  Widget buildname() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(
          height: 10,
        ),
        const Text(
          'Full Name',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                    color: Colors.white, blurRadius: 6, offset: Offset(0, 2))
              ]),
          height: 40,
          child: TextField(
            controller: _namecontroller,
            keyboardType: TextInputType.text,
            style: const TextStyle(color: Colors.black),
            decoration: const InputDecoration(
                border: InputBorder.none,
                prefixIcon: Icon(
                  Icons.person,
                  color: Color(0xff5ac18e),
                ),
                hintText: 'Full Name',
                hintStyle: TextStyle(color: Colors.black38)),
          ),
        )
      ],
    );
  }

  Widget buildemail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          'Email',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        Stack(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.white,
                        blurRadius: 6,
                        offset: Offset(0, 2))
                  ]),
              height: 40,
              child: TextFormField(
                controller: emailcontroller,
                keyboardType: TextInputType.emailAddress,
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
                style: const TextStyle(color: Colors.black),
                decoration: const InputDecoration(
                    errorStyle: TextStyle(height: 0.1),
                    border: InputBorder.none,
                    prefixIcon: Icon(
                      Icons.email,
                      color: Color(0xff5ac18e),
                    ),
                    hintText: 'Email',
                    hintStyle: TextStyle(color: Colors.black38)),
              ),
            )
          ],
        )
      ],
    );
  }

  Widget buildpassword() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          'Password',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 15),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                    color: Colors.white, blurRadius: 6, offset: Offset(0, 2))
              ]),
          height: 40,
          child: TextFormField(
            controller: passcontroller,
            obscureText: !_passwordVisible,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) {
              if (value == null) {
                return 'Field Cannot be left Empty';
              } else if (value.length < 6) {
                return 'Enter Minimum 6 characters';
              } else {
                return null;
              }
            },
            style: const TextStyle(color: Colors.black87),
            decoration: InputDecoration(
                border: InputBorder.none,
                prefixIcon: const Icon(
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
                errorStyle: const TextStyle(height: 0.1),
                hintStyle: const TextStyle(color: Colors.black38)),
          ),
        )
      ],
    );
  }

  Widget buildconfirmpassword() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          'Confirm Password',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 15),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                    color: Colors.white, blurRadius: 6, offset: Offset(0, 2))
              ]),
          height: 40,
          child: TextFormField(
            controller: confirmpasscontroller,
            obscureText: !_passwordVisible2,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) {
              if (value == null) {
                return 'Field Cannot be left Empty';
              } else if (confirmpasscontroller.text.isNotEmpty &&
                  value.length < 6) {
                return 'Enter Minimum 6 characters';
              } else if (value != passcontroller.text) {
                return 'Password Doesnot Match';
              } else {
                return null;
              }
            },
            style: const TextStyle(color: Colors.black87),
            decoration: InputDecoration(
                border: InputBorder.none,
                prefixIcon: const Icon(
                  Icons.lock,
                  color: Color(0xff5ac18e),
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    _passwordVisible2 ? Icons.visibility : Icons.visibility_off,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      _passwordVisible2 = !_passwordVisible2;
                    });
                  },
                ),
                hintText: 'Retype Password',
                errorStyle: const TextStyle(height: 0.1),
                hintStyle: const TextStyle(color: Colors.black38)),
          ),
        )
      ],
    );
  }

  Widget buildphone() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          'Contact No.',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 15),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                    color: Colors.white, blurRadius: 6, offset: Offset(0, 2))
              ]),
          height: 40,
          child: TextField(
            controller: _controller,
            onChanged: (String newVal) {
              if (newVal.length <= maxLength) {
                contactno = newVal;
              } else {
                _controller.text = contactno;
              }
            },
            // maxLength: 11,
            keyboardType: TextInputType.number,
            style: const TextStyle(color: Colors.black87),
            decoration: const InputDecoration(
                border: InputBorder.none,
                prefixIcon: Icon(
                  Icons.phone,
                  color: Color(0xff5ac18e),
                ),
                hintText: '03xx-xxxxxxx',
                hintStyle: TextStyle(color: Colors.black38)),
          ),
        )
      ],
    );
  }

  Widget alreadyaccountbtn() {
    return Container(
      padding: const EdgeInsets.only(left: 60.0),
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const Text(
            "Already an account? ",
            style: TextStyle(color: Colors.white),
          ),
          RichText(
            text: TextSpan(
              recognizer: TapGestureRecognizer()..onTap = widget.onClickedLogin,
              text: 'LOGIN',
              style: const TextStyle(
                  decoration: TextDecoration.underline, color: Colors.white),
            ),
          )
        ],
      ),
    );
  }

  Widget registerbtn() {
    return SizedBox(
      height: 40,
      width: double.infinity,
      child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(Colors.lightBlue),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ))),
          child: const Text('Register'),
          onPressed: () {
            signup();
          }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('REGISTRATION'),
          backgroundColor: const Color.fromARGB(255, 48, 10, 55),
        ),
        body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.dark,
          child: Form(
            key: formkey,
            child: Stack(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
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
                    physics: const AlwaysScrollableScrollPhysics(),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        buildname(),
                        const SizedBox(
                          height: 15,
                        ),
                        buildemail(),
                        const SizedBox(
                          height: 20,
                        ),
                        buildpassword(),
                        const SizedBox(
                          height: 20,
                        ),
                        buildconfirmpassword(),
                        const SizedBox(
                          height: 20,
                        ),
                        registerbtn(),
                        const SizedBox(
                          height: 20,
                        ),
                        alreadyaccountbtn()
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  Future signup() async {
    String name = _namecontroller.text;
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
      UserCredential result = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: emailcontroller.text.trim(),
              password: passcontroller.text.trim());
      await result.user?.updateDisplayName(name);
      // Navigator.pop(context);
      Fluttertoast.showToast(
          msg: "Logged in as  $name",
          toastLength: Toast.LENGTH_SHORT,
          backgroundColor: Colors.grey);
      useridd = result;
    } on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(msg: e.message!, gravity: ToastGravity.BOTTOM);
    }
  }
}
