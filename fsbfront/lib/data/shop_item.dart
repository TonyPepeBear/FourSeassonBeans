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
  List<ShopItem> _itemList = List.empty();

  List<ShopItem> get itemList => _itemList;

  final List<ShopItem> _cartList = [];

  List<ShopItem> get cartList => _cartList;

  void setItemList(List<ShopItem> list) {
    _itemList = list;
    notifyListeners();
  }

  void addCartItem(ShopItem item) {
    _cartList.add(item);
    notifyListeners();
  }

  ShopItemModel() {
    getAllShopItem().then((value) {
      setItemList(value);
    });
  }
}

