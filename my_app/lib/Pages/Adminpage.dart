import 'package:my_app/packages.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({super.key});

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                ListTile(
                  leading: Image.asset("assets/images/logo.png"),
                  title: Text(
                    "Admin Panel",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 24),
                  ),
                  trailing: IconButton(
                      onPressed: () {
                        setState(() {
                          FirebaseAuth.instance.signOut().then((value) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const SignInScreen()));
                          });
                        });
                      },
                      icon: Icon(
                        Icons.logout_rounded,
                        color: Colors.black,
                      )),
                ),
                SizedBox(height: 20),
                Row(children: [
                  //Single Item
                  AdminUIButton(context, "Add Food", () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AddFoodItem()),
                    );
                  }),
                  AdminUIButton(context, "Food List", () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FoodlistforAdmin()),
                    );
                  }),
                ]),
                Row(children: [
                  //Single Item
                  AdminUIButton(context, "Add User", () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignUpScreen()),
                    );
                  }),
                  AdminUIButton(context, "User List", () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => UserListPage()),
                    );
                  }),
                ]),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
