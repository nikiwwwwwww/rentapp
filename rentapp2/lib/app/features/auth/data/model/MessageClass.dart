class MessageClass {

  int? idMessage;
  int? chatId;
  String? message;
  DateTime? sendDate;
  String? statusId;
  int? senderUserId;

  MessageClass({
    this.idMessage,
    this.chatId,
    this.message,
    this.sendDate,
    this.statusId,
    this.senderUserId,
  });

  factory MessageClass.fromJson(Map<String, dynamic> json) => MessageClass(
    idMessage: json["idMessage"],
    chatId: json["chatId"],
    message: json["message"],
    sendDate: DateTime.parse(json["sendDate"]),
    statusId: json["statusId"],
    senderUserId: json["senderUserId"],
  );

  Map<String, dynamic> toJson() => {
    "idMessage": idMessage,
    "chatId": chatId,
    "message": message,
    "sendDate": sendDate?.toIso8601String(),
    "statusId": statusId,
    "senderUserId": senderUserId,
  };
}
