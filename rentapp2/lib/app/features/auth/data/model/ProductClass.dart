class ProductClass {

  int? idProduct;
  String nameProduct;
  double? latitude;
  double? longitude;
  String? descriptions;
  bool? statuss;
  int? categoryId;
  int? cityId;
  int? clientId;

  ProductClass({
    this.idProduct,
    required this.nameProduct,
    this.latitude,
    this.longitude,
    this.descriptions,
    this.statuss,
    this.categoryId,
    this.cityId,
    this.clientId,
  });

  factory ProductClass.fromJson(Map<String, dynamic> json) => ProductClass(
    idProduct: json["idProduct"],
    nameProduct: json["nameProduct"],
    latitude: json["latitude"],
    longitude: json["longitude"],
    descriptions: json["descriptions"],
    statuss: json["statuss"],
    categoryId: json["categoryId"],
    cityId: json["cityId"],
    clientId: json["clientId"],
  );

  Map<String, dynamic> toJson() => {
    "idProduct": idProduct,
    "nameProduct": nameProduct,
    "latitude": latitude,
    "longitude": longitude,
    "descriptions": descriptions,
    "statuss": statuss,
    "categoryId": categoryId,
    "cityId": cityId,
    "clientId": clientId,
  };
}
