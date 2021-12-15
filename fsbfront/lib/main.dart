import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:fsbfront/data/shop_item.dart';
import 'package:fsbfront/widget/shop_item_widget.dart';

void main() {
  setUrlStrategy(PathUrlStrategy());
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<ShopItem> items = [
    ShopItem("【鬼滅之刃】布製胸章／共8種(隨機單抽)", "",
        "https://fs1.shop123.com.tw/300324/upload/product/3003243679pic_origin_d27296420209_ars_600_600.jpg"),
    ShopItem("【hololive】桌墊V2 1st fes~･140宝鐘マリン", "",
        "https://fs1.shop123.com.tw/300324/upload/product/3003249302pic_origin_5fac63733294_ars_600_600.jpg"),
    ShopItem("【文豪Stray Dogs】角色吊飾", "",
        "https://fs1.shop123.com.tw/300324/upload/product/3003249394pic_origin_45786b637058_ars_600_600.jpg"),
    ShopItem("【Fate/Grand Order】趴娃 vol.4", "",
        "https://fs1.shop123.com.tw/300324/upload/product/3003249114pic_origin_167d13920630_ars_600_600.jpg"),
    ShopItem("【鬼滅之刃】2022年台版月曆", "",
        "https://fs1.shop123.com.tw/300324/upload/product/3003249738pic_origin_373bb0_ars_600_600.jpg"),
    ShopItem("【女神異聞錄】P25th 含框複製畫", "",
        "https://fs1.shop123.com.tw/300324/upload/product/3003249711pic_origin_23e4fc257967_ars_600_600.jpg"),
    ShopItem("【hololive】卡套/潤羽るしあ", "",
        "https://fs1.shop123.com.tw/300324/upload/product/3003245851pic_origin_948d5c269667_ars_600_600.jpg"),
    ShopItem("【hololive】卡套/兎田ぺこら", "",
        "https://fs1.shop123.com.tw/300324/upload/product/3003245852pic_origin_99f214951812_ars_600_600.jpg"),
    ShopItem("【出租女友（首刷限定版）", "",
        "https://fs1.shop123.com.tw/300324/upload/standard/30032410051picture_308925.jpg"),
    ShopItem("(角轉) 無職轉生～到了異世界就拿出真本事～（１６）", "",
        "https://fs1.shop123.com.tw/300324/upload/product/5598pic_big_name_654200.jpeg"),
    ShopItem("(角轉) 異世界悠閒農家（５）", "",
        "https://fs1.shop123.com.tw/300324/upload/product/5580pic_big_name_375486.jpeg"),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Title"),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.login)),
          ],
        ),
        body: LayoutBuilder(builder: (context, constrain) {
          // Responsive decide how many items a row
          int count = 4;
          if (constrain.maxWidth >= 576 && constrain.maxWidth < 992) {
            count = 3;
          } else if (constrain.maxWidth < 576) {
            count = 2;
          }
          return MasonryGridView.count(
            crossAxisCount: count,
            itemCount: null, // Let Scroll View Infinity
            itemBuilder: (context, index) {
              ShopItem item = items[index % items.length];
              return ShopItemWidget(item);
            },
          );
        }),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.shopping_cart),
          onPressed: () {},
        ),
      ),
    );
  }
}
