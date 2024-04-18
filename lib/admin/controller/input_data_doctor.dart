import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

import '../models/doctor_input_data.dart';

 

class DoctorInputData extends GetxController {
  var uuid = const Uuid();
  String? id;
  String name = '';
  String surname = '';
  String gender = '';
  String birth = '';
  String medicalTitle = '';
  String phone = '';
  String officeAddress = '';
  String profile = '';
  String universty = '';
  String fieldOfStude = '';
  String degree = '';
  dynamic startYearEdiction;
  dynamic endYearEdiction;
  String institution = '';
  String position = '';
  dynamic startYearWork;
  dynamic endYearWork;
  String category = '';
  String specialisty = '';
  String expiryBoard = '';
  String expiryCurrent = '';
  String? imageUrl;
  QuerySnapshot? docRef;
  DoctorsData? senddata;
  final User? user = FirebaseAuth.instance.currentUser;

  List<String> itemsgender = ["male", "female"];
  List<String> itemsyears = [
    for (dynamic i = 1950; i <= DateTime.now().year; i++) "$i"
  ];

  String? selectitemsgender;
  dynamic selectitemyear;

  @override
  void onInit() {
    getdata();
    datadoctorsaddedbyadmin();
    getdataUsers();
    super.onInit();
  }

  void onChangedDropDown(value) {
    value = selectitemsgender;
    update();
  }

  void onChangedselectitemyear(value) {
    value = selectitemyear;
    update();
  }

  List<QueryDocumentSnapshot> doctorsData = [];
  List<QueryDocumentSnapshot> usersData = [];
  List<QueryDocumentSnapshot> doctorsDataAdmin = [];
  bool isloding = true;
// get doctors data:
  getdata() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('doctors_data').get();
    doctorsData.addAll(querySnapshot.docs);
    isloding = false;
    update();

    // print(doctorsData);
  }

  // get doctors data add by admin:
  datadoctorsaddedbyadmin() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('doctors_data_added_by_admin')
        .get();

    doctorsDataAdmin.addAll(querySnapshot.docs);
    isloding = false;

    update();
    // print(doctorsDataAdmin);
  }

  // get users data:
  getdataUsers() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('users').get();
    usersData.addAll(querySnapshot.docs);
    isloding = false;
    update();
    // print(usersData);
  }

  static DoctorInputData get instance => Get.find();

  final db = FirebaseFirestore.instance;
  creatdoctordata(DoctorsData doctor) async {
    await db
        .collection('doctors_data_added_by_admin')
        .add(doctor.toJson())
        // ignore: avoid_print
        .then((value) => print("Added doctor *********"))
        .catchError(
            // ignore: avoid_print
            (error) => print("********** Failed to add  Result: $error "));
  }

  updeteData(DoctorsData updateDate, String docid) async {
    CollectionReference db =
        FirebaseFirestore.instance.collection('doctors_data');
    await db.doc(docid).update(updateDate.toJson()).then(

            // ignore: avoid_print
            (value) => print(' Updated SUCCESSFULLY')).catchError(
          // ignore: avoid_print
          (e) => print("error updete data $e"),
        );
  }

  updeteDataAddedByAdmin(DoctorsData updateDate, String docid) async {
    CollectionReference db =
        FirebaseFirestore.instance.collection('doctors_data_added_by_admin');
    await db.doc(docid).update(updateDate.toJson()).then(

            // ignore: avoid_print
            (value) => print(' Updated SUCCESSFULLY')).catchError(
          // ignore: avoid_print
          (e) => print("error updete data $e"),
        );
  }

  Future<void> deletedoctor(String docid) async {
    CollectionReference db =
        FirebaseFirestore.instance.collection('doctors_data');
    await db.doc(docid).delete();
    // update();
  }

  Future<void> deletedoctorAddedbyAdmin(String docid) async {
    CollectionReference db =
        FirebaseFirestore.instance.collection('doctors_data_added_by_admin');
    await db.doc(docid).delete();
    update();
  }

  void getImageDoctor() async {
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

    update();
  }
}