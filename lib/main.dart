import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task2/view/product_listview.dart';
import 'package:task2/viewmodal/mangedata.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProductProvider()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ProductListScreen(),
      ),
    );
  }
}
