class ChatClass {

  int? idChat;
  int? senderUserId;
  int? receiverUserId;

  ChatClass({
    this.idChat,
    this.senderUserId,
    this.receiverUserId,
  });

  factory ChatClass.fromJson(Map<String, dynamic> json) => ChatClass(
    idChat: json["idChat"],
    senderUserId: json["senderUserId"],
    receiverUserId: json["receiverUserId"],
  );

  Map<String, dynamic> toJson() => {
    "idChat": idChat,
    "senderUserId": senderUserId,
    "receiverUserId": receiverUserId,
  };
}
