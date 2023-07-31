import 'package:flutter/cupertino.dart';
import 'package:my_app/Pages/records.dart';
import 'package:my_app/packages.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({super.key});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  String emails = FirebaseAuth.instance.currentUser!.email.toString();
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.amber,
      child: ListView(children: [
        DrawerHeader(
          child: SingleChildScrollView(
            child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.8,
                child: StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection('staff')
                        .where('email', isEqualTo: emails)
                        .snapshots(),
                    builder: ((context,
                        AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                      if (!streamSnapshot.hasData)
                        return const Text('Loading...');
                      return ListView.builder(
                          itemCount: streamSnapshot.data?.docs.length,
                          itemBuilder: (context, index) {
                            final DocumentSnapshot document =
                                streamSnapshot.data!.docs[index];
                            var dummymail = document['email'];
                            return UserAccountsDrawerHeader(
                              currentAccountPicture: CircleAvatar(
                                  backgroundImage:
                                      AssetImage("assets/images/gum.jpg")),
                              accountName: Text("${document['name']}"),
                              accountEmail: Column(
                                children: [
                                  Text(
                                    "${dummymail.toString().substring(
                                          5,
                                        )}",
                                  ),
                                ],
                              ),
                            );
                          });
                    }))),
            // padding: EdgeInsets.zero,
            // child: UserAccountsDrawerHeader(
            //   accountName: Text(""),
            //   accountEmail: Text("staff@gmail.com"),
            //   currentAccountPicture: CircleAvatar(
            //       backgroundImage: AssetImage("assets/images/logo.png")),
            // )
          ),
        ),
        ListTile(
          leading: Icon(
            CupertinoIcons.home,
            color: Colors.white,
          ),
          title: GestureDetector(
            onTap: () {
              setState(() {
                FirebaseAuth.instance.signOut().then((value) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomeScreen()));
                });
              });
            },
            child: Text(
              "Home",
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ),
        ),
        ListTile(
          leading: Icon(
            Icons.info_outline_rounded,
            color: Colors.white,
          ),
          title: GestureDetector(
            onTap: () {
              setState(() {
                FirebaseAuth.instance.signOut().then((value) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => RecordsPage()));
                });
              });
            },
            child: Text(
              "Records",
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ),
        ),
        ListTile(
          leading: Icon(
            Icons.logout,
            color: Colors.white,
          ),
          title: GestureDetector(
            onTap: () {
              setState(() {
                FirebaseAuth.instance.signOut().then((value) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignInScreen()));
                });
              });
            },
            child: Text(
              "Logout",
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ),
        )
      ]),
    );
  }
}
