import 'package:my_app/packages.dart';

class FoodListWidget extends StatefulWidget {
  const FoodListWidget({super.key});

  @override
  State<FoodListWidget> createState() => _FoodListWidgetState();
}

class _FoodListWidgetState extends State<FoodListWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 5),
        child: Column(
          children: [
            //1st row
            Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 170,
                      height: 225,
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
                              child: Image.asset(
                                "assets/images/oizza.jpg",
                                height: 130,
                              ),
                            ),
                            Text("Pizza",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold)),
                            Text("Itallian dish",
                                style: TextStyle(
                                    fontSize: 15, fontStyle: FontStyle.italic)),
                            Text("Rs. 500",
                                style: TextStyle(
                                  fontSize: 16,
                                )),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 170,
                      height: 225,
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
                              child: Image.asset(
                                "assets/images/friedrice.webp",
                                height: 130,
                              ),
                            ),
                            Text("Fried Rice",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold)),
                            Text("A stomach filling dish",
                                style: TextStyle(
                                    fontSize: 15, fontStyle: FontStyle.italic)),
                            Text("Rs. 150",
                                style: TextStyle(
                                  fontSize: 16,
                                )),
                          ],
                        ),
                      ),
                    ),
                  ],
                )),
            Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 170,
                      height: 225,
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
                              child: Image.asset(
                                "assets/images/momo.jpg",
                                height: 130,
                              ),
                            ),
                            Text("Buff Momo",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold)),
                            Text("A Nepali dish with meat stuffing",
                                style: TextStyle(
                                    fontSize: 15, fontStyle: FontStyle.italic)),
                            Text("Rs. 200",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                )),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 170,
                      height: 225,
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
                              child: Image.asset(
                                "assets/images/khajaset.jpg",
                                height: 130,
                              ),
                            ),
                            Text("Khaja Set",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold)),
                            Text("A Nepali dish ",
                                style: TextStyle(
                                    fontSize: 15, fontStyle: FontStyle.italic)),
                            Text("Rs. 350",
                                style: TextStyle(
                                  fontSize: 16,
                                )),
                          ],
                        ),
                      ),
                    ),
                  ],
                )),
            //3rd row
            Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 170,
                      height: 225,
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
                              child: Image.asset(
                                "assets/images/chowmein.jpg",
                                height: 130,
                              ),
                            ),
                            Text("Chowmein",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold)),
                            Text("A fried noodle",
                                style: TextStyle(
                                    fontSize: 15, fontStyle: FontStyle.italic)),
                            Text("Rs. 100",
                                style: TextStyle(
                                  fontSize: 16,
                                )),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 170,
                      height: 225,
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
                              child: Image.asset(
                                "assets/images/biryani.jpg",
                                height: 130,
                              ),
                            ),
                            Text("Biryani",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold)),
                            Text("A rich rice with meat",
                                style: TextStyle(
                                    fontSize: 15, fontStyle: FontStyle.italic)),
                            Text("Rs. 350",
                                style: TextStyle(
                                  fontSize: 16,
                                )),
                          ],
                        ),
                      ),
                    ),
                  ],
                )),

            //4th row
            Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 170,
                      height: 225,
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
                              child: Image.asset(
                                "assets/images/chopsey.jpg",
                                height: 130,
                              ),
                            ),
                            Text("Chopsey",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold)),
                            Text("An American dish",
                                style: TextStyle(
                                    fontSize: 15, fontStyle: FontStyle.italic)),
                            Text("Rs. 500",
                                style: TextStyle(
                                  fontSize: 16,
                                )),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 170,
                      height: 225,
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
                              child: Image.asset(
                                "assets/images/oizza.jpg",
                                height: 130,
                              ),
                            ),
                            Text("Pizza",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold)),
                            Text("Itallian dish",
                                style: TextStyle(
                                    fontSize: 15, fontStyle: FontStyle.italic)),
                            Text("Rs. 500",
                                style: TextStyle(
                                  fontSize: 16,
                                )),
                          ],
                        ),
                      ),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
