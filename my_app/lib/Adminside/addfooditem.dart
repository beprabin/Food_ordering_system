import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:my_app/packages.dart';
import 'dart:io';

class AddFoodItem extends StatefulWidget {
  const AddFoodItem({super.key});

  @override
  State<AddFoodItem> createState() => _AddFoodItemState();
}

class _AddFoodItemState extends State<AddFoodItem> {
  final TextEditingController _foodNameTextController = TextEditingController();
  final TextEditingController _descTextController = TextEditingController();
  final TextEditingController _priceTextController = TextEditingController();
  String imageUrl = '';
  final fireStore = FirebaseFirestore.instance.collection('Foods');
  String errorMsg = "";
  String imagemsg = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.89,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                child: Column(
                  children: <Widget>[
                    const SizedBox(
                      height: 80,
                    ),
                    reusableTextField("Enter Food Name", Icons.food_bank, false,
                        _foodNameTextController,
                        txttype: TextInputType.text),
                    const SizedBox(
                      height: 10,
                    ),
                    reusableTextField("Enter Price", Icons.price_change, false,
                        _priceTextController,
                        txttype: TextInputType.number),
                    const SizedBox(
                      height: 10,
                    ),
                    reusableTextField("Description", Icons.description, false,
                        _descTextController,
                        txttype: TextInputType.text),
                    const SizedBox(
                      height: 10,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: const BorderSide(
                                width: 2, // the thickness
                                color: Color.fromARGB(255, 255, 255,
                                    255) // the color of the border
                                )),
                      ),
                      onPressed: () async {
                        ImagePicker imagePicker = ImagePicker();

                        XFile? file = await imagePicker.pickImage(
                            source: ImageSource.gallery);

                        if (file == null) return;
                        String uniqueImagename =
                            DateTime.now().millisecondsSinceEpoch.toString();
                        Reference referenceRoot =
                            FirebaseStorage.instance.ref();
                        Reference referenceDirImages =
                            referenceRoot.child('images');
                        Reference referenceImageToUpload =
                            referenceDirImages.child(uniqueImagename);

                        try {
                          await referenceImageToUpload.putFile(File(file.path));
                          imageUrl =
                              await referenceImageToUpload.getDownloadURL();
                        } catch (error) {
                          //
                        }
                        setState(() {
                          imagemsg = "Image Uploaded";
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Container(
                          width: 60,
                          height: 60,
                          child: const Icon(
                            Icons.add,
                            size: 50,
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      imagemsg,
                      style: const TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255)),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    firebaseUIButton(context, "Add Food", () async {
                      String name = _foodNameTextController.text.trim();
                      String desc = _descTextController.text.trim();
                      String price = _priceTextController.text.trim();
                      if (name.length > 4 && desc.length > 4) {
                        if (imageUrl.isNotEmpty) {
                          fireStore.doc().set({
                            'name': name,
                            'description': desc,
                            'image': imageUrl,
                            'price': price,
                          }).then((value) {
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => const AddFoodItem()));
                            setState(() {
                              errorMsg = "New Food item added to list";
                            });
                          }).onError((error, stackTrace) {
                            setState(() {
                              errorMsg = "something wrong.";
                            });
                          });
                          // ignore: unused_catch_clause
                        } else {
                          setState(() {
                            errorMsg = "Please upload an image";
                          });
                        }
                      } else {
                        setState(() {
                          errorMsg =
                              "Min Length for Name and Description should be more 4 words";
                        });
                      }
                    }),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(errorMsg),
                    const SizedBox(
                      height: 5,
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
