import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fsbfront/data/shop_item.dart';
import 'package:provider/provider.dart';

class ShopItemWidget extends StatelessWidget {
  final void Function(bool opacity)? setOpacity;

  const ShopItemWidget(
      {required this.item, Key? key, required this.index, this.setOpacity})
      : super(key: key);
  final ShopItem item;
  final int index;
  final String itemImageHeroTag = "ITEM_IMAGE_HERO_TAG";

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (setOpacity != null) setOpacity!(true);
        Navigator.of(context).push(
          PageRouteBuilder(
            opaque: false,
            transitionsBuilder: (context, a, __, child) => FadeTransition(
              opacity: a,
              child: child,
            ),
            barrierDismissible: true,
            transitionDuration: const Duration(milliseconds: 500),
            reverseTransitionDuration: const Duration(milliseconds: 500),
            pageBuilder: (context, _, __) {
              return Scaffold(
                backgroundColor: Colors.transparent,
                body: Center(
                  child: Card(
                    elevation: 10,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    child: SizedBox(
                      width: 420,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            // App Bar
                            width: double.infinity,
                            color: Theme.of(context).primaryColor,
                            child: Row(
                              children: [
                                IconButton(
                                    onPressed: () {
                                      if (setOpacity != null) {
                                        setOpacity!(false);
                                      }
                                      Navigator.pop(context);
                                    },
                                    icon: const Icon(Icons.close))
                              ],
                            ),
                          ),
                          SizedBox(
                            // Image
                            width: 300,
                            height: 300,
                            child: Hero(
                              tag: itemImageHeroTag + index.toString(),
                              child: Image.network(
                                item.imageUrl,
                                fit: BoxFit.scaleDown,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              item.name,
                              style: const TextStyle(fontSize: 25),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              item.price.toString(),
                              style: const TextStyle(fontSize: 18),
                            ),
                          ),
                          Align(
                            //Add to cart button
                            alignment: Alignment.topRight,
                            child: AddToCartButton(
                              item: item,
                              setOpacity: setOpacity,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
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
                tag: itemImageHeroTag + index.toString(),
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
  final ShopItem item;
  final void Function(bool opacity)? setOpacity;

  const AddToCartButton({Key? key, required this.item, this.setOpacity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<ShopItemModel>().addCartItem(item);
        if (setOpacity != null) {
          setOpacity!(false);
        }
        Navigator.of(context).pop();
      },
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
