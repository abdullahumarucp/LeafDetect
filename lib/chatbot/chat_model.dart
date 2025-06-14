class ChatModel {
  final String msg;
  final int chatIndex;

  ChatModel({required this.msg, required this.chatIndex});

  Map<String, dynamic> toJson() => {
        'msg': msg,
        'chatIndex': chatIndex,
      };

  factory ChatModel.fromJson(Map<String, dynamic> json) {
    return ChatModel(
      msg: json["msg"] ?? '',
      chatIndex: json["chatIndex"] is int
          ? json["chatIndex"]
          : int.tryParse(json["chatIndex"].toString()) ?? 0,

      // msg: json["message"]?["content"] ?? '',
      // chatIndex: json["chatIndex"] ?? 0,
    );
  }

  // factory ChatModel.fromJson(Map<String, dynamic> json) {
  //   return ChatModel(
  //     msg: json["msg"] ?? '',
  //     chatIndex: json["chatIndex"] ?? 0,
  //   );
  // }
}
