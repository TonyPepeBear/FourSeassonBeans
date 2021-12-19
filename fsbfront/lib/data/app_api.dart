import 'dart:convert';

import 'shop_item.dart';
import 'package:http/http.dart' as http;

Future<List<ShopItem>> getAllShopItem() async {
  var url = Uri.parse("https://fsbapi.tonypepe.com/shop_item");
  var response = await http.get(url);
  final parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();
  return parsed.map<ShopItem>((json) => ShopItem.fromJson(json)).toList();
}
