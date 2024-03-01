class PhotoClass {

  int? idPhoto;
  String? photo;
  int? productId;

  PhotoClass({
    this.idPhoto,
    this.photo,
    this.productId,
  });

  factory PhotoClass.fromJson(Map<String, dynamic> json) => PhotoClass(
    idPhoto: json["idPhoto"],
    photo: json["photo"],
    productId: json["productId"],
  );

  Map<String, dynamic> toJson() => {
    "idPhoto": idPhoto,
    "photo": photo,
    "productId": productId,
  };
}
