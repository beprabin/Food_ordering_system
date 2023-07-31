import 'package:my_app/packages.dart';
import 'dart:io';

class EditFoodItem extends StatefulWidget {
  final DocumentSnapshot? document;
  final String? documentId;
  EditFoodItem({super.key, this.documentId, this.document});

  @override
  State<EditFoodItem> createState() => _EditFoodItemState();
}

class _EditFoodItemState extends State<EditFoodItem> {
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
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        centerTitle: true,
        title: Text(
          "Edit Food",
        ),
        iconTheme: IconThemeData(
          color: Colors.black, // <-- SEE HERE
        ),
      ),
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
                    reusableTextField(
                        widget.document!['name'],
                        Icons.dinner_dining_outlined,
                        false,
                        _foodNameTextController,
                        txttype: TextInputType.text),
                    const SizedBox(
                      height: 10,
                    ),
                    reusableTextField(widget.document!['price'],
                        Icons.price_change, false, _priceTextController,
                        txttype: TextInputType.number),
                    const SizedBox(
                      height: 10,
                    ),
                    reusableTextField(widget.document!['description'],
                        Icons.description, false, _descTextController,
                        txttype: TextInputType.text),
                    const SizedBox(
                      height: 10,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      child: Container(
                        alignment: Alignment.center,
                        width: 130,
                        height: 100,
                        decoration: BoxDecoration(
                            border: Border.all(width: 5, color: Colors.white),
                            borderRadius: BorderRadius.circular(10)),
                        child: FadeInImage.assetNetwork(
                          placeholder: 'assets/images/loading.png',
                          image: "${widget.document!['image']}",
                          width: 130,
                          fit: BoxFit.cover,
                          height: 100,
                        ),
                      ),
                      onTap: () async {
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
                    ),
                    // ElevatedButton(
                    //   style: ElevatedButton.styleFrom(
                    //     backgroundColor: Colors.transparent,
                    //     shape: RoundedRectangleBorder(
                    //         borderRadius: BorderRadius.circular(10),
                    //         side: const BorderSide(
                    //             width: 2, // the thickness
                    //             color: Color.fromARGB(255, 255, 255,
                    //                 255) // the color of the border
                    //             )),
                    //   ),
                    //   onPressed: () async {
                    //     ImagePicker imagePicker = ImagePicker();

                    //     XFile? file = await imagePicker.pickImage(
                    //         source: ImageSource.gallery);

                    //     if (file == null) return;
                    //     String uniqueImagename =
                    //         DateTime.now().millisecondsSinceEpoch.toString();
                    //     Reference referenceRoot =
                    //         FirebaseStorage.instance.ref();
                    //     Reference referenceDirImages =
                    //         referenceRoot.child('images');
                    //     Reference referenceImageToUpload =
                    //         referenceDirImages.child(uniqueImagename);

                    //     try {
                    //       await referenceImageToUpload.putFile(File(file.path));
                    //       imageUrl =
                    //           await referenceImageToUpload.getDownloadURL();
                    //     } catch (error) {
                    //       //
                    //     }
                    //     setState(() {
                    //       imagemsg = "Image Uploaded";
                    //     });
                    //   },
                    //   child: Padding(
                    //     padding: const EdgeInsets.all(20),
                    //     child: Container(
                    //       width: 60,
                    //       height: 60,
                    //       child: const Icon(
                    //         Icons.add,
                    //         size: 50,
                    //         color: Color.fromARGB(255, 255, 255, 255),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    const SizedBox(height: 10),
                    Text(
                      imagemsg,
                      style: const TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255)),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    firebaseUIButton(context, "Update", () async {
                      String name = _foodNameTextController.text.trim();
                      String desc = _descTextController.text.trim();
                      String price = _priceTextController.text.trim();
                      if (name.length > 4 && desc.length > 4) {
                        if (imageUrl.isNotEmpty) {
                          FirebaseFirestore.instance
                              .collection("Foods")
                              .doc(widget.documentId)
                              .update({
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
                              errorMsg = "Food details updated";
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
