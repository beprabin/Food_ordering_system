import 'package:flutter/cupertino.dart';
import 'package:my_app/packages.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Orders",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        backgroundColor: Colors.amber,
        body: ListView(children: [
          //ordered list items
          SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.64,
              child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('CartItems')
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
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Row(
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  child: FadeInImage.assetNetwork(
                                    placeholder: 'assets/images/loading.png',
                                    image: "${document['image']}",
                                    width: 130,
                                    fit: BoxFit.cover,
                                    height: 100,
                                  ),
                                ),
                                SizedBox(width: 5),
                                Container(
                                  width: 190,
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
                                      Text("Rs. ${document['price']}",
                                          style: TextStyle(
                                            fontSize: 16,
                                          )),
                                    ],
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.amber),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      GestureDetector(
                                        child: Icon(
                                          CupertinoIcons.add,
                                          size: 32,
                                          color: Colors.white,
                                        ),
                                        onTap: () {
                                          if (document['plates'] < 10) {
                                            document.reference.update({
                                              'plates': document['plates'] + 1
                                            });
                                          }
                                        },
                                      ),
                                      Text(
                                        "${document['plates']}",
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.white),
                                      ),
                                      GestureDetector(
                                        child: Icon(
                                          CupertinoIcons.minus,
                                          size: 32,
                                          color: Colors.white,
                                        ),
                                        onTap: () {
                                          if (document['plates'] > 1)
                                            document.reference.update({
                                              'plates': document['plates'] - 1
                                            });
                                        },
                                      ),
                                    ],
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
        ]));
  }
}
