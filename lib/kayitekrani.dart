import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_app/anasayfa.dart';
import 'package:travel_app/girisekrani.dart';

class KayitEkrani extends StatefulWidget {
  const KayitEkrani({Key? key}) : super(key: key);

  @override
  State<KayitEkrani> createState() => _KayitEkraniState();
}

class _KayitEkraniState extends State<KayitEkrani> {
  // kayıt parametreleri

  late String email, sifre;

  var _formAnahtari = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Firebase Kayıt"),
        centerTitle: true,
      ),
      body: Form(
        key: _formAnahtari,
        child: Container(
          padding: EdgeInsets.all(12.0),
          child: Padding(
            padding: const EdgeInsets.all(0.0),
            child: Column(
              children: [
                TextFormField(
                  onChanged: (yazilanEmail) {
                    setState(() {
                      email = yazilanEmail;
                    });
                  },
                  validator: (yazilanEmail) {
                    return yazilanEmail!.contains("@") ? null : "Mail geçersiz";
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: "Email girin...",
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  onChanged: (yazilanSifre) {
                    sifre = yazilanSifre;
                  },
                  validator: (yazilanSifre) {
                    return yazilanSifre!.length >= 6
                        ? null
                        : "6 karakter girin";
                  },
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "Şifre girin...",
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  width: double.infinity,
                  height: 60,
                  child: ElevatedButton(
                    onPressed: () {
                      kayitEkle();
                    },
                    child: Text("Kaydol"),
                    style: ElevatedButton.styleFrom(
                      textStyle: GoogleFonts.roboto(
                        fontSize: 24,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () {
                      //---------HESAP VARSA GİRİŞ SAYFASINA YÖNLENDİR

                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => GirisEkrani()));
                    },
                    child: Text(
                      "Zaten hesabım var...",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void kayitEkle() {
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: sifre)
        .then((user) {
      //-------- başarılıysa anasayfaya git
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (_) => Anasayfa()),
          (Route<dynamic> route) => false);
    }).catchError((hata) {
      //-------- başarısızsa hata mesajı ver
      Fluttertoast.showToast(msg: hata);
    });
  }
}
