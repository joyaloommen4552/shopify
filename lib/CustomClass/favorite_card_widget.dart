import 'package:flutter/material.dart';

class FavoriteCardWidget extends StatelessWidget {
  const FavoriteCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: double.infinity,
      margin: EdgeInsets.all(5),
      child: Row(
        children: [
          SizedBox(
            height: 100,
            width: 100,
            child: Image.asset("assets/images/splash1.png"),
          ),
          Text(
            "Fresh Red Apple",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
