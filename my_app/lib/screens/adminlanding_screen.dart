import 'package:my_app/packages.dart';

class AdminLandingPage extends StatefulWidget {
  const AdminLandingPage({super.key});

  @override
  State<AdminLandingPage> createState() => _AdminLandingPageState();
}

class _AdminLandingPageState extends State<AdminLandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text(
          "Admin Dashboard",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SafeArea(
          child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: () => AddFoodItem(),
                child: ListTile(
                  leading: Icon(Icons.food_bank_outlined),
                  title: Text("Add Food"),
                ),
              ),
              Container(
                child: ListTile(
                  leading: Icon(Icons.local_drink_outlined),
                  title: Text("Add Drinks"),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: ListTile(
                  leading: Icon(Icons.update),
                  title: Text("Update"),
                ),
              ),
              Container(
                child: ListTile(
                  leading: Icon(Icons.delete),
                  title: Text("Delete"),
                ),
              ),
            ],
          )
        ],
      )),
    );
  }
}
