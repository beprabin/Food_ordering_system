import 'package:flutter/cupertino.dart';
import 'package:my_app/Pages/notification.dart';
import 'package:my_app/packages.dart';

class AppBarWidget extends StatefulWidget {
  const AppBarWidget({super.key});

  @override
  State<AppBarWidget> createState() => _AppBarWidgetState();
}

class _AppBarWidgetState extends State<AppBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Visibility(
        //   visible: true,
        //   child: SizedBox(
        //     height: 0,
        //     child: StreamBuilder(
        //         stream: FirebaseFirestore.instance
        //             .collection('notification')
        //             .snapshots(),
        //         builder:
        //             ((context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
        //           return ListView.builder(
        //               itemCount: streamSnapshot.data?.docs.length,
        //               itemBuilder: (context, index) {
        //                 final DocumentSnapshot document =
        //                     streamSnapshot.data!.docs[index];
        //                 setState(() {
        //                   notify = document['notify'];
        //                 });
        //                 print(
        //                     "llllllllllllllllllllllllllllllllllllllllllllll $notify");
        //               });
        //         })),
        //   ),
        // ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            InkWell(
              onTap: () {
                Scaffold.of(context).openDrawer();
              },
              child: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 10,
                          offset: Offset(0, 3)),
                    ]),
                child: Icon(CupertinoIcons.bars),
              ),
            ),
            Text(
              "Deurali Restaurant",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NotifyStaff()),
                );
              },
              child: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 10,
                          offset: Offset(0, 3)),
                    ]),
                child: (notify == true)
                    ? Icon(
                        Icons.notifications_active,
                        color: Colors.red,
                      )
                    : Icon(Icons.notifications),
              ),
            )
          ]),
        ),
      ],
    );
  }
}
