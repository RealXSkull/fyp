// // ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, file_names, prefer_final_fields, unnecessary_new, use_key_in_widget_constructors, avoid_print, non_constant_identifier_names, sized_box_for_whitespace, must_call_super

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/gestures.dart';
// import 'package:fyp/LoginScreen.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// class WarrentyClaim extends StatefulWidget {
//   final VoidCallback onClickedLogin;

//   const WarrentyClaim({
//     Key? key,
//     required this.onClickedLogin,
//   }) : super(key: key);
//   @override
//   WarrentyClaimArea createState() => WarrentyClaimArea();
// }

// class WarrentyClaimArea extends State<WarrentyClaim> {
//   TextEditingController _controller = new TextEditingController();
//   bool obscureTextt = true;
//   bool _passwordVisible = false;
//   bool _passwordVisible2 = false;
//   final emailcontroller = TextEditingController();
//   final passcontroller = TextEditingController();
//   final confirmpasscontroller = TextEditingController();
//   final formkey = GlobalKey<FormState>();

//   @override
//   void dispose() {
//     emailcontroller.dispose();
//     passcontroller.dispose();

//     super.dispose();
//   }

//   @override
//   void initState() {
//     _passwordVisible = false;
//     _passwordVisible2 = false;
//   }

//   Widget buildname() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: <Widget>[
//         SizedBox(
//           height: 10,
//         ),
//         Text(
//           'Full Name',
//           style: TextStyle(
//             color: Colors.white,
//             fontSize: 12,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         SizedBox(height: 10),
//         Container(
//           alignment: Alignment.centerLeft,
//           decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(10),
//               boxShadow: [
//                 BoxShadow(
//                     color: Colors.white, blurRadius: 6, offset: Offset(0, 2))
//               ]),
//           height: 40,
//           child: TextField(
//             keyboardType: TextInputType.text,
//             style: TextStyle(color: Colors.black87),
//             decoration: InputDecoration(
//                 border: InputBorder.none,
//                 prefixIcon: Icon(
//                   Icons.person,
//                   color: Color(0xff5ac18e),
//                 ),
//                 hintText: 'Full Name',
//                 hintStyle: TextStyle(color: Colors.black38)),
//           ),
//         )
//       ],
//     );
//   }

//   Widget buildemail() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: <Widget>[
//         Text(
//           'Email',
//           style: TextStyle(
//             color: Colors.white,
//             fontSize: 16,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         SizedBox(height: 10),
//         Stack(
//           children: [
//             Container(
//               alignment: Alignment.centerLeft,
//               decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(10),
//                   boxShadow: [
//                     BoxShadow(
//                         color: Colors.white,
//                         blurRadius: 6,
//                         offset: Offset(0, 2))
//                   ]),
//               height: 40,
//               child: TextFormField(
//                 controller: emailcontroller,
//                 keyboardType: TextInputType.emailAddress,
//                 autovalidateMode: AutovalidateMode.onUserInteraction,
//                 validator: (val) {
//                   bool emailValid = RegExp(
//                           r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
//                       .hasMatch(val!);
//                   if (!emailValid) {
//                     return 'Invalid Email Address';
//                   } else {
//                     return null;
//                   }
//                 },
//                 style: TextStyle(color: Colors.black87),
//                 decoration: InputDecoration(
//                     border: InputBorder.none,
//                     prefixIcon: Icon(
//                       Icons.email,
//                       color: Color(0xff5ac18e),
//                     ),
//                     hintText: 'Email',
//                     hintStyle: TextStyle(color: Colors.black38)),
//               ),
//             )
//           ],
//         )
//       ],
//     );
//   }

//   Widget buildpassword() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: <Widget>[
//         Text(
//           'Password',
//           style: TextStyle(
//             color: Colors.white,
//             fontSize: 16,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         SizedBox(height: 15),
//         Container(
//           alignment: Alignment.centerLeft,
//           decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(10),
//               boxShadow: [
//                 BoxShadow(
//                     color: Colors.white, blurRadius: 6, offset: Offset(0, 2))
//               ]),
//           height: 40,
//           child: TextFormField(
//             controller: passcontroller,
//             obscureText: !_passwordVisible,
//             autovalidateMode: AutovalidateMode.onUserInteraction,
//             validator: (value) {
//               if (value == null)
//                 return 'Field Cannot be left Empty';
//               else if (value.length < 6)
//                 return 'Enter Minimum 6 characters';
//               else
//                 return null;
//             },
//             style: TextStyle(color: Colors.black87),
//             decoration: InputDecoration(
//                 border: InputBorder.none,
//                 prefixIcon: Icon(
//                   Icons.lock,
//                   color: Color(0xff5ac18e),
//                 ),
//                 suffixIcon: IconButton(
//                   icon: Icon(
//                     _passwordVisible ? Icons.visibility : Icons.visibility_off,
//                     color: Colors.grey,
//                   ),
//                   onPressed: () {
//                     setState(() {
//                       _passwordVisible = !_passwordVisible;
//                     });
//                   },
//                 ),
//                 hintText: 'Password',
//                 hintStyle: TextStyle(color: Colors.black38)),
//           ),
//         )
//       ],
//     );
//   }

