import 'package:flutter/cupertino.dart';
import 'package:my_app/packages.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: ListView(
        children: [
          //App widget
          AppBarWidget(),

          //Categories
          Padding(
            padding: EdgeInsets.only(
              top: 20,
              left: 20,
            ),
            child: Text(
              "Categories",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),

          //Categories widget
          CategoriesWidget(),

          //Food Items
          Padding(
            padding: EdgeInsets.only(
              top: 20,
              left: 180,
            ),
            child: Text(
              "Our Menus",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          FoodListWidget(),
        ],
      ),
      drawer: DrawerWidget(),
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
            Navigator.pushNamed(context, "cartPage");
          },
          child: Icon(
            CupertinoIcons.cart,
            size: 28,
            color: Colors.white,
          ),
          backgroundColor: Colors.amber,
        ),
      ),
    );
  }
}
