import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:travel_app/anasayfa.dart';
import 'package:travel_app/kayitekrani.dart';

class GirisEkrani extends StatefulWidget {
  const GirisEkrani({Key? key}) : super(key: key);

  @override
  State<GirisEkrani> createState() => _GirisEkraniState();
}

class _GirisEkraniState extends State<GirisEkrani> {
  //----------------- giriş parametreleri
  late String email, sifre;

  //doğrulama anahtarı
  var _foranahatari = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Giriş Ekranı"),
      ),
      body: Form(
        key: _foranahatari,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (yazilanEmail) {
                    email = yazilanEmail;
                  },
                  validator: (yazilanEmail) {
                    return yazilanEmail!.contains("@")
                        ? null
                        : "Geçersiz email";
                  },
                  decoration: InputDecoration(
                    labelText: "Email",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  obscureText: true,
                  onChanged: (yazilanSifre) {
                    sifre = yazilanSifre;
                  },
                  validator: (alinanSifre) {
                    return alinanSifre!.length >= 6
                        ? null
                        : "En az altı karakter";
                  },
                  decoration: InputDecoration(
                    labelText: "Şifre",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(8.0),
                height: 70,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    girisYap();
                  },
                  child: Text("Giriş"),
                ),
              ),
              GestureDetector(
                //---------HESAP YOKSA KAYIT SAYFASINA YÖNLENDİR
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => KayitEkrani()));
                },
                child: Container(
                  padding: EdgeInsets.all(8),
                  alignment: Alignment.centerRight,
                  child: Text(
                    "Hesabım yok...",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // email ve şifre doğrulamasına göre giriş sayfasına yönlendir
  void girisYap() {
    if (_foranahatari.currentState!.validate()) {
      //Giriş  yap
      FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: sifre)
          .then((user) {
        //Eğer başarılıysa anasayfaya git
        Navigator.pushAndRemoveUntil(context,
            MaterialPageRoute(builder: (_) => Anasayfa()), (route) => false);
      }).catchError((hata) {
        Fluttertoast.showToast(msg: hata);
      });
    }
  }
}
