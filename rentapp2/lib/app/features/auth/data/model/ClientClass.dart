
class ClientClass {

  int? idClient;
  String? email;
  String? phoneNumber;
  DateTime? birthDate;
  String? firstName;
  String? lastName;
  String? middleName;
  DateTime? registrationDate;
  bool? typeClient;
  String? passwordHash;
  String? photo;
  String? role;

ClientClass({
  this.idClient,
  this.email,
  this.phoneNumber,
  this.birthDate,
  this.firstName,
  this.lastName,
  this.middleName,
  this.registrationDate,
  this.typeClient,
  this.passwordHash,
  this.photo,
  this.role,
});

factory ClientClass.fromJson(Map<String, dynamic> json) => ClientClass(
  idClient: json["idClient"],
  email: json["email"],
  phoneNumber: json["phoneNumber"],
  birthDate: DateTime.parse(json["birthDate"]),
  firstName: json["firstName"],
  lastName: json["lastName"],
  middleName: json["middleName"],
  registrationDate: DateTime.parse(json["registrationDate"]),
  typeClient: json["typeClient"],
  passwordHash: json["passwordHash"],
  photo: json["photo"],
  role: json["role"],
);

Map<String, dynamic> toJson() => {
    "idClient": idClient,
    "email": email,
    "phoneNumber": phoneNumber,
    "birthDate": birthDate?.toIso8601String(),
    "firstName": firstName,
    "lastName": lastName,
    "middleName": middleName,
    "registrationDate": registrationDate?.toIso8601String(),
    "typeClient": typeClient,
    "passwordHash": passwordHash,
    "photo": photo,
    "role": role,
  };
}