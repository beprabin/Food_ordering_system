import 'package:my_app/packages.dart';

Image logoWidget(String imageName) {
  return Image.asset(
    imageName,
    fit: BoxFit.fitWidth,
    width: 240,
    height: 240,
  );
}

TextField reusableTextField(String text, IconData icon, bool isPasswordType,
    TextEditingController controller,
    {TextInputType txttype = TextInputType.text}) {
  return TextField(
    controller: controller,
    obscureText: isPasswordType,
    enableSuggestions: !isPasswordType,
    keyboardType: txttype,
    autocorrect: !isPasswordType,
    cursorColor: Colors.white,
    style: TextStyle(color: Colors.white.withOpacity(0.9)),
    decoration: InputDecoration(
      prefixIcon: Icon(
        icon,
        color: Colors.white70,
      ),
      labelText: text,
      labelStyle: TextStyle(
          color: const Color.fromARGB(255, 255, 255, 255).withOpacity(0.9)),
      filled: true,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      fillColor: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.6),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
    ),
  );
}

Container signInSignUpButton(
    BuildContext context, bool islogin, Function onTap) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 50,
    margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(90)),
    child: ElevatedButton(
      onPressed: () {
        onTap();
      },
      child: Text(
        islogin ? 'LOG IN' : 'SIGN UP',
        style: const TextStyle(
            color: Color.fromARGB(221, 255, 255, 255),
            fontWeight: FontWeight.bold,
            fontSize: 16),
      ),
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.pressed)) {
              return const Color.fromARGB(66, 255, 255, 255);
            }
            return Colors.white;
          }),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)))),
    ),
  );
}

Container firebaseUIButton(BuildContext context, String title, Function onTap) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 50,
    margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(90)),
    child: ElevatedButton(
      onPressed: () {
        onTap();
      },
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.pressed)) {
              return Color.fromARGB(255, 255, 255, 255);
            }
            return Color.fromARGB(255, 255, 255, 255);
          }),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)))),
      child: Text(
        title,
        style: const TextStyle(
            color: Color.fromARGB(221, 0, 0, 0),
            fontWeight: FontWeight.bold,
            fontSize: 16),
      ),
    ),
  );
}

Container AdminUIButton(BuildContext context, String title, Function onTap) {
  return Container(
    width: MediaQuery.of(context).size.width * 0.43,
    height: 100,
    margin: const EdgeInsets.fromLTRB(5, 10, 5, 10),
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(90)),
    child: ElevatedButton(
      onPressed: () {
        onTap();
      },
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.pressed)) {
              return Color.fromARGB(255, 255, 255, 255);
            }
            return Color.fromARGB(255, 255, 255, 255);
          }),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)))),
      child: Text(
        title,
        style: const TextStyle(
            color: Color.fromARGB(221, 0, 0, 0),
            fontWeight: FontWeight.bold,
            fontSize: 16),
      ),
    ),
  );
}

class FoodListWidget extends StatefulWidget {
  final DocumentSnapshot? document;
  FoodListWidget({super.key, this.document});

  @override
  State<FoodListWidget> createState() => _FoodListWidgetState();
}

