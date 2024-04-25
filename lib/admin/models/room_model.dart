class RoomModel {
  String? id;
  String? lastMessageTime;
  List? members;
  String? from;
  String? to;
  String? toType;
  String? fromType;
  RoomModel({
    this.id,
    this.lastMessageTime,
    this.members,
    this.from,
    this.to,
    this.fromType,
    this.toType,
  });
  factory RoomModel.fromjson(dynamic jsonData) {
    return RoomModel(
      id: jsonData['id'],
      lastMessageTime: jsonData['last_message_time'],
      members: jsonData['members'],
      from: jsonData['from'],
      to: jsonData['to'],
      fromType: jsonData['type_from'],
      toType: jsonData['type_to'],
    );
  }
}
