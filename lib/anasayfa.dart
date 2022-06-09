import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/favorites.dart';
import 'package:travel_app/girisekrani.dart';

import 'categories.dart';

class Anasayfa extends StatelessWidget {
  const Anasayfa({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Anasayfa"),
        actions: [
          IconButton(
            onPressed: () {
              FirebaseAuth.instance.signOut().then((user) {
                //Giriş sayfasına yönlendir
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (_) => GirisEkrani()),
                    (route) => false);
              });
            },
            icon: Icon(Icons.exit_to_app),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              //BASLIK

              Padding(
                padding: const EdgeInsets.only(top: 24.0),
                child: Text(
                  "Travel App",
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
              ),

              //BANNER

              Padding(
                padding: EdgeInsets.only(top: 24),
                child: Container(
                  width: double.infinity,
                  padding:
                      EdgeInsets.only(left: 24, right: 36, top: 14, bottom: 18),
                  decoration: BoxDecoration(
                      color: Color(0xFF42A5F5),
                      borderRadius: BorderRadius.circular(6)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Gezilecek Yerler",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                            "sasds",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      Image.asset("assets/images/travel.jpg"),
                    ],
                  ),
                ),
              ),

              //BUTTONLAR

              Padding(
                padding: EdgeInsets.only(top: 48),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //ilk eleman
                    buildNavigation(
                        text: "Categories",
                        icon: Icons.menu,
                        widget: CategoriesPage(),
                        context: context
                    ),
                    buildNavigation(
                      text: "Favorites",
                      icon: Icons.star_border,
                      widget: FavoritesWidget(),
                      context: context,

                    ),
                    buildNavigation(
                      text: "Gifts",
                      icon: Icons.card_giftcard,
                    ),
                    buildNavigation(
                      text: "Best Place",
                      icon: Icons.add_a_photo,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 120,
              ),
              //PLACES
              Text(
                "PLACES",

                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Color(0xFF0A1034),
                ),
              ),
              SizedBox(
                height: 16,
              ),

              Container(

                padding:
                EdgeInsets.only(left: 12, right: 12, top: 12, bottom: 21),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2),
                        color: Color(0xFFE0ECF8),
                      ),
                      
                      child: Text(
                        "*****",
                        style: TextStyle(color: Color(0xFF1F53E4), fontSize: 16),
                      ),
                    ),
                    SizedBox(
                      height: 22,
                    ),
                    Image.asset("assets/images/img1.jpg"),
                    SizedBox(
                      height: 22,
                    ),
                    
                    Text("Galata Kulesi",style: TextStyle(
                      fontSize: 18,color: Color(0xFF0A1034),
                    ),),
                  ],
                ),
              ),




            ],
          ),
        ),
      ),
    );
  }
}

Widget buildNavigation(
    {required String text,
    required IconData icon,
    Widget? widget,
    BuildContext? context}) {
  return GestureDetector(
    onTap: () {
      Navigator.push(context!, MaterialPageRoute(builder: (context) {
        return widget!;
      }));
    },
    child: Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 19, vertical: 22),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.greenAccent,
          ),
          child: Icon(
            icon,
            color: Colors.blue,
            size: 18,
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          text,
          style: TextStyle(
            color: Colors.blue,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    ),
  );
}
