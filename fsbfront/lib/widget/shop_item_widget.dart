import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fsbfront/data/shop_item.dart';

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
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    child: SizedBox(
                      height: 390,
                      width: 420,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
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
                          const Align(
                              //Add to cart button
                              alignment: Alignment.topRight,
                              child: AddToCartButton()),
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
