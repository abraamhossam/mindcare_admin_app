class DoctorsData {
  final String? id;
  final String name;
  final String surname;
  final String gender;
  final String birth;
  final String medicalTitle;
  final String phone;
  final String officeAddress;
  final String profile;
  final String universty;
  final String fieldOfStude;
  final String degree;
  final String startYearEdiction;
  final String endYearEdiction;
  final String institution;
  final String position;
  final String startYearWork;
  final String endYearWork;
  final String category;
  final String specialisty;
  final String expiryBoard;
  final String expiryCurrent;
  final String urlImage;

  DoctorsData({
    this.id,
    required this.name,
    required this.surname,
    required this.gender,
    required this.birth,
    required this.medicalTitle,
    required this.phone,
    required this.officeAddress,
    required this.profile,
    required this.universty,
    required this.fieldOfStude,
    required this.degree,
    required this.startYearEdiction,
    required this.endYearEdiction,
    required this.institution,
    required this.position,
    required this.startYearWork,
    required this.endYearWork,
    required this.category,
    required this.specialisty,
    required this.expiryBoard,
    required this.expiryCurrent,
    required this.urlImage,
  });
  toJson() {
    return {
      'id': id,
      'name': name,
      'surname': surname,
      'gender': gender,
      'birth': birth,
      'medicalTitle': medicalTitle,
      'phone': phone,
      'officeAddress': officeAddress,
      'profile': profile,
      'universty': universty,
      'fieldOfStude': fieldOfStude,
      'degree': degree,
      'startYearEdiction': startYearEdiction,
      'endYearEdiction': endYearEdiction,
      'institution': institution,
      'position': position,
      'startYearWork': startYearWork,
      'endYearWork': endYearWork,
      'category': category,
      'specialisty': specialisty,
      'expiryBoard': expiryBoard,
      'expiryCurrent': expiryCurrent,
      'urlImage': urlImage,
    };
  }
}
