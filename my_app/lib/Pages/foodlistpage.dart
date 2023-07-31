import 'package:my_app/packages.dart';

class FoodlistforAdmin extends StatefulWidget {
  const FoodlistforAdmin({super.key});

  @override
  State<FoodlistforAdmin> createState() => _FoodlistforAdminState();
}

class _FoodlistforAdminState extends State<FoodlistforAdmin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.amber,
        appBar: AppBar(
          leading: const BackButton(
            color: Colors.black, // <-- SEE HERE
          ),
          centerTitle: true,
          title: Text(
            "Food List",
          ),
          iconTheme: IconThemeData(
            color: Colors.black, // <-- SEE HERE
          ),
        ),
        body: SafeArea(
          child: ListView(
            children: [
              //cartlist items
              SingleChildScrollView(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.85,
                  child: StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection('Foods')
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
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      child: FadeInImage.assetNetwork(
                                        placeholder:
                                            'assets/images/loading.png',
                                        image: "${document['image']}",
                                        width: 100,
                                        fit: BoxFit.cover,
                                        height: 100,
                                      ),
                                    ),
                                    SizedBox(width: 5),
                                    Container(
                                      width: 160,
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
                                    Padding(
                                      padding: const EdgeInsets.only(left: 24),
                                      child: GestureDetector(
                                        child: Icon(
                                          Icons.edit,
                                          size: 32,
                                          color: Colors.white,
                                        ),
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    EditFoodItem(
                                                        documentId: document
                                                            .reference.id,
                                                        document: document)),
                                          );
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
