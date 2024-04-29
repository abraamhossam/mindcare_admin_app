import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:uuid/uuid.dart';

import '../Widgets/appbar_widget.dart';
import '../Widgets/phone_text_feild.dart';
import '../Widgets/text_field_input_data.dart';
import '../Widgets/text_input_data.dart';
import '../controller/input_data_doctor.dart';
import '../helpers/snackbar.dart';
import '../models/doctor_input_data.dart';
import 'admin_main.dart';

// ignore: must_be_immutable
class UpdateDataAddedByAdmin extends StatefulWidget {
  UpdateDataAddedByAdmin({
    super.key,
    this.idDoc,
    this.senddataAddedByAdmin,
  });
  static const String id = '/UpdateDataAddedByAdmin';
  String? idDoc;
  DoctorsData? senddataAddedByAdmin;

  @override
  State<UpdateDataAddedByAdmin> createState() => _UpdateDataAddedByAdminState();
}

class _UpdateDataAddedByAdminState extends State<UpdateDataAddedByAdmin> {
  final GlobalKey<FormState> formKey = GlobalKey();

  final TextEditingController mobile = TextEditingController();
  final TextEditingController name = TextEditingController();
  final TextEditingController controllersurname = TextEditingController();
  final TextEditingController controllerbirth = TextEditingController();
  final TextEditingController controllermedicalTitle = TextEditingController();
  final TextEditingController controllerofficeAddress = TextEditingController();
  final TextEditingController controllerprofile = TextEditingController();
  final TextEditingController controlleruniversty = TextEditingController();
  final TextEditingController controllerfieldOfStude = TextEditingController();
  final TextEditingController controllerdegree = TextEditingController();
  final TextEditingController controllerinstitution = TextEditingController();
  final TextEditingController controllerposition = TextEditingController();
  final TextEditingController controllercategory = TextEditingController();
  final TextEditingController controllerspecialisty = TextEditingController();
  final TextEditingController controllerexpiryBoard = TextEditingController();
  final TextEditingController controllerexpiryCurrent = TextEditingController();
  String? imageUrl;
  //************* */
  List<String> itemsgender = ["male", "female"];
  List<String> itemsyears = [
    for (dynamic i = 1950; i <= DateTime.now().year; i++) "$i"
  ];

  String? selectitemsgender;
  dynamic selectStartEd;
  dynamic selectEndEd;
  dynamic selectStartWo;
  dynamic selectEndWo;

  void onChangedDropDown(value) {
    setState(() {
      value = selectitemsgender;
    });
  }

  void onChangedselectStartEd(value) {
    setState(() {
      value = selectStartEd;
    });
  }

  void onChangedselectEndEd(value) {
    setState(() {
      value = selectEndEd;
    });
  }

  void onChangedselectStartWo(value) {
    setState(() {
      value = selectStartWo;
    });
  }

