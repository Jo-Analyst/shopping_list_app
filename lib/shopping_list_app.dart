import 'package:flutter/material.dart';
import 'package:month_shopping_app/providers/category_provider.dart';
import 'package:month_shopping_app/providers/product_provider.dart';
import 'package:month_shopping_app/providers/shopping_list_provider.dart';
import 'package:month_shopping_app/themes/app_theme.dart';
import 'package:month_shopping_app/themes/dark.dart';
import 'package:month_shopping_app/themes/light.dart';
import 'package:provider/provider.dart';

import 'pages/screen_app_page.dart';

class ShoppingListApp extends StatefulWidget {
  const ShoppingListApp({super.key});

  @override
  State<ShoppingListApp> createState() => _ShoppingListAppState();
}

class _ShoppingListAppState extends State<ShoppingListApp> {
  @override
  void initState() {
    super.initState();
    AppTheme.instance.addListener(() {
      setState(() {});
    });
    
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        
        ChangeNotifierProvider(create: (_) => CategoryProvider()),
        ChangeNotifierProvider(create: (_) => ProductProvider()),
        ChangeNotifierProvider(create: (_) => ShoppingListProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Shopping List',
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: AppTheme.instance.themeMode,
        home: const ScreenAppPage(),
      ),
    );
  }
}
