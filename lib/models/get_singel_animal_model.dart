
import 'dart:convert';

GetSingleAnimals getSingleAnimalsFromMap(String str) => GetSingleAnimals.fromMap(json.decode(str));

String getSingleAnimalsToMap(GetSingleAnimals data) => json.encode(data.toMap());

class GetSingleAnimals {
  GetSingleAnimals({
    this.status,
    this.image,
    this.title,
    this.subTitle,
    this.months,
    this.length,
    this.gender,
    this.color,
    this.distance,
    this.description,
  });

  bool status;
  String image;
  String title;
  String subTitle;
  int months;
  int length;
  String gender;
  String color;
  int distance;
  String description;

  factory GetSingleAnimals.fromMap(Map<String, dynamic> json) => GetSingleAnimals(
    status: json["status"] == null ? null : json["status"],
    image: json["image"] == null ? null : json["image"],
    title: json["title"] == null ? null : json["title"],
    subTitle: json["sub_title"] == null ? null : json["sub_title"],
    months: json["months"] == null ? null : json["months"],
    length: json["length"] == null ? null : json["length"],
    gender: json["gender"] == null ? null : json["gender"],
    color: json["color"] == null ? null : json["color"],
    distance: json["distance"] == null ? null : json["distance"],
    description: json["description"] == null ? null : json["description"],
  );

  Map<String, dynamic> toMap() => {
    "status": status == null ? null : status,
    "image": image == null ? null : image,
    "title": title == null ? null : title,
    "sub_title": subTitle == null ? null : subTitle,
    "months": months == null ? null : months,
    "length": length == null ? null : length,
    "gender": gender == null ? null : gender,
    "color": color == null ? null : color,
    "distance": distance == null ? null : distance,
    "description": description == null ? null : description,
  };
}
