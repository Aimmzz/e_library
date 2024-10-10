import 'package:e_library/constant/custom_size.dart';
import 'package:e_library/main.dart';
import 'package:e_library/widgets/custom_stroke_button.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            gapH32,
            const Text(
              'Selamat Datang di E-Library!',
              style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            gapH16,
            const Text(
              'Simpan jutaan buku dan artikel kapan saja, di mana saja.',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: TextSize.subTitle,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            Image.asset(
              'assets/images/image_w.png',
              height: 300,
              width: 250,
            ),
            CustomStrokeButton(
              text: 'Masuk Ke Home',
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const BottomBar()),
                );
              },
              color: Colors.blue,
              size: const Size(200, 50),
            ),
            const Spacer(),
            const Text(
              '*Ini merupakan aplkasi yang dibuat untuk meyelesaikan technical test di Ciheul Technologies',
              style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: TextSize.regular,
                  color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      )),
    );
  }
}
