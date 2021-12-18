import 'package:flutter/cupertino.dart';
import 'package:fsbfront/data/app_api.dart';

class ShopItem {
  String name;
  String description;
  String imageUrl;
  int price;
  int count;

  ShopItem(this.name, this.description, this.imageUrl, this.price, this.count);

  factory ShopItem.fromJson(Map<String, dynamic> json) {
    return ShopItem(
      json['name'] as String,
      json['description'] as String,
      json['imageUrl'] as String,
      json['price'] as int,
      json['count'] as int,
    );
  }
}

class ShopItemModel extends ChangeNotifier {
  List<ShopItem> list = List.empty();

  void setList(List<ShopItem> list) {
    this.list = list;
    notifyListeners();
  }

  ShopItemModel() {
    getAllShopItem().then((value) {
      setList(value);
    });
  }
}