//   Widget buildconfirmpassword() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: <Widget>[
//         Text(
//           'Confirm Password',
//           style: TextStyle(
//             color: Colors.white,
//             fontSize: 16,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         SizedBox(height: 15),
//         Container(
//           alignment: Alignment.centerLeft,
//           decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(10),
//               boxShadow: [
//                 BoxShadow(
//                     color: Colors.white, blurRadius: 6, offset: Offset(0, 2))
//               ]),
//           height: 40,
//           child: TextFormField(
//             controller: confirmpasscontroller,
//             obscureText: !_passwordVisible2,
//             autovalidateMode: AutovalidateMode.onUserInteraction,
//             validator: (value) {
//               if (value == null)
//                 return 'Field Cannot be left Empty';
//               else if (confirmpasscontroller.text != null && value.length < 6)
//                 return 'Enter Minimum 6 characters';
//               else if (value != passcontroller.text)
//                 return 'Password Doesnot Match';
//               else
//                 return null;
//             },
//             style: TextStyle(color: Colors.black87),
//             decoration: InputDecoration(
//                 border: InputBorder.none,
//                 prefixIcon: Icon(
//                   Icons.lock,
//                   color: Color(0xff5ac18e),
//                 ),
//                 suffixIcon: IconButton(
//                   icon: Icon(
//                     _passwordVisible2 ? Icons.visibility : Icons.visibility_off,
//                     color: Colors.grey,
//                   ),
//                   onPressed: () {
//                     setState(() {
//                       _passwordVisible2 = !_passwordVisible2;
//                     });
//                   },
//                 ),
//                 hintText: 'Retype Password',
//                 hintStyle: TextStyle(color: Colors.black38)),
//           ),
//         )
//       ],
//     );
//   }

//   Widget buildphone() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: <Widget>[
//         Text(
//           'Contact No.',
//           style: TextStyle(
//             color: Colors.white,
//             fontSize: 16,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         SizedBox(height: 15),
//         Container(
//           alignment: Alignment.centerLeft,
//           decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(10),
//               boxShadow: [
//                 BoxShadow(
//                     color: Colors.white, blurRadius: 6, offset: Offset(0, 2))
//               ]),
//           height: 40,
//           child: TextField(
//             controller: _controller,
//             onChanged: (String newVal) {
//               if (newVal.length <= maxLength) {
//                 contactno = newVal;
//               } else {
//                 _controller.text = contactno;
//               }
//             },
//             // maxLength: 11,
//             keyboardType: TextInputType.number,
//             style: TextStyle(color: Colors.black87),
//             decoration: InputDecoration(
//                 border: InputBorder.none,
//                 prefixIcon: Icon(
//                   Icons.phone,
//                   color: Color(0xff5ac18e),
//                 ),
//                 hintText: '03xx-xxxxxxx',
//                 hintStyle: TextStyle(color: Colors.black38)),
//           ),
//         )
//       ],
//     );
//   }

//   Widget AlreadyAccountbtn() {
//     return Container(
//       padding: EdgeInsets.only(left: 60.0),
//       width: double.infinity,
//       child: Row(
//         children: <Widget>[
//           Text(
//             "Don't have an account?",
//             style: TextStyle(color: Colors.black),
//           ),
//           RichText(
//             text: TextSpan(
//               recognizer: TapGestureRecognizer()..onTap = widget.onClickedLogin,
//               text: 'LOGIN',
//               style: TextStyle(
//                   decoration: TextDecoration.underline, color: Colors.black),
//             ),
//           )
//         ],
//       ),
//     );
//   }

//   Widget Registerbtn() {
//     return Container(
//       height: 40,
//       width: double.infinity,
//       child: ElevatedButton(
//           style: ButtonStyle(
//               backgroundColor:
//                   MaterialStateProperty.all<Color>(Colors.lightBlue),
//               shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                   RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(10.0),
//               ))),
//           child: Text('Register'),
//           onPressed: () {
//             WarrentyClaim();
//           }),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text('REGISTRATION'),
//           backgroundColor: Colors.blueGrey,
//         ),
//         body: AnnotatedRegion<SystemUiOverlayStyle>(
//           value: SystemUiOverlayStyle.dark,
//           child: Form(
//             key: formkey,
//             child: Stack(
//               children: <Widget>[
//                 Container(
//                   height: MediaQuery.of(context).size.height,
//                   width: MediaQuery.of(context).size.width,
//                   decoration: const BoxDecoration(
//                       gradient: LinearGradient(
//                           begin: Alignment.topLeft,
//                           end: Alignment.bottomCenter,
//                           colors: [Color(0xff588F8F), Color(0x00000000)])),
//                   child: SingleChildScrollView(
//                     physics: AlwaysScrollableScrollPhysics(),
//                     padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: <Widget>[
//                         // buildname(),
//                         // SizedBox(
//                         //   height: 20,
//                         // ),
//                         buildemail(),
//                         const SizedBox(
//                           height: 20,
//                         ),
//                         // buildphone(),
//                         // const SizedBox(
//                         //   height: 20,
//                         // ),
//                         buildpassword(),
//                         SizedBox(
//                           height: 20,
//                         ),
//                         buildconfirmpassword(),
//                         SizedBox(
//                           height: 20,
//                         ),
//                         Registerbtn(),
//                         SizedBox(
//                           height: 20,
//                         ),
//                         AlreadyAccountbtn()
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ));
//   }

//   Future WarrentyClaim() async {
//     final isValid = formkey.currentState!.validate();
//     if (!isValid) return;
//     showDialog(
//         context: context,
//         barrierDismissible: false,
//         builder: (context) => Center(
//               child: Image.asset(
//                 'assets/Eater_loading.gif',
//                 width: 100,
//                 height: 100,
//               ),
//             ));
//     try {
//       await FirebaseAuth.instance.createUserWithEmailAndPassword(
//           email: emailcontroller.text.trim(),
//           password: passcontroller.text.trim());
//     } on FirebaseAuthException catch (e) {
//       Fluttertoast.showToast(msg: e.message!, gravity: ToastGravity.BOTTOM);
//     }
//     Navigator.pop(context);
//   }
// }