  void onChangedselectEndWo(value) {
    setState(() {
      value = selectEndWo;
    });
  }

//********** */
  void updateImage() async {
    FilePickerResult? result;
    result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'png', 'jpeg'],
    );

    if (result != null) {
      Uint8List? uplodImage = result.files.single.bytes;

      var ref = FirebaseStorage.instance
          .ref()
          .child('images')
          .child(const Uuid().v1());
      final UploadTask uploadTask = ref.putData(uplodImage!);

      uploadTask.whenComplete(
        () async {
          imageUrl = await uploadTask.snapshot.ref.getDownloadURL();

          // ignore: avoid_print
          print(imageUrl);
        },
      );
    }

    setState(() {});
  }

  @override
  void initState() {
    name.text = widget.senddataAddedByAdmin!.name;
    controllersurname.text = widget.senddataAddedByAdmin!.surname;
    controllerbirth.text = widget.senddataAddedByAdmin!.birth;
    controllermedicalTitle.text = widget.senddataAddedByAdmin!.medicalTitle;
    mobile.text = widget.senddataAddedByAdmin!.phone;
    controllerofficeAddress.text = widget.senddataAddedByAdmin!.officeAddress;
    controllerprofile.text = widget.senddataAddedByAdmin!.profile;
    controlleruniversty.text = widget.senddataAddedByAdmin!.universty;
    controllerfieldOfStude.text = widget.senddataAddedByAdmin!.fieldOfStude;
    controllerdegree.text = widget.senddataAddedByAdmin!.degree;
    controllerinstitution.text = widget.senddataAddedByAdmin!.institution;
    controllerposition.text = widget.senddataAddedByAdmin!.position;
    controllercategory.text = widget.senddataAddedByAdmin!.category;
    controllerspecialisty.text = widget.senddataAddedByAdmin!.specialisty;
    controllerexpiryBoard.text = widget.senddataAddedByAdmin!.expiryBoard;
    controllerexpiryCurrent.text = widget.senddataAddedByAdmin!.expiryCurrent;

    imageUrl = widget.senddataAddedByAdmin!.urlImage;
    selectitemsgender = widget.senddataAddedByAdmin!.gender;
    selectStartEd = widget.senddataAddedByAdmin!.startYearEdiction;
    selectEndEd = widget.senddataAddedByAdmin!.endYearEdiction;
    selectStartWo = widget.senddataAddedByAdmin!.startYearWork;
    selectEndWo = widget.senddataAddedByAdmin!.endYearWork;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBarWidget(
          titel: "Updete Data",
          onPressed: () {
            Get.back();
          },
        ),
        body: Form(
          key: formKey,
          child: GetBuilder<DoctorInputData>(
            init: DoctorInputData(),
            builder: (controller) {
              return ListView(
                children: [
                  const SizedBox(
                    height: 12,
                  ),
                  Center(
                    child: Stack(
                      children: [
                        Container(
                          width: 130,
                          height: 130,
                          decoration: BoxDecoration(
                            border: Border.all(width: 4, color: Colors.white),
                            boxShadow: [
                              BoxShadow(
                                spreadRadius: 2,
                                blurRadius: 10,
                                color: Colors.black.withOpacity(0.1),
                              )
                            ],
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: NetworkImage(
                                // widget.senddataAddedByAdmin!.urlImage,
                                imageUrl == null
                                    ? widget.senddataAddedByAdmin!.urlImage
                                    : imageUrl!,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            height: 45,
                            width: 45,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  width: 2,
                                ),
                                color: Colors.blue),
                            child: IconButton(
                              onPressed: () {
                                updateImage();
                              },
                              icon:
                                  const Center(child: Icon(Icons.add_a_photo)),
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  TextFiledData(
                    myconroller: name,
                    validator: (data) {
                      if (data!.isEmpty) {
                        return "field is required";
                      }
                    },
                    labelText: "Name",
                  ),
                  TextFiledData(
                    myconroller: controllersurname,
                    validator: (data) {
                      if (data!.isEmpty) {
                        return "field is required";
                      }
                    },
                    labelText: "Surname",
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Gender",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: DropdownButtonFormField<String>(
                              icon: const Icon(
                                Icons.arrow_drop_down,
                                color: Colors.black,
                                size: 30,
                              ),
                              decoration: const InputDecoration(
                                border: UnderlineInputBorder(),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color.fromARGB(255, 193, 192, 192),
                                  ),
                                ),
                              ),
                              hint: const Text(
                                "Select",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                ),
                              ),
                              value: selectitemsgender,
                              items: itemsgender
                                  .map((item) => DropdownMenuItem(
                                      value: item,
                                      child: Text(
                                        item,
                                        style: const TextStyle(
                                          fontSize: 18,
                                        ),
                                      )))
                                  .toList(),
                              onChanged: (item) => selectitemsgender = item),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 1,
                  ),
                  TextFiledData(
                    myconroller: controllerbirth,
                    validator: (data) {
                      if (data!.isEmpty) {
                        return "field is required";
                      }
                    },
                    labelText: "Data of Birth",
                    inputType: TextInputType.datetime,
                  ),
                  const SizedBox(
                    height: 1,
                  ),
                  TextFiledData(
                    myconroller: controllermedicalTitle,
                    labelText: "Medical Specialty",
                  ),
                  const SizedBox(
                    height: 1,
                  ),
                  Material(
                    child: PhoneTextField(
                      maxLength: 11,
                      controller: mobile,
                      validator: (data) {
                        if (mobile.text.length != 11) {
                          return "Please Enter valid mobile number";
                        }
                      },
                      labelText: "Phone number",
                      inputType: TextInputType.phone,
                    ),
                  ),
                  const SizedBox(
                    height: 1,
                  ),
                  TextFiledData(
                    myconroller: controllerofficeAddress,
                    validator: (data) {
                      if (data!.isEmpty) {
                        return "field is required";
                      }
                    },
                    labelText: "Office Address",
                  ),
                  const SizedBox(
                    height: 1,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Profile description",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: controllerprofile,
                      maxLines: 8,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "field is required";
                        } else {
                          return null;
                        }
                      },
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 14,
                          horizontal: 14,
                        ),
                        labelStyle: TextStyle(
                          fontSize: 18.sp,
                          color: Colors.grey,
                        ),
                        border: const OutlineInputBorder(),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 164, 161, 161),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      " # UNIVERSITY ",
                      style: TextStyle(
                        color: const Color.fromRGBO(129, 150, 172, 1),
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 1,
                  ),
                  TextFiledData(
                    myconroller: controlleruniversty,
                    labelText: "University",
                    validator: (data) {
                      if (data!.isEmpty) {
                        return "field is required";
                      }
                    },
                  ),
                  const SizedBox(
                    height: 1,
                  ),
                  TextFiledData(
                    myconroller: controllerfieldOfStude,
                    labelText: "Field of study",
                    validator: (data) {
                      if (data!.isEmpty) {
                        return "field is required";
                      }
                    },
                  ),
                  const SizedBox(
                    height: 1,
                  ),
                  TextFiledData(
                    myconroller: controllerdegree,
                    labelText: "Degree",
                    validator: (data) {
                      if (data!.isEmpty) {
                        return "field is required";
                      }
                    },
                  ),
                  const SizedBox(
                    height: 1,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Start year",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 18,
                                ),
                              ),
                              SizedBox(
                                child: DropdownButtonFormField<dynamic>(
                                  icon: const Icon(
                                    Icons.arrow_drop_down,
                                    color: Colors.black,
                                    size: 30,
                                  ),
                                  menuMaxHeight:
                                      MediaQuery.of(context).size.height * 0.40,
                                  decoration: const InputDecoration(
                                    border: UnderlineInputBorder(),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            Color.fromARGB(255, 193, 192, 192),
                                      ),
                                    ),
                                  ),
                                  hint: const Text(
                                    "Select",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  value: selectStartEd,
                                  items: itemsyears
                                      .map((item) => DropdownMenuItem(
                                          value: item,
                                          child: Text(
                                            item,
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          )))
                                      .toList(),
                                  onChanged: (item) => selectStartEd = item,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 15.w,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "End year",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 18,
                                ),
                              ),
                              SizedBox(
                                child: DropdownButtonFormField<dynamic>(
                                  icon: const Icon(
                                    Icons.arrow_drop_down,
                                    color: Colors.black,
                                    size: 30,
                                  ),
                                  menuMaxHeight:
                                      MediaQuery.of(context).size.height * 0.40,
                                  decoration: const InputDecoration(
                                    border: UnderlineInputBorder(),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            Color.fromARGB(255, 193, 192, 192),
                                      ),
                                    ),
                                  ),
                                  hint: const Text(
                                    "Select",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  value: selectEndEd,
                                  items: itemsyears
                                      .map((item) => DropdownMenuItem(
                                          value: item,
                                          child: Text(
                                            item,
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          )))
                                      .toList(),
                                  onChanged: (item) => selectEndEd = item,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 2,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      " # WORK ",
                      style: TextStyle(
                        color: const Color(0xFF8196AC),
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 1,
                  ),
                  TextFiledData(
                    myconroller: controllerinstitution,
                    labelText: "Institution",
                    validator: (data) {
                      if (data!.isEmpty) {
                        return "field is required";
                      }
                    },
                  ),
                  const SizedBox(
                    height: 1,
                  ),
                  TextFiledData(
                    myconroller: controllerposition,
                    labelText: "Position",
                    validator: (data) {
                      if (data!.isEmpty) {
                        return "field is required";
                      }
                    },
                  ),
                  const SizedBox(
                    height: 1,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Start year",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 18,
                              ),
                            ),
                            SizedBox(
                              child: DropdownButtonFormField<dynamic>(
                                icon: const Icon(
                                  Icons.arrow_drop_down,
                                  color: Colors.black,
                                  size: 30,
                                ),
                                menuMaxHeight:
                                    MediaQuery.of(context).size.height * 0.40,
                                decoration: const InputDecoration(
                                  border: UnderlineInputBorder(),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color.fromARGB(255, 193, 192, 192),
                                    ),
                                  ),
                                ),
                                hint: const Text(
                                  "Select",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                value: selectStartWo,
                                items: itemsyears
                                    .map((item) => DropdownMenuItem(
                                        value: item,
                                        child: Text(
                                          item,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        )))
                                    .toList(),
                                onChanged: (item) => selectStartWo = item,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 30.w,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "End year",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 18,
                              ),
                            ),
                            SizedBox(
                              child: DropdownButtonFormField<dynamic>(
                                icon: const Icon(
                                  Icons.arrow_drop_down,
                                  color: Colors.black,
                                  size: 30,
                                ),
                                menuMaxHeight:
                                    MediaQuery.of(context).size.height * 0.40,
                                decoration: const InputDecoration(
                                  border: UnderlineInputBorder(),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color.fromARGB(255, 193, 192, 192),
                                    ),
                                  ),
                                ),
                                hint: const Text(
                                  "Select",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                value: selectEndWo,
                                items: itemsyears
                                    .map((item) => DropdownMenuItem(
                                        value: item,
                                        child: Text(
                                          item,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        )))
                                    .toList(),
                                onChanged: (item) => selectEndWo = item,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 1,
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Text(
                      "Credentials",
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 1,
                  ),
                  TextFiledData(
                    myconroller: controllercategory,
                    labelText: "Category",
                    validator: (data) {
                      if (data!.isEmpty) {
                        return "field is required";
                      }
                    },
                  ),
                  const SizedBox(
                    height: 1,
                  ),
                  TextFiledData(
                    myconroller: controllerspecialisty,
                    labelText: "Specialisty",
                    validator: (data) {
                      if (data!.isEmpty) {
                        return "field is required";
                      }
                    },
                  ),
                  const SizedBox(
                    height: 1,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Text(
                      "Documents",
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      "# BOARD CERTIFICATION",
                      style: TextStyle(
                        color: const Color(0xFF8196AC),
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 1,
                  ),
                  TextFiledData(
                    myconroller: controllerexpiryBoard,
                    // onChanged: (data) {
                    //   controller.expiryBoard = data;
                    // },
                    labelText: "Expiry data",
                    validator: (data) {
                      if (data!.isEmpty) {
                        return "field is required";
                      }
                    },
                  ),
                  const SizedBox(
                    height: 1,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      "# CURRENT STATE LICENSE NUMBER ",
                      style: TextStyle(
                        color: const Color(0xFF8196AC),
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 1,
                  ),
                  TextFiledData(
                    myconroller: controllerexpiryCurrent,
                    labelText: "Expiry data",
                    validator: (data) {
                      if (data!.isEmpty) {
                        return "field is required";
                      }
                    },
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  TextButtonSaveData(
                    text: "Updete",
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        print("********${imageUrl}** ");
                        await controller.updeteDataAddedByAdmin(
                          DoctorsData(
                            id: widget.idDoc,
                            name: name.text,
                            surname: controllersurname.text,
                            gender: selectitemsgender!,
                            birth: controllerbirth.text,
                            medicalTitle: controllermedicalTitle.text,
                            phone: mobile.text,
                            officeAddress: controllerofficeAddress.text,
                            profile: controllerprofile.text,
                            universty: controlleruniversty.text,
                            fieldOfStude: controllerfieldOfStude.text,
                            degree: controllerdegree.text,
                            startYearEdiction: selectStartEd,
                            endYearEdiction: selectEndEd,
                            institution: controllerinstitution.text,
                            position: controllerposition.text,
                            startYearWork: selectStartWo,
                            endYearWork: selectEndWo,
                            category: controllercategory.text,
                            specialisty: controllerspecialisty.text,
                            expiryBoard: controllerexpiryBoard.text,
                            expiryCurrent: controllerexpiryCurrent.text,
                            urlImage: imageUrl!,
                          ),
                          widget.idDoc!,
                        );
                        // ignore: use_build_context_synchronously
                        snackbar(context, ' UPDATED SUCCESSFULLY ! ');
                        Get.offAllNamed(AdminMainScreen.id);
                      }
                    },
                    decorationcolor: Colors.blue,
                    textcolor: Colors.white,
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
