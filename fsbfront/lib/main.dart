import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:fsbfront/data/shop_item.dart';

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
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Title"),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.login)),
          ],
        ),
        body: Builder(builder: (context) {
          return MasonryGridView.count(
            crossAxisCount: 2,
            itemCount: items.length,
            itemBuilder: (context, index) {
              return Card(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Column(
                    children: [
                      Image.network(
                        items[index].imageUrl,
                        fit: BoxFit.cover,
                      ),
                      Text(items[index].name)
                    ],
                  ),
                ),
              );
            },
          );
        }),
      ),
    );
  }
}
