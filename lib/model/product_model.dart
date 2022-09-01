import 'dart:convert';

import 'package:evamp_task_app/model/profile_model.dart';

import 'item_model.dart';

ProductModel productModelFromJson(String str) =>
    ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  final String? status;
  final List<ItemModel>? items;

  ProductModel(
    this.status,
    this.items,
  );

  static ProductModel fromJson(Map<String, dynamic> resp) {
    List<ItemModel> data = [];
    if (resp['items'] != null) {
      data = List<ItemModel>.from(
          resp['items'].map((item) => ItemModel.fromJson(item)));
    }
    return ProductModel(
      resp['status'] as String?,
      data,
    );
  }

  Map<String, dynamic> toJson() => {
        "status": status,
        "items": items,
      };
}
