class CategoryClass {

  int? idCategory;
  String? categoryName;
  String? photopath;


  CategoryClass({
    this.idCategory,
    this.categoryName,
    this.photopath

  });

  factory CategoryClass.fromJson(Map<String, dynamic> json) => CategoryClass(
    idCategory: json["idCategory"],
    categoryName: json["categoryName"],
    photopath: json["photopath"]
  );

  Map<String, dynamic> toJson() => {
    "idCategory": idCategory,
    "categoryName": categoryName,
    "photopath" : photopath
  };
}
