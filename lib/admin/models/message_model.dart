class MessageModel {
  String createdAt;
  String fromId;
  String id;
  String message;
  String? read;
  String toId;
  String? type;

  MessageModel(
      {required this.createdAt,
      required this.fromId,
      required this.id,
      required this.message,
      this.read,
      required this.toId,
      this.type});
  factory MessageModel.fromjson(dynamic data) {
    return MessageModel(
      createdAt: data['created_at'],
      fromId: data["fromid"],
      id: data['id'],
      message: data['message'],
      read: data["read"] ?? "",
      toId: data['toid'],
      type: data['type'],
    );
  }
}
