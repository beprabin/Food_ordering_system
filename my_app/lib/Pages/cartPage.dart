import 'package:flutter/cupertino.dart';
import 'package:my_app/packages.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: ListView(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  AppBarWidget(),
                  Padding(
                    padding: EdgeInsets.only(top: 20, left: 10, bottom: 10),
                    child: Text(
                      "Ordered List",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ),

                  //Items
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 9),
                    child: Container(
                      width: 380,
                      height: 100,
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
                      child: Row(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            child: Image.asset(
                              "assets/images/veg.webp",
                              height: 80,
                              width: 150,
                            ),
                          ),
                          Container(
                            width: 190,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text("Veg Momo",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                                Text("A Nepali dish with veggies stuffing",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontStyle: FontStyle.italic)),
                                Text("Rs. 150",
                                    style: TextStyle(
                                      fontSize: 16,
                                    )),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 5),
                            child: Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.amber),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Icon(
                                    CupertinoIcons.minus,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    "1",
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.white),
                                  ),
                                  Icon(
                                    CupertinoIcons.minus,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 9),
                    child: Container(
                      width: 380,
                      height: 100,
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
                      child: Row(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            child: Image.asset(
                              "assets/images/chopsey.jpg",
                              height: 80,
                              width: 150,
                            ),
                          ),
                          Container(
                            width: 190,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text("Chopsey",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                                Text("An American dish",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontStyle: FontStyle.italic)),
                                Text("Rs. 500",
                                    style: TextStyle(
                                      fontSize: 16,
                                    )),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 5),
                            child: Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.amber),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Icon(
                                    CupertinoIcons.minus,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    "2",
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.white),
                                  ),
                                  Icon(
                                    CupertinoIcons.minus,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
