import 'package:flutter/cupertino.dart';
import 'package:my_app/packages.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isHomeScreenVisible = true;
  bool isCartPageVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: Stack(
        children: [
          Visibility(
            visible: isHomeScreenVisible,
            child: ListView(
              children: [
                //App widget
                AppBarWidget(),
                //Categories
                // Padding(
                //   padding: EdgeInsets.only(
                //     top: 20,
                //     left: 20,
                //   ),
                //   child: Text(
                //     "Categories",
                //     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                //   ),
                // ),
                //Categories widget
                CategoriesWidget(),
                //Food Items
                Center(
                  // padding: EdgeInsets.only(
                  //   top: 20,
                  //   left: 180,
                  // ),
                  child: Text(
                    "Our Menus",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),

                SingleChildScrollView(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.81,
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
                            final DocumentSnapshot documentSnapshot =
                                streamSnapshot.data!.docs[index];
                            return foodListWidget(context, documentSnapshot);
                          },
                        );
                      }),
                    ),
                  ),
                )
              ],
            ),
          ),
          Visibility(visible: isCartPageVisible, child: CartPage())
        ],
      ),
      drawer: DrawerWidget(),

      //Cartpage
      floatingActionButton: Container(
        decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(20), boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 10,
              offset: Offset(0, 3))
        ]),
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CartPage()),
            );
            // if (isCartPageVisible == true) {
            //   setState(() {
            //     isHomeScreenVisible = true;
            //     isCartPageVisible = false;
            //   });
            // } else {
            //   setState(() {
            //     isHomeScreenVisible = false;
            //     isCartPageVisible = true;
            //   });
            // }
          },
          child: Icon(
            CupertinoIcons.cart,
            size: 28,
            color: Colors.white,
          ),
          backgroundColor: Colors.amber,
        ),

        //end cartpage
      ),
    );
  }
}
