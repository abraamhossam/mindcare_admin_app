class UserModel {
  String? name;
  String? email;
  String? id;
  String? image;
  String? type;
  String? token;
  UserModel({
    required this.name,
    required this.email,
    required this.id,
    required this.image,
    required this.type,
    required this.token,
  });
  factory UserModel.fromjson(dynamic data) {
    return UserModel(
        name: data['name'],
        email: data['email'],
        id: data['id'],
        image: data['image'],
        type: data['type'],
        token: data['token']);
  }
}
