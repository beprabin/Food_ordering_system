import 'package:my_app/packages.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (FirebaseAuth.instance.currentUser!.email.toString() ==
              "admin@gmail.com") {
            return const AddFoodItem();
          } else {
            return HomeScreen();
          }
        } else {
          return const SignInScreen();
        }
      },
    );
  }
}
