import 'package:flutter/cupertino.dart';
import 'package:my_app/Pages/orderPage.dart';
import 'package:my_app/packages.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();

  //static void removeAt(int index) {}
}

class _CartPageState extends State<CartPage> {
  final List<String> tablenumber = [
    'Table 1',
    'Table 2',
    'Table 3',
    'Table 4',
    'Table 5',
    'Table 6',
    'Table 7',
    'Table 8',
  ];
  // final _db = FirebaseFirestore.instance.collection("CartItems").doc();
  String? selectedValue;
  List<String> items = [];
  int total = 0;
  String table = "";
  @override
  Widget build(BuildContext context) {
    return
        //  SizedBox(
        //   width: 200,
        //   height: 200,
        //   child: Text("Cart Box"),
        // );
        Scaffold(
      appBar: AppBar(
        title: Text(
          "Items on cart",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.amber,
      body: ListView(
        children: [
          SizedBox(height: 15),
          Center(
            child: DropdownButtonHideUnderline(
              child: DropdownButton2<String>(
                isExpanded: true,
                hint: const Row(
                  children: [
                    Icon(
                      Icons.list,
                      size: 16,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Expanded(
                      child: Text(
                        'Select Table Number',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                items: tablenumber
                    .map((String item) => DropdownMenuItem<String>(
                          value: item,
                          child: Text(
                            item,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ))
                    .toList(),
                value: selectedValue,
                onChanged: (String? value) {
                  setState(() {
                    selectedValue = value;
                    table = selectedValue!;
                  });
                },
                buttonStyleData: ButtonStyleData(
                  height: 50,
                  width: 200,
                  padding: const EdgeInsets.only(left: 14, right: 14),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                      color: Colors.black26,
                    ),
                    color: Colors.redAccent,
                  ),
                  elevation: 2,
                ),
                iconStyleData: const IconStyleData(
                  icon: Icon(
                    Icons.arrow_forward_ios_outlined,
                  ),
                  iconSize: 14,
                  iconEnabledColor: Colors.white,
                  iconDisabledColor: Colors.white,
                ),
                dropdownStyleData: DropdownStyleData(
                  maxHeight: 300,
                  width: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: Colors.amberAccent,
                  ),
                  offset: const Offset(2, 0),
                  scrollbarTheme: ScrollbarThemeData(
                    radius: const Radius.circular(40),
                    thickness: MaterialStateProperty.all<double>(6),
                    thumbVisibility: MaterialStateProperty.all<bool>(true),
                  ),
                ),
                menuItemStyleData: const MenuItemStyleData(
                  height: 40,
                  padding: EdgeInsets.only(left: 24, right: 14),
                ),
              ),
            ),
          ),
          SizedBox(height: 15),
          //cartlist items
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
                  items.clear();
                  total = 0;
                  return ListView.builder(
                    itemCount: streamSnapshot.data?.docs.length,
                    itemBuilder: (context, index) {
                      final DocumentSnapshot document =
                          streamSnapshot.data!.docs[index];
                      //print(streamSnapshot.data!.docs[index].reference);
                      int qty = document['plates'];
                      items.add(document['name']);
                      total += int.parse(document['price']) * qty;

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
                                          .collection("CartItems")
                                          .doc(document.reference.id)
                                          .delete();
                                      items.remove("${document['name']}");
                                      total =
                                          total - int.parse(document['price']);
                                      FLAGS.remove(document['name']);
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
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: firebaseUIButton(context, "Order", () async {
              if (table != "" && total != 0 && items.isNotEmpty) {
                flag = true;
                FirebaseFirestore.instance.collection('allorders').doc().set(
                    {'name': items, 'totalprice': total, 'tablename': table});
                var coll = FirebaseFirestore.instance.collection('orders');
                var snapshots = await coll.get();
                for (var doc in snapshots.docs) {
                  await doc.reference.delete();
                }
                FirebaseFirestore.instance.collection('orders').doc().set(
                    {'name': items, 'totalprice': total, 'tablename': table});
                items.clear();
                FLAGS.clear();
                total = 0;
                var collection =
                    FirebaseFirestore.instance.collection('CartItems');
                var snap = await collection.get();
                for (var doc in snap.docs) {
                  await doc.reference.delete();
                }
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => OrderPage()),
                );
              }
            }),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: firebaseUIButton(context, "Reset", () async {
              // FirebaseFirestore.instance.collection('CartItems').delete();
              items.clear();
              total = 0;
              FLAGS.clear();
              var collection =
                  FirebaseFirestore.instance.collection('CartItems');
              var snapshots = await collection.get();
              for (var doc in snapshots.docs) {
                await doc.reference.delete();
              }
              var coll =
                  FirebaseFirestore.instance.collection('existingitemcart');
              var snaps = await coll.get();
              for (var doc in snaps.docs) {
                await doc.reference.delete();
              }
            }),
          ),
        ],
      ),
    );
  }
}
