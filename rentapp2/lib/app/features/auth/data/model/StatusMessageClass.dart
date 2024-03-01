class StatusMessageClass {

  int? idStatusMessage;
  String? nameStatus;

  StatusMessageClass({
    this.idStatusMessage,
    this.nameStatus,
  });

  factory StatusMessageClass.fromJson(Map<String, dynamic> json) => StatusMessageClass(
    idStatusMessage: json["idStatusMessage"],
    nameStatus: json["nameStatus"],
  );

  Map<String, dynamic> toJson() => {
    "idStatusMessage": idStatusMessage,
    "nameStatus": nameStatus,
  };
}