class _FoodListWidgetState extends State<FoodListWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: 380,
              height: 280,
              decoration: BoxDecoration(
                  color: Colors.amberAccent,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 10,
                        offset: Offset(0, 3))
                  ]),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    Container(
                      child: FadeInImage.assetNetwork(
                        placeholder: 'assets/images/loading.png',
                        image: "${widget.document!['image']}",
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.cover,
                        height: 170,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.25,
                          top: 10),
                      child: Row(
                        children: [
                          Text(widget.document!['name'],
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                          Text("    Rs. ${widget.document!['price']}",
                              style: TextStyle(
                                  fontSize: 15, fontStyle: FontStyle.italic)),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        child: ElevatedButton(
                          child: Text("Add to Cart"),
                          onPressed: FLAGS.contains(widget.document!['name'])
                              ? null
                              : () {
                                  setState(() {
                                    flag = false;
                                    FirebaseFirestore.instance
                                        .collection('CartItems')
                                        .doc()
                                        .set({
                                      'name': widget.document!['name'],
                                      'image': widget.document!['image'],
                                      'price': widget.document!['price'],
                                      'plates': 1
                                    });
                                  });
                                  FLAGS.add(widget.document!['name']);
                                },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}


























// List itemlist = [];
// Future<void> getData() async {
//   QuerySnapshot querySnapshot =
//       await FirebaseFirestore.instance.collection('existingitemcart').get();

//   final allData = querySnapshot.docs.map((doc) => doc.data()).toList();
//   if (allData.isNotEmpty) {
//     itemlist = allData;
//   }
// }

// Widget foodListWidget(BuildContext context, DocumentSnapshot document) {
//   getData();
//   bool isAddtocartbutton = true;
//   bool isaddedbutton = false;
//   bool flag = false;
//   if (itemlist.isNotEmpty) {
//     for (var i = 0; i < itemlist[0]['itemslist'].length; i++) {
//       if (itemlist[0]['itemslist'][i] == document['name']) {
//         flag = true;
//         break;
//       }
//     }
//   }
//   if (flag == true) {
//     isAddtocartbutton = false;
//     isaddedbutton = true;
//   } else {
//     isAddtocartbutton = true;
//     isaddedbutton = false;
//   }
//   return Padding(
//       padding: EdgeInsets.symmetric(vertical: 10),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           Container(
//             width: 380,
//             height: 280,
//             decoration: BoxDecoration(
//                 color: Colors.amberAccent,
//                 borderRadius: BorderRadius.circular(10),
//                 boxShadow: [
//                   BoxShadow(
//                       color: Colors.grey.withOpacity(0.5),
//                       spreadRadius: 2,
//                       blurRadius: 10,
//                       offset: Offset(0, 3))
//                 ]),
//             child: Padding(
//               padding: EdgeInsets.symmetric(horizontal: 10),
//               child: Column(
//                 children: [
//                   Container(
//                     child: FadeInImage.assetNetwork(
//                       placeholder: 'assets/images/loading.png',
//                       image: "${document['image']}",
//                       width: MediaQuery.of(context).size.width,
//                       fit: BoxFit.cover,
//                       height: 170,
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.only(
//                         left: MediaQuery.of(context).size.width * 0.25,
//                         top: 10),
//                     child: Row(
//                       children: [
//                         Text(document['name'],
//                             style: TextStyle(
//                                 fontSize: 20, fontWeight: FontWeight.bold)),
//                         Text("    Rs. ${document['price']}",
//                             style: TextStyle(
//                                 fontSize: 15, fontStyle: FontStyle.italic)),
//                       ],
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(left: 20, right: 20),
//                     child: Column(
//                       children: [
//                         Visibility(
//                             visible: isAddtocartbutton,
//                             child: firebaseUIButton(
//                                 context, "Add to Cart", () async {})),
//                         Visibility(
//                             visible: isaddedbutton,
//                             child: firebaseUIButton(
//                                 context, "existing", () async {})),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ));
// }















 // child: firebaseUIButton(context, "Add to cart", () async {
                    //   FirebaseFirestore.instance
                    //       .collection('CartItems')
                    //       .doc()
                    //       .set({
                    //     'name': document['name'],
                    //     'image': document['image'],
                    //     'price': document['price'],
                    //     'plates': 1
                    //   });

                    // List searchResult = snapshots.data;
                    // final result = FirebaseFirestore.instance
                    //     .collection('CartItems')
                    //     .where('name', isEqualTo: document['name'])
                    //     .snapshots();

                    // // searchResult = result.docs.map((e) => e.data()).toList();
                    // print(result(document));
                    // if (true) {
                    // } else {
                    //   // if (document['plates'] < 10) {
                    //   //   document.reference
                    //   //       .update({'plates': document['plates'] + 1});
                    //   // }
                    // }

                    // }),
