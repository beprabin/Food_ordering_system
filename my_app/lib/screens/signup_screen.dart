import 'package:my_app/packages.dart';

// ignore_for_file: library_private_types_in_public_api, unused_catch_clause

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _retypepasswordTextController =
      TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _userNameTextController = TextEditingController();

  final fireStore = FirebaseFirestore.instance.collection('staff');
  String errorMsg = "";
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.amber,
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          leading: const BackButton(
            color: Colors.black, // <-- SEE HERE
          ),
          centerTitle: true,
          title: Text(
            "Sign up New User",
          ),
          iconTheme: IconThemeData(
            color: Colors.black, // <-- SEE HERE
          ),
        ),
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 120, 20, 0),
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 20,
              ),
              reusableTextField("Enter UserName", Icons.person_outline, false,
                  _userNameTextController,
                  txttype: TextInputType.text),
              const SizedBox(
                height: 20,
              ),
              reusableTextField("Enter Email Id", Icons.email_outlined, false,
                  _emailTextController,
                  txttype: TextInputType.emailAddress),
              const SizedBox(
                height: 20,
              ),
              reusableTextField("Enter Password", Icons.lock_outlined, true,
                  _passwordTextController,
                  txttype: TextInputType.visiblePassword),
              const SizedBox(
                height: 20,
              ),
              reusableTextField(
                  "ReType Password",
                  Icons.lock_outlined,
                  true,
                  txttype: TextInputType.visiblePassword,
                  _retypepasswordTextController),
              const SizedBox(
                height: 20,
              ),
              firebaseUIButton(context, "Add Staff", () async {
                if (_retypepasswordTextController.text ==
                    _passwordTextController.text) {
                  try {
                    await FirebaseAuth.instance
                        .createUserWithEmailAndPassword(
                            email: "user_${_emailTextController.text}",
                            password: _passwordTextController.text)
                        .then((value) {
                      fireStore.doc().set({
                        'email': "user_${_emailTextController.text}",
                        'name': _userNameTextController.text,
                      }).then((value) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const AdminPage()));
                      }).onError((error, stackTrace) {
                        setState(() {
                          errorMsg = "something wrong.";
                        });
                      });
                    });
                  } on FirebaseAuthException catch (e) {
                    setState(() {
                      errorMsg = "Invalid Username or Password";
                    });
                  }
                } else {
                  setState(() {
                    errorMsg = "Password didn't match.";
                  });
                }
              }),
              firebaseUIButton(context, "Add Chef", () async {
                if (_retypepasswordTextController.text ==
                    _passwordTextController.text) {
                  try {
                    await FirebaseAuth.instance
                        .createUserWithEmailAndPassword(
                            email: "chef_${_emailTextController.text}",
                            password: _passwordTextController.text)
                        .then((value) {
                      fireStore.doc().set({
                        'email': "chef_${_emailTextController.text}",
                        'name': _userNameTextController.text,
                      }).then((value) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const AdminPage()));
                      }).onError((error, stackTrace) {
                        setState(() {
                          errorMsg = "something wrong.";
                        });
                      });
                    });
                  } on FirebaseAuthException catch (e) {
                    setState(() {
                      errorMsg = "Invalid Username or Password";
                    });
                  }
                } else {
                  setState(() {
                    errorMsg = "Password didn't match.";
                  });
                }
              }),
              const SizedBox(
                height: 5,
              ),
              Text(errorMsg),
              const SizedBox(
                height: 5,
              ),
            ],
          ),
        )),
      ),
    );
  }
}
