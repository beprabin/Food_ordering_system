import 'package:my_app/packages.dart';

class CategoriesWidget extends StatefulWidget {
  const CategoriesWidget({super.key});

  @override
  State<CategoriesWidget> createState() => _CategoriesWidgetState();
}

class _CategoriesWidgetState extends State<CategoriesWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 5),
        child: Row(
          children: [
            //Single Item

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                padding: EdgeInsets.all(8),
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
                child: Image.asset(
                  "assets/images/bug.jpg",
                  width: 170,
                  height: 100,
                ),
              ),
            ),

            //Single Item

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                padding: EdgeInsets.all(8),
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
                child: Image.asset(
                  "assets/images/coke.webp",
                  width: 170,
                  height: 100,
                ),
              ),
            ),

            //Single Item

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                padding: EdgeInsets.all(8),
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
                child: Image.asset(
                  "assets/images/momomo.jpg",
                  width: 170,
                  height: 100,
                ),
              ),
            ),

            //Single Item

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                padding: EdgeInsets.all(8),
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
                child: Image.asset(
                  "assets/images/hot.jpg",
                  width: 170,
                  height: 100,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
