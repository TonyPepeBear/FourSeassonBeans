import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:fsbfront/data/shop_item.dart';
import 'package:fsbfront/widget/shop_item_widget.dart';
import 'package:provider/provider.dart';

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
  bool isOpacity = false;

  void _setOpacity(bool opacity) {
    setState(() {
      isOpacity = opacity;
    });
  }

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
        body: MultiProvider(
          providers: [
            ChangeNotifierProvider<ShopItemModel>(
                create: (_) => ShopItemModel()),
          ],
          child: Align(
            alignment: Alignment.topCenter,
            child: SizedBox(
              child: Container(
                width: 1000,
                child: AnimatedOpacity(
                  opacity: isOpacity ? 0.2 : 1,
                  duration: const Duration(milliseconds: 500),
                  child: LayoutBuilder(builder: (context, constrain) {
                    // Responsive decide how many items a row
                    int count = 4;
                    if (constrain.maxWidth >= 576 && constrain.maxWidth < 992) {
                      count = 3;
                    } else if (constrain.maxWidth < 576) {
                      count = 2;
                    }
                    // get items from model
                    final items = context.watch<ShopItemModel>().list;
                    if (items.isEmpty) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    return MasonryGridView.count(
                      crossAxisCount: count,
                      itemCount: null, // Let Scroll View Infinity
                      itemBuilder: (context, index) {
                        ShopItem item = items[index % items.length];
                        return ShopItemWidget(
                          item: item,
                          index: index,
                          setOpacity: _setOpacity,
                        );
                      },
                    );
                  }),
                ),
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.shopping_cart),
          onPressed: () {},
        ),
      ),
    );
  }
}
