import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:fsbfront/data/login_model.dart';
import 'package:fsbfront/data/shop_item.dart';
import 'package:fsbfront/widget/login_page.dart';
import 'package:fsbfront/widget/shop_item_widget.dart';
import 'package:fsbfront/widget/shopping_cart_page.dart';
import 'package:provider/provider.dart';

void main() {
  if (kIsWeb) {
    setUrlStrategy(PathUrlStrategy());
  }
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<ShopItemModel>(create: (_) => ShopItemModel()),
        ChangeNotifierProvider<LoginModel>(create: (_) => LoginModel()),
      ],
      child: const MyApp(),
    ),
  );
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
            Builder(builder: (context) {
              return IconButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return LoginPage();
                        },
                      ),
                    );
                  },
                  icon: const Icon(Icons.login));
            }),
          ],
        ),
        body: Align(
          alignment: Alignment.topCenter,
          child: SizedBox(
            child: SizedBox(
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
                  final items = context.watch<ShopItemModel>().itemList;
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
        floatingActionButton: Builder(
          builder: (context) => FloatingActionButton(
            child: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const ShoppingCartPage(),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
