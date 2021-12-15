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
    ShopItem("【DVD】ひきこもりでも旅がしたい! Vol.4", "",
            "https://fs1.shop123.com.tw/300324/upload/product/3003249444pic_outside_439913.jpg"),
    ShopItem("【CD】プロジェクトセカイ カラフルステージ! feat.初音ミク/Vivid BAD SQUAD RAD DOGS/シネマ", "",
            "https://fs1.shop123.com.tw/300324/upload/product/3003248550pic_outside_c4feae938755.jpg"),
    ShopItem("【CD】Paradox Live 1st album “TRAP”", "",
            "https://fs1.shop123.com.tw/300324/upload/product/3003249232pic_outside_702116.jpg"),
    ShopItem("【文豪Stray Dogs】DEAD APPLE趴姿布偶吊飾 (隨機單抽)", "",
            "https://fs1.shop123.com.tw/300324/upload/product/3003249385pic_outside_989897.jpg"),
    ShopItem("【DVD】ひきこもりでもLIVEがしたい！～すーぱーまふまふわーるど2019", "",
            "https://fs1.shop123.com.tw/300324/upload/product/3003249434pic_outside_661858.jpg"),
    ShopItem("【BD】【催眠麥克風】ヒプノシスマイク-Division Rap Battle- Rhyme Anima 4 完全生産限定版", "",
            "https://fs1.shop123.com.tw/300324/upload/standard/3003242883source_picture_993646.jpg"),
    ShopItem("【CD】takt op. 運命は真紅き旋律の街を 主題歌「SYMPHONIA」/中島美嘉", "",
            "https://fs1.shop123.com.tw/300324/upload/product/3003249136pic_outside_8d7f89731316.jpg"),
    ShopItem("【CD】そらる/ゆめをきかせて", "",
            "https://fs1.shop123.com.tw/300324/upload/product/3003247535pic_outside_01b3e0974174.jpg"),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("頂樓有點冷 教授我好怕"),
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
