import 'package:flutter/material.dart';
import 'package:travel_app/anasayfa.dart';

class CategoriesPage extends StatelessWidget {
  final List<String> categories = [
    "Parklar",
    "Kütüpaneler",
    "Parklar",
    "Tarihi Yerler",
    "Oteller",
    "Marketler",
    "İbadet Yerleri",
    "Otoparklar",
  ];




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

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


                  // KATEGORİLER

                  SizedBox(
                    height: 24,
                  ),
                  Text("Categories", style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      fontSize: 24),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Column(
                      children: categories
                          .map((String title) => buildCategory(title))
                          .toList()),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}

Widget buildCategory(String title) {
  return Container(
    margin: EdgeInsets.only(bottom: 16),
    padding: EdgeInsets.all(24),
    width: double.infinity,
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.25),
              blurRadius: 4,
              offset: Offset(0, 4)),
        ]),
    child: Text(
      title,
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
    ),
  );
}