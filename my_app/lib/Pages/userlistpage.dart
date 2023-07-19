import 'package:my_app/packages.dart';

class UserListPage extends StatefulWidget {
  const UserListPage({super.key});

  @override
  State<UserListPage> createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.amber,
        body: SafeArea(
          child: ListView(
            children: [
              SizedBox(
                height: 10,
              ),
              Center(
                child: Text(
                  "User List",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
                ),
              ),
              //cartlist items
              SingleChildScrollView(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.85,
                  child: StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection('staff')
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
                          //print(streamSnapshot.data!.docs[index].reference);
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 380,
                              height: 130,
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
                                child: Row(
                                  children: [
                                    SizedBox(width: 5),
                                    Container(
                                      width: 260,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Text("${document['name']}",
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold)),
                                          Text("${document['email']}",
                                              style: TextStyle(
                                                fontSize: 16,
                                              )),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 24),
                                      child: GestureDetector(
                                        child: Icon(
                                          Icons.edit_document,
                                          size: 32,
                                          color: Colors.white,
                                        ),
                                        onTap: () {
                                          FirebaseFirestore.instance
                                              .collection("Foods")
                                              .doc(document.reference.id)
                                              .delete();
                                        },
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 24),
                                      child: GestureDetector(
                                        child: Icon(
                                          Icons.delete_outline_rounded,
                                          size: 32,
                                          color: Colors.white,
                                        ),
                                        onTap: () {
                                          FirebaseFirestore.instance
                                              .collection("Foods")
                                              .doc(document.reference.id)
                                              .delete();
                                          FirebaseFirestore.instance
                                              .collection("CartItems")
                                              .doc(document.reference.id)
                                              .delete();
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    }),
                  ),
                ),
              ),
              //end of cartlistview
            ],
          ),
        ));
  }
}
