import 'package:my_app/packages.dart';

class NotifyStaff extends StatefulWidget {
  const NotifyStaff({super.key});

  @override
  State<NotifyStaff> createState() => _NotifyStaffState();
}

class _NotifyStaffState extends State<NotifyStaff> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Pick up",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.amber,
      body: Column(
        children: [
          SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.81,
              child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('notification')
                    .snapshots(),
                builder:
                    ((context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                  if (!streamSnapshot.hasData) return const Text('Loading...');

                  return ListView.builder(
                    itemCount: streamSnapshot.data?.docs.length,
                    itemBuilder: (context, index) {
                      final DocumentSnapshot document =
                          streamSnapshot.data!.docs[index];

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
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10, top: 10),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("${document['tablename']}",
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          )),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text("${document['delivered_by']}",
                                          style: TextStyle(
                                            fontSize: 20,
                                          )),
                                    ],
                                  ),
                                ),
                                firebaseUIButton(
                                    context,
                                    'Received',
                                    () => {
                                          //                         var coll = FirebaseFirestore.instance.collection('notification');
                                          // var snapshots = await coll.get();

                                          // for (var doc in snapshots.docs) {
                                          //   await doc.reference.delete();
                                          // }
                                          // FirebaseFirestore.instance.collection('notification').doc().set({
                                          //   'name': items,
                                          //   'plates': qty,
                                          //   'price': price,
                                          //   'totalprice': total,
                                          //   'tablename': table,
                                          //   'time': formatted,
                                          //   'handled_by':
                                          //       FirebaseAuth.instance.currentUser!.email.toString()
                                          // });
                                        }),
                                SizedBox(
                                  height: 20,
                                )
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
        ],
      ),
    );
  }
}
