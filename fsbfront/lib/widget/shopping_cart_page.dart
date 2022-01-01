import 'package:flutter/material.dart';
import 'package:fsbfront/data/shop_item.dart';
import 'package:provider/provider.dart';

class ShoppingCartPage extends StatelessWidget {
  const ShoppingCartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("購物車"),
      ),
      body: Builder(builder: (context) {
        List itemList = context.watch<ShopItemModel>().cartList;
        if (itemList.isEmpty) {
          return const Center(child: Text("購物車是空的"));
        }
        return ListView.builder(
          itemCount: itemList.length,
          itemBuilder: (context, i) {
            return Builder(
              builder: (context) {
                ShopItem item = itemList[i];
                return Card(
                  child: ListTile(
                    leading: Image.network(item.imageUrl),
                    title: Text(item.name),
                    subtitle: Text(item.price.toString()),
                  ),
                );
              },
            );
          },
        );
      }),
    );
  }
}

