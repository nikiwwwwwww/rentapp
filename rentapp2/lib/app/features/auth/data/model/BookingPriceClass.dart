class BookingPriceClass {

  int? idBookingPrice;
  int? productId;
  int? hourlyTime;
  int? dailyTime;
  double? price;

  BookingPriceClass({
    this.idBookingPrice,
    this.productId,
    this.hourlyTime,
    this.dailyTime,
    this.price,
  });

  factory BookingPriceClass.fromJson(Map<String, dynamic> json) => BookingPriceClass(
    idBookingPrice: json["idBookingPrice"],
    productId: json["productId"],
    hourlyTime: json["hourlyTime"],
    dailyTime: json["dailyTime"],
    price: json["price"],
  );

  Map<String, dynamic> toJson() => {
    "idBookingPrice": idBookingPrice,
    "productId": productId,
    "hourlyTime": hourlyTime,
    "dailyTime": dailyTime,
    "price": price,
  };
}
