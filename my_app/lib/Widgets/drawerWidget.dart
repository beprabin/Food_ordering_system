import 'package:flutter/cupertino.dart';
import 'package:my_app/packages.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({super.key});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.amber,
      child: ListView(children: [
        DrawerHeader(
            padding: EdgeInsets.zero,
            child: UserAccountsDrawerHeader(
              accountName: Text("Staff"),
              accountEmail: Text("staff@gmail.com"),
              currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage("assets/images/logo.png")),
            )),
        ListTile(
          leading: Icon(
            CupertinoIcons.home,
            color: Colors.white,
          ),
          title: Text(
            "Home",
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
        ListTile(
          leading: Icon(
            CupertinoIcons.cart,
            color: Colors.white,
          ),
          title: Text(
            "Orders",
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
        ListTile(
          leading: Icon(
            Icons.logout,
            color: Colors.white,
          ),
          title: Text(
            "Logout",
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        )
      ]),
    );
  }
}
