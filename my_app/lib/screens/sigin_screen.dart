import 'package:my_app/packages.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
// ignore_for_file: library_private_types_in_public_api, unused_catch_clause

// import 'package:evento/screens/home_screen.dart';
// import 'package:evento/screens/reset_password.dart';
// import 'package:evento/screens/signup_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
  final fireStore = FirebaseFirestore.instance.collection('staff');
  String errorMsg = "";
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.amber),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          // child: Column(
          //   children: [
          // Center(
          // child: Padding(
          //   padding: const EdgeInsets.all(20.0),
          //   child: Column(
          //     children: [
          // Container(
          //   width: 150,
          //   height: 150,
          //   decoration: BoxDecoration(
          //       image: const DecorationImage(
          //           image: AssetImage('assets/images/logo.png'),
          //           fit: BoxFit.cover),
          //       borderRadius: BorderRadius.circular(100)),
          // ),
          //     ]),
          //   ),
          // ),
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.fromLTRB(
                  30, MediaQuery.of(context).size.height * 0.2, 30, 0),
              child: Column(
                children: <Widget>[
                  Text(
                    "Food Ordering System",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                  Image.asset(
                    "assets/images/logo.png",
                    width: 180,
                    height: 180,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  reusableTextField("Enter Email", Icons.person_outline, false,
                      _emailTextController),
                  const SizedBox(
                    height: 20,
                  ),
                  reusableTextField("Enter Password", Icons.lock_outline, true,
                      _passwordTextController),
                  const SizedBox(
                    height: 30,
                  ),
                  // forgetPassword(context),
                  // firebaseUIButton(context, "Sign In", () {
                  //   FirebaseAuth.instance
                  //       .signInWithEmailAndPassword(
                  //           email: _emailTextController.text,
                  //           password: _passwordTextController.text)
                  //       .then((value) {
                  //     Navigator.push(
                  //         context,
                  //         MaterialPageRoute(
                  //             builder: (context) => const Navbar()));
                  //   }).onError((error, stackTrace) {
                  //     print("Error ${error.toString()}");
                  //   });
                  // }),

                  firebaseUIButton(context, "Sign in as Staff", () async {
                    try {
                      await FirebaseAuth.instance
                          .signInWithEmailAndPassword(
                              email: "user_${_emailTextController.text}",
                              password: _passwordTextController.text)
                          .then((value) => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomeScreen())));
                    } on FirebaseAuthException catch (e) {
                      setState(() {
                        errorMsg = "Invalid Username or Password";
                      });
                    }
                  }),
                  firebaseUIButton(context, "Sign in as admin", () async {
                    if (_emailTextController.text.trim() ==
                        'admin@gmail.com') {}
                    try {
                      await FirebaseAuth.instance
                          .signInWithEmailAndPassword(
                              email: _emailTextController.text.trim(),
                              password: _passwordTextController.text.trim())
                          .then((value) => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const AddFoodItem())));
                    } on FirebaseAuthException catch (e) {
                      setState(() {
                        errorMsg = "Invalid Username or Password.";
                      });
                    }
                  }),
                  Text(errorMsg),
                  const SizedBox(
                    height: 5,
                  ),
                  // GestureDetector(
                  //   onTap: () async {
                  //     if (_emailTextController.text.trim() ==
                  //         'admin@gmail.com') {}
                  //     try {
                  //       await FirebaseAuth.instance
                  //           .signInWithEmailAndPassword(
                  //               email: _emailTextController.text.trim(),
                  //               password: _passwordTextController.text.trim())
                  //           .then((value) => Navigator.push(
                  //               context,
                  //               MaterialPageRoute(
                  //                   builder: (context) =>
                  //                       const AddFoodItem())));
                  //     } on FirebaseAuthException catch (e) {
                  //       setState(() {
                  //         errorMsg = "Invalid Username or Password.";
                  //       });
                  //     }
                  //   },
                  //   child: const Text(
                  //     "Signup as Admin",
                  //     style: TextStyle(
                  //         color: Color.fromARGB(255, 0, 0, 0),
                  //         fontWeight: FontWeight.bold),
                  //   ),
                  // ),
                  signUpOption()
                ],
              ),
            ),
          ),
          // ],
          // ),
        ),
      ),
    );
  }

  Row signUpOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't have account?",
            style: TextStyle(color: Color.fromARGB(179, 255, 255, 255))),
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const SignUpScreen()));
          },
          child: const Text(
            " Sign Up",
            style: TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
                fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }

  // Widget forgetPassword(BuildContext context) {
  //   return Container(
  //     width: MediaQuery.of(context).size.width,
  //     height: 35,
  //     alignment: Alignment.bottomRight,
  //     child: TextButton(
  //       child: const Text(
  //         "Forgot Password?",
  //         style: TextStyle(color: Color.fromARGB(179, 0, 0, 0)),
  //         textAlign: TextAlign.right,
  //       ),
  //       onPressed: () => Navigator.push(context,
  //           MaterialPageRoute(builder: (context) => const SignInScreen())),
  //     ),
  //   );
  // }
}

// String _signIncheck(String emailx, String passwordx, BuildContext context) {
//   String errormsg;
//   void signIn(String emailx, String passwordx, BuildContext context) async {
//     try {
//       await FirebaseAuth.instance
//           .signInWithEmailAndPassword(email: emailx, password: passwordx)
//           .then((value) => Navigator.push(context,
//               MaterialPageRoute(builder: (context) => const Navbar())));
//     } on FirebaseAuthException catch (e) {
//       errormsg = "Invalid Username/Password";
//     }
//   }

//   signIn(emailx, passwordx, context);

//   return errormsg;
// }

