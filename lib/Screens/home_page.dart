import 'package:flutter/material.dart';
import 'package:shopify/CustomClass/favorite_card_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [FavoriteCardWidget()],
      ),
    );
  }
}
