import 'dart:convert';

ItemModel itemModelFromJson(String str) =>
    ItemModel.fromJson(json.decode(str));

String itemModelToJson(ItemModel data) => json.encode(data.toJson());

class ItemModel {
  final String? id;
  final String? itemImage;
  final String? name;
  final String? description;
  final double? price;

  ItemModel(
    this.id,
    this.itemImage,
    this.name,
    this.description,
    this.price,
  );

  static ItemModel fromJson(Map<String, dynamic> resp) {
    return ItemModel(
      resp['id'] as String?,
      resp['itemImage'] as String?,
      resp['name'] as String?,
      resp['description'] as String?,
      resp['price'] as double?,
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "itemImage": itemImage,
        "name": name,
        "description": description,
        "price": price,
      };
}
