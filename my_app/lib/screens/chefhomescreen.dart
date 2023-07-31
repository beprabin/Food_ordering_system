import 'package:my_app/Pages/notification.dart';
import 'package:my_app/packages.dart';

class ChefLandingScreen extends StatefulWidget {
  const ChefLandingScreen({super.key});

  @override
  State<ChefLandingScreen> createState() => _ChefLandingScreenState();
}

class _ChefLandingScreenState extends State<ChefLandingScreen> {
  DocumentSnapshot? documentname;
  String? emailss = FirebaseAuth.instance.currentUser!.email.toString();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: SafeArea(
        child: Column(
          children: [
            ListTile(
              leading: Image.asset("assets/images/logo.png"),
              title: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.042,
                    child: StreamBuilder(
                        stream: FirebaseFirestore.instance
                            .collection('staff')
                            .where('email', isEqualTo: emailss)
                            .snapshots(),
                        builder: ((context,
                            AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                          if (!streamSnapshot.hasData)
                            return const Text('Loading...');
                          return ListView.builder(
                              itemCount: streamSnapshot.data?.docs.length,
                              itemBuilder: (context, index) {
                                documentname = streamSnapshot.data!.docs[index];
                                return Text(
                                  "Chef: ${documentname!['name']}",
                                  style: TextStyle(fontSize: 22),
                                );
                              });
                        })),
                  ),
                ],
              ),
              //  Text(
              //   "${FirebaseAuth.instance.currentUser!.email.toString()}",
              //   style: TextStyle(
              //       fontWeight: FontWeight.bold,
              //       color: Colors.black,
              //       fontSize: 24),
              // ),
              trailing: IconButton(
                  onPressed: () {
                    setState(() {
                      FirebaseAuth.instance.signOut().then((value) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignInScreen()));
                      });
                    });
                  },
                  icon: Icon(
                    Icons.logout_rounded,
                    color: Colors.black,
                  )),
            ),
            Text(
              "Orders",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SingleChildScrollView(
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.81,
                child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('allorders')
                      .snapshots(),
                  builder:
                      ((context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                    if (!streamSnapshot.hasData)
                      return const Text('Loading...');

                    return ListView.builder(
                      itemCount: streamSnapshot.data?.docs.length,
                      itemBuilder: (context, index) {
                        final DocumentSnapshot document =
                            streamSnapshot.data!.docs[index];
                        if (document['delivered_by'] == null) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 200,
                              decoration: BoxDecoration(
                                  color: Colors.amberAccent,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 3,
                                        blurRadius: 10,
                                        offset: Offset(0, 3)),
                                  ]),
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, right: 10),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding:
                                          EdgeInsets.only(bottom: 10, top: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text("${document['tablename']}",
                                              style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                              )),
                                        ],
                                      ),
                                    ),
                                    Divider(
                                      color: Colors.black,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Text("Particular ",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold)),
                                        Text("Quantity ",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold)),
                                      ],
                                    ),
                                    Divider(
                                      color: Colors.black,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Column(
                                      children: [
                                        for (int i = 0;
                                            i < document['name'].length;
                                            i++)
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Text("${document['name'][i]}",
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                  )),
                                              Text("${document['plates'][i]}",
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                  )),
                                            ],
                                          ),
                                      ],
                                    ),
                                    Divider(
                                      color: Colors.black,
                                    ),
                                    firebaseUIButton(
                                        context,
                                        'Delivered',
                                        () => {
                                              document.reference.update({
                                                'delivered_by':
                                                    documentname!['name']
                                              }),
                                              FirebaseFirestore.instance
                                                  .collection('notification')
                                                  .doc()
                                                  .set({
                                                'tablename':
                                                    document['tablename'],
                                                'delivered_by':
                                                    documentname!['name']
                                              }),
                                              notify = true
                                            }),
                                    SizedBox(
                                      height: 20,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        } else {
                          return SizedBox();
                        }
                      },
                    );
                  }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


// 3 rows = table, head, totalprice
// head row = 2column = 1st column = row = row ko first data = particular, ani aru data => stream builder food items
// head row = 2column = 2nd column = row = row ko first data = quantity, ani aru data => stream builder plates

