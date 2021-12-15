import 'package:flutter/material.dart';
import 'package:fsbfront/data/shop_item.dart';

class ShopItemWidget extends StatelessWidget {
  const ShopItemWidget(this.item, {Key? key}) : super(key: key);
  final ShopItem item;
  final String itemImageHeroTag = "ITEM_IMAGE_HERO_TAG";

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            content: Wrap(
              children: [
                Column(
                  children: [
                    SizedBox.fromSize(
                      size: const Size(300, 300),
                      child: Hero(
                        tag: itemImageHeroTag,
                        child: Image.network(item.imageUrl),
                      ),
                    ),
                    Text(item.name),
                  ],
                )
              ],
            ),
            actions: const [
              AddToCartButton(),
            ],
          ),
        );
      },
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Hero(
                tag: itemImageHeroTag,
                child: Image.network(
                  item.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              Text(item.name)
            ],
          ),
        ),
      ),
    );
  }
}

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Card(
        color: Theme.of(context).primaryColor,
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text("加入購物車"),
        ),
      ),
    );
  }
}
