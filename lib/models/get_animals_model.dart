import 'dart:convert';

GetAnimals getAnimalsFromMap(String str) => GetAnimals.fromMap(json.decode(str));

String getAnimalsToMap(GetAnimals data) => json.encode(data.toMap());

class GetAnimals {
  GetAnimals({
    this.status,
    this.data,
  });
  bool status;
  List<Datum> data;
  factory GetAnimals.fromMap(Map<String, dynamic> json) => GetAnimals(
    status: json["status"] == null ? null : json["status"],
    data: json["data"] == null ? null : List<Datum>.from(json["data"].map((x) => Datum.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "status": status == null ? null : status,
    "data": data == null ? null : List<dynamic>.from(data.map((x) => x.toMap())),
  };
}

class Datum {
  Datum({
    this.title,
    this.items,
  });

  String title;
  List<Item> items;

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
    title: json["title"] == null ? null : json["title"],
    items: json["items"] == null ? null : List<Item>.from(json["items"].map((x) => Item.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "title": title == null ? null : title,
    "items": items == null ? null : List<dynamic>.from(items.map((x) => x.toMap())),
  };
}

class Item {
  Item({
    this.image,
    this.title,
    this.subTitle,
    this.months,
    this.length,
    this.gender,
    this.distance,
  });

  String image;
  String title;
  String subTitle;
  int months;
  int length;
  Gender gender;
  int distance;

  factory Item.fromMap(Map<String, dynamic> json) => Item(
    image: json["image"] == null ? null : json["image"],
    title: json["title"] == null ? null : json["title"],
    subTitle: json["sub_title"] == null ? null : json["sub_title"],
    months: json["months"] == null ? null : json["months"],
    length: json["length"] == null ? null : json["length"],
    gender: json["gender"] == null ? null : genderValues.map[json["gender"]],
    distance: json["distance"] == null ? null : json["distance"],
  );

  Map<String, dynamic> toMap() => {
    "image": image == null ? null : image,
    "title": title == null ? null : title,
    "sub_title": subTitle == null ? null : subTitle,
    "months": months == null ? null : months,
    "length": length == null ? null : length,
    "gender": gender == null ? null : genderValues.reverse[gender],
    "distance": distance == null ? null : distance,
  };
}

enum Gender { FEMALE, MALE }

final genderValues = EnumValues({
  "female": Gender.FEMALE,
  "male": Gender.MALE
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
