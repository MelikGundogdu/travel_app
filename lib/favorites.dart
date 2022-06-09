import 'package:flutter/material.dart';
import 'package:travel_app/anasayfa.dart';

class FavoritesWidget extends StatelessWidget {
  const FavoritesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favorites"),
        actions: [
          // GERİ DÖN İKONU
          SizedBox(
            height: 29,
          ),

          //Icon(Icons.arrow_back, color: Colors.black, size: 27),

          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Anasayfa()),
              );
            },
            icon: Icon(Icons.arrow_back, color: Colors.black, size: 27),
          ),
        ],


      ),
    );
  }
}
