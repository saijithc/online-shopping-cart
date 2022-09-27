import 'dart:convert';

List<GetPostModel> getPostModelFromJson(String str) => List<GetPostModel>.from(
    json.decode(str).map((x) => GetPostModel.fromJson(x)));

String getPostModelToJson(List<GetPostModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetPostModel {
  GetPostModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.images,
  });

  final num id;
  final String title;
  final num price;
  final String description;
  final Category category;
  final List<String> images;

  factory GetPostModel.fromJson(Map<String, dynamic> json) => GetPostModel(
        id: json["id"],
        title: json["title"],
        price: json["price"],
        description: json["description"],
        category: Category.fromJson(json["category"]),
        images: List<String>.from(json["images"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "price": price,
        "description": description,
        "category": category.toJson(),
        "images": List<dynamic>.from(images.map((x) => x)),
      };
}

class Category {
  Category({
    required this.id,
    required this.name,
    required this.image,
  });

  final num id;
  final Name? name;
  final String image;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: nameValues.map[json["name"]],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": nameValues.reverse[name],
        "image": image,
      };
}

enum Name { furniture, shoes, clothes, others, electronics }

final nameValues = EnumValues({
  "Clothes": Name.clothes,
  "Electronics": Name.electronics,
  "Furniture": Name.furniture,
  "Others": Name.others,
  "Shoes": Name.shoes
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap ??= map.map((k, v) => MapEntry(v, k));
    return reverseMap!;
  }
}
