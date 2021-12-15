import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:fsbfront/data/shop_item.dart';

class ShopItemWidget extends StatelessWidget {
  const ShopItemWidget(this.item, {Key? key}) : super(key: key);
  final ShopItem item;

  @override
  Widget build(BuildContext context) {
    return OpenContainer(
      closedBuilder: (context, _) => Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Image.network(
                item.imageUrl,
                fit: BoxFit.cover,
              ),
              Text(item.name)
            ],
          ),
        ),
      ),
      openBuilder: (context, _) => Scaffold(
        appBar: AppBar(title: Text(item.name)),
        body: Column(
          children: [
            Image.network(item.imageUrl),
            Align(
              alignment: Alignment.topRight,
              child: TextButton(
                onPressed: () {},
                child: Wrap(
                  children: const [
                    Text("加入購物車"),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
