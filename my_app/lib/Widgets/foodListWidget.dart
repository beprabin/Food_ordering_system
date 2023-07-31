
// class FoodListWidget extends StatefulWidget {
//   final DocumentSnapshot? document;
//   FoodListWidget({super.key, this.document});

//   @override
//   State<FoodListWidget> createState() => _FoodListWidgetState();
// }

// class _FoodListWidgetState extends State<FoodListWidget> {
//   @override
//   Widget build(BuildContext context) {
//     List itemlist = [];
//     Future<List> getData() async {
//       QuerySnapshot querySnapshot =
//           await FirebaseFirestore.instance.collection('existingitemcart').get();

//       final allData = querySnapshot.docs.map((doc) => doc.data()).toList();
//       if (allData.isNotEmpty) {
//         itemlist = allData;
//       }
//       return allData;
//     }

//     Future<List> lst = getData();
//     bool isAddtocartbutton = true;
//     bool isaddedbutton = false;
//     bool flag = false;
//     if (itemlist.isNotEmpty) {
//       for (var i = 0; i < itemlist[0]['itemslist'].length; i++) {
//         if (itemlist[0]['itemslist'][i] == widget.document!['name']) {
//           flag = true;
//           break;
//         }
//       }
//     }
//     if (flag == true) {
//       setState(() {
//         isAddtocartbutton = false;
//         isaddedbutton = true;
//       });
//     } else {
//       setState(() {
//         isAddtocartbutton = true;
//         isaddedbutton = false;
//       });
//     }
//     return Padding(
//         padding: EdgeInsets.symmetric(vertical: 10),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             Container(
//               width: 380,
//               height: 280,
//               decoration: BoxDecoration(
//                   color: Colors.amberAccent,
//                   borderRadius: BorderRadius.circular(10),
//                   boxShadow: [
//                     BoxShadow(
//                         color: Colors.grey.withOpacity(0.5),
//                         spreadRadius: 2,
//                         blurRadius: 10,
//                         offset: Offset(0, 3))
//                   ]),
//               child: Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 10),
//                 child: Column(
//                   children: [
//                     Container(
//                       child: FadeInImage.assetNetwork(
//                         placeholder: 'assets/images/loading.png',
//                         image: "${widget.document!['image']}",
//                         width: MediaQuery.of(context).size.width,
//                         fit: BoxFit.cover,
//                         height: 170,
//                       ),
//                     ),
//                     Padding(
//                       padding: EdgeInsets.only(
//                           left: MediaQuery.of(context).size.width * 0.25,
//                           top: 10),
//                       child: Row(
//                         children: [
//                           Text(widget.document!['name'],
//                               style: TextStyle(
//                                   fontSize: 20, fontWeight: FontWeight.bold)),
//                           Text("    Rs. ${widget.document!['price']}",
//                               style: TextStyle(
//                                   fontSize: 15, fontStyle: FontStyle.italic)),
//                         ],
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(left: 20, right: 20),
//                       child: Column(
//                         children: [
//                           Visibility(
//                               visible: isAddtocartbutton,
//                               child: firebaseUIButton(context, "Add to Cart",
//                                   () async {
//                                 FirebaseFirestore.instance
//                                     .collection('CartItems')
//                                     .doc()
//                                     .set({
//                                   'name': widget.document!['name'],
//                                   'image': widget.document!['image'],
//                                   'price': widget.document!['price'],
//                                   'plates': 1
//                                 });
//                                 var collection = FirebaseFirestore.instance
//                                     .collection('existingitemcart');
//                                 var snapshots = await collection.get();
//                                 for (var doc in snapshots.docs) {
//                                   await doc.reference.delete();
//                                 }
//                                 setState(() {
//                                   itemlist[0]['itemslist']
//                                       .add(widget.document!['name']);
//                                 });
//                                 FirebaseFirestore.instance
//                                     .collection('existingitemcart')
//                                     .doc()
//                                     .set({
//                                   'itemslist': itemlist[0]['itemslist'],
//                                 });
//                               })),
//                           Visibility(
//                               visible: isaddedbutton,
//                               child: firebaseUIButton(
//                                   context, "Already Added", () async {})),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ));
//   }
// }





// return SingleChildScrollView(
//       scrollDirection: Axis.vertical,
//       child: Padding(
//         padding: EdgeInsets.symmetric(vertical: 15, horizontal: 5),
//         child: Column(
//           children: [
//             //1st row
//             Padding(
//                 padding: EdgeInsets.symmetric(vertical: 10),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     Container(
//                       width: 170,
//                       height: 225,
//                       decoration: BoxDecoration(
//                           color: Colors.amberAccent,
//                           borderRadius: BorderRadius.circular(10),
//                           boxShadow: [
//                             BoxShadow(
//                                 color: Colors.grey.withOpacity(0.5),
//                                 spreadRadius: 2,
//                                 blurRadius: 10,
//                                 offset: Offset(0, 3))
//                           ]),
//                       child: Padding(
//                         padding: EdgeInsets.symmetric(horizontal: 10),
//                         child: Column(
//                           children: [
//                             Container(
//                               child: Image.asset(
//                                 "assets/images/oizza.jpg",
//                                 height: 170,
//                               ),
//                             ),
//                             Text("Pizza",
//                                 style: TextStyle(
//                                     fontSize: 20, fontWeight: FontWeight.bold)),
//                             Text("Itallian dish",
//                                 style: TextStyle(
//                                     fontSize: 15, fontStyle: FontStyle.italic)),
//                             Text("Rs. 500",
//                                 style: TextStyle(
//                                   fontSize: 16,
//                                 )),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 )),
//             //3rd row
//             Padding(
//               padding: EdgeInsets.symmetric(vertical: 9),
//               child: Container(
//                 width: 380,
//                 height: 100,
//                 decoration: BoxDecoration(
//                     color: Colors.amberAccent,
//                     borderRadius: BorderRadius.circular(10),
//                     boxShadow: [
//                       BoxShadow(
//                           color: Colors.grey.withOpacity(0.5),
//                           spreadRadius: 3,
//                           blurRadius: 10,
//                           offset: Offset(0, 3)),
//                     ]),
//                 child: Row(
//                   children: [
//                     Container(
//                       alignment: Alignment.center,
//                       child: Image.asset(
//                         "assets/images/veg.webp",
//                         height: 80,
//                         width: 150,
//                       ),
//                     ),
//                     Container(
//                       width: 190,
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         mainAxisAlignment: MainAxisAlignment.spaceAround,
//                         children: [
//                           Text("Veg Momo",
//                               style: TextStyle(
//                                   fontSize: 20, fontWeight: FontWeight.bold)),
//                           Text("A Nepali dish with veggies stuffing",
//                               style: TextStyle(
//                                   fontSize: 15, fontStyle: FontStyle.italic)),
//                           Text("Rs. 150",
//                               style: TextStyle(
//                                 fontSize: 16,
//                               )),
//                         ],
//                       ),
//                     ),
//                     Padding(
//                       padding: EdgeInsets.symmetric(vertical: 5),
//                       child: Container(
//                         padding: EdgeInsets.all(5),
//                         decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(10),
//                             color: Colors.amber),
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             ),

//             //4th row
//           ],
//         ),
//       ),
//     );