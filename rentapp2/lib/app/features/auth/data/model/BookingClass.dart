class BookingClass {

  int? idBooking;
  DateTime? startdate;
  DateTime? enddate;
  int? bookingPriceId;
  int? clientId;

  BookingClass({
    this.idBooking,
    this.startdate,
    this.enddate,
    this.bookingPriceId,
    this.clientId,
  });

  factory BookingClass.fromJson(Map<String, dynamic> json) => BookingClass(
    idBooking: json["idBooking"],
    startdate: DateTime.parse(json["startdate"]),
    enddate: DateTime.parse(json["enddate"]),
    bookingPriceId: json["bookingPriceId"],
    clientId: json["clientId"],
  );

  Map<String, dynamic> toJson() => {
    "idBooking": idBooking,
    "startdate": startdate?.toIso8601String(),
    "enddate": enddate?.toIso8601String(),
    "bookingPriceId": bookingPriceId,
    "clientId": clientId,
  };
}

